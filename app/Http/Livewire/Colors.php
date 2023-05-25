<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Livewire\WithPagination;
use Illuminate\Support\Facades\Gate;
use Illuminate\Http\Response;
use App\Models\Color;

class Colors extends Component
{
    use WithPagination;

	protected $paginationTheme = 'bootstrap';
    public $selected_id, $keyWord, $nombre, $name, $codigo;
    public $updateMode = false;

    public function render()
    {
        abort_if(Gate::denies('Color_access'), Response::HTTP_FORBIDDEN, 'Forbidden');
		$keyWord = '%'.$this->keyWord .'%';
        return view('livewire.colors.view', [
            'colors' => Color::latest()
						->orWhere('nombre', 'LIKE', $keyWord)
						->orWhere('name', 'LIKE', $keyWord)
						->orWhere('codigo', 'LIKE', $keyWord)
						->paginate(10),
        ]);
    }
	
    public function cancel()
    {
        $this->resetInput();
        $this->updateMode = false;
    }
	
    private function resetInput()
    {		
		$this->nombre = null;
		$this->name = null;
		$this->codigo = null;
    }

    public function store()
    {
        $this->validate([
		'nombre' => 'required',
        ]);

        Color::create([ 
			'nombre' => $this-> nombre,
			'name' => $this-> name,
			'codigo' => $this-> codigo
        ]);
        
        $this->resetInput();
		$this->emit('closeModal');
		session()->flash('message', 'Color Successfully created.');
    }

    public function edit($id)
    {
        abort_if(Gate::denies('Color_edit'), Response::HTTP_FORBIDDEN, 'Forbidden');
        $record = Color::findOrFail($id);

        $this->selected_id = $id; 
		$this->nombre = $record-> nombre;
		$this->name = $record-> name;
		$this->codigo = $record-> codigo;
		
        $this->updateMode = true;
    }

    public function update()
    {
        $this->validate([
		'nombre' => 'required',
        ]);

        if ($this->selected_id) {
			$record = Color::find($this->selected_id);
            $record->update([ 
			'nombre' => $this-> nombre,
			'name' => $this-> name,
			'codigo' => $this-> codigo
            ]);

            $this->resetInput();
            $this->updateMode = false;
			session()->flash('message', 'Color Successfully updated.');
        }
    }

    public function destroy($id)
    {
        abort_if(Gate::denies('Color_delete'), Response::HTTP_FORBIDDEN, 'Forbidden');
        if ($id) {
            $record = Color::where('id', $id);
            $record->delete();
        }
    }
}
