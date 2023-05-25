<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Livewire\WithPagination;
use Illuminate\Support\Facades\Gate;
use Illuminate\Http\Response;
use App\Models\Size;

class Sizes extends Component
{
    use WithPagination;

	protected $paginationTheme = 'bootstrap';
    public $selected_id, $keyWord, $descripcion, $nombreCorto;
    public $updateMode = false;

    public function render()
    {
        abort_if(Gate::denies('Size_access'), Response::HTTP_FORBIDDEN, 'Forbidden');
		$keyWord = '%'.$this->keyWord .'%';
        return view('livewire.sizes.view', [
            'sizes' => Size::latest()
						->orWhere('descripcion', 'LIKE', $keyWord)
						->orWhere('nombreCorto', 'LIKE', $keyWord)
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
		$this->descripcion = null;
		$this->nombreCorto = null;
    }

    public function store()
    {
        $this->validate([
		'descripcion' => 'required',
		'nombreCorto' => 'required',
        ]);

        Size::create([ 
			'descripcion' => $this-> descripcion,
			'nombreCorto' => $this-> nombreCorto
        ]);
        
        $this->resetInput();
		$this->emit('closeModal');
		session()->flash('message', 'Size Successfully created.');
    }

    public function edit($id)
    {
        abort_if(Gate::denies('Size_edit'), Response::HTTP_FORBIDDEN, 'Forbidden');
        $record = Size::findOrFail($id);

        $this->selected_id = $id; 
		$this->descripcion = $record-> descripcion;
		$this->nombreCorto = $record-> nombreCorto;
		
        $this->updateMode = true;
    }

    public function update()
    {
        $this->validate([
		'descripcion' => 'required',
		'nombreCorto' => 'required',
        ]);

        if ($this->selected_id) {
			$record = Size::find($this->selected_id);
            $record->update([ 
			'descripcion' => $this-> descripcion,
			'nombreCorto' => $this-> nombreCorto
            ]);

            $this->resetInput();
            $this->updateMode = false;
			session()->flash('message', 'Size Successfully updated.');
        }
    }

    public function destroy($id)
    {
        abort_if(Gate::denies('Size_delete'), Response::HTTP_FORBIDDEN, 'Forbidden');
        if ($id) {
            $record = Size::where('id', $id);
            $record->delete();
        }
    }
}
