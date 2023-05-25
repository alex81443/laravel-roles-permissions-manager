<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Livewire\WithPagination;
use Illuminate\Support\Facades\Gate;
use Illuminate\Http\Response;
use App\Models\Modulo;

class Modulos extends Component
{
    use WithPagination;

	protected $paginationTheme = 'bootstrap';
    public $selected_id, $keyWord, $nombre, $orden, $ruta, $icono,$nomod,$permiso;
    public $updateMode = false;

    public function render()
    {
        abort_if(Gate::denies('Modulo_access'), Response::HTTP_FORBIDDEN, 'Forbidden');
		$keyWord = '%'.$this->keyWord .'%';
        return view('livewire.modulos.view', [
            'modulos' => Modulo::latest()
						->orWhere('nombre', 'LIKE', $keyWord)
						->orWhere('orden', 'LIKE', $keyWord)
						->orWhere('ruta', 'LIKE', $keyWord)
						->orWhere('icono', 'LIKE', $keyWord)
						->paginate(10),
        ]);
    }
	
    public function cancel()
    {
        $this->resetInput();
        $this->updateMode = false;
    }
	public function mount(){
        $this->icono="fa fa-circle";
        $this->nomod=false;
    }
    private function resetInput()
    {		
		$this->nombre = null;
		$this->orden = null;
		$this->ruta = null;
		$this->icono = null;
        $this->permiso=null;
    }

    public function store()
    {
        $this->validate([
		'nombre' => 'required',
		'orden' => 'required',
		'ruta' => 'required',
		'icono' => 'required',
        'permiso' => 'required',
        ]);

        Modulo::create([ 
			'nombre' => $this-> nombre,
			'orden' => $this-> orden,
			'ruta' => $this-> ruta,
			'icono' => $this-> icono,
            'nomod' => $this-> nomod,
            'permiso' => $this->permiso,
        ]);
        
        $this->resetInput();
		$this->emit('closeModal');
		session()->flash('message', 'Modulo Successfully created.');
    }

    public function edit($id)
    {
        abort_if(Gate::denies('Modulo_edit'), Response::HTTP_FORBIDDEN, 'Forbidden');
        $record = Modulo::findOrFail($id);

        $this->selected_id = $id; 
		$this->nombre = $record-> nombre;
		$this->orden = $record-> orden;
		$this->ruta = $record-> ruta;
		$this->icono = $record-> icono;
		$this->nomod=$record->nomod;
        $this->updateMode = true;
        $this->permiso=$record->permiso;
    }

    public function update()
    {
        $this->validate([
		'nombre' => 'required',
		'orden' => 'required',
		'ruta' => 'required',
		'icono' => 'required',
        'permiso' => 'required',
        ]);

        if ($this->selected_id) {
			$record = Modulo::find($this->selected_id);
            $record->update([ 
			'nombre' => $this-> nombre,
			'orden' => $this-> orden,
			'ruta' => $this-> ruta,
			'icono' => $this-> icono,
            'nomod' => $this-> nomod,
            'permiso' => $this->permiso,
            ]);

            $this->resetInput();
            $this->updateMode = false;
			session()->flash('message', 'Modulo Successfully updated.');
        }
    }

    public function destroy($id)
    {
        abort_if(Gate::denies('Modulo_delete'), Response::HTTP_FORBIDDEN, 'Forbidden');
        if ($id) {
            $record = Modulo::where('id', $id);
            $record->delete();
        }
    }
}
