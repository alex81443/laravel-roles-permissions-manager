<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Livewire\WithPagination;
use Illuminate\Support\Facades\Gate;
use Illuminate\Http\Response;
use App\Models\Entidad;
use App\Models\Modulo;

class Entidads extends Component
{
    use WithPagination;

	protected $paginationTheme = 'bootstrap';
    public $selected_id, $keyWord, $nombre, $orden, $ruta, $icono, $modulo_id,$modulos,$permiso;
    public $updateMode = false;

    public function render()
    {
        abort_if(Gate::denies('Entidad_access'), Response::HTTP_FORBIDDEN, 'Forbidden');
		$keyWord = '%'.$this->keyWord .'%';
        return view('livewire.entidads.view', [
            'entidads' => Entidad::latest()
						->orWhere('nombre', 'LIKE', $keyWord)
						->orWhere('orden', 'LIKE', $keyWord)
						->orWhere('ruta', 'LIKE', $keyWord)
						->orWhere('icono', 'LIKE', $keyWord)
						->orWhere('modulo_id', 'LIKE', $keyWord)
						->paginate(10),
        ]);
    }
	
    public function cancel()
    {
        $this->resetInput();
        $this->updateMode = false;
    }
    public function mount(){
	$this->modulos=Modulo::all();
    $this->icono="fa fa-circle";
    $this->modulo_id=1;
	}
	
    private function resetInput()
    {		
		$this->nombre = null;
		$this->orden = null;
		$this->ruta = null;
		$this->icono = null;
		$this->modulo_id = null;
        $this->permiso=null;
    }

    public function store()
    {
        $this->validate([
		'nombre' => 'required',
		'orden' => 'required',
		'ruta' => 'required',
		'icono' => 'required',
		'modulo_id' => 'required',
        'permiso' => 'required',
        ]);

        Entidad::create([ 
			'nombre' => $this-> nombre,
			'orden' => $this-> orden,
			'ruta' => $this-> ruta,
			'icono' => $this-> icono,
			'modulo_id' => $this-> modulo_id,
            'permiso' => $this->permiso,
        ]);
        
        $this->resetInput();
		$this->emit('closeModal');
		session()->flash('message', 'Entidad Successfully created.');
    }

    public function edit($id)
    {
        abort_if(Gate::denies('Entidad_edit'), Response::HTTP_FORBIDDEN, 'Forbidden');
        $record = Entidad::findOrFail($id);
        $this->modulos=Modulo::all();
        
        $this->selected_id = $id; 
		$this->nombre = $record-> nombre;
		$this->orden = $record-> orden;
		$this->ruta = $record-> ruta;
		$this->icono = $record-> icono;
		$this->modulo_id = $record-> modulo_id;
        $this->permiso=$record->permiso;
		
        $this->updateMode = true;
    }

    public function update()
    {
        $this->validate([
		'nombre' => 'required',
		'orden' => 'required',
		'ruta' => 'required',
		'icono' => 'required',
		'modulo_id' => 'required',
        'permiso' => 'required',
        ]);

        if ($this->selected_id) {
			$record = Entidad::find($this->selected_id);
            $record->update([ 
			'nombre' => $this-> nombre,
			'orden' => $this-> orden,
			'ruta' => $this-> ruta,
			'icono' => $this-> icono,
			'modulo_id' => $this-> modulo_id,
            'permiso' => $this->permiso,
            ]);

            $this->resetInput();
            $this->updateMode = false;
			session()->flash('message', 'Entidad Successfully updated.');
        }
    }

    public function destroy($id)
    {
        abort_if(Gate::denies('Entidad_delete'), Response::HTTP_FORBIDDEN, 'Forbidden');
        if ($id) {
            $record = Entidad::where('id', $id);
            $record->delete();
        }
    }
}
