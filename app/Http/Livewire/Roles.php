<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Livewire\WithPagination;
use Illuminate\Support\Facades\Gate;
use Illuminate\Http\Response;
use App\Models\RoleWire;

class Roles extends Component
{
    use WithPagination;

	protected $paginationTheme = 'bootstrap';
    public $selected_id, $keyWord, $title, $short_code;
    public $updateMode = false;

    public function render()
    {
        abort_if(Gate::denies('Role_access'), Response::HTTP_FORBIDDEN, 'Forbidden');
		$keyWord = '%'.$this->keyWord .'%';
        return view('livewire.roles.view', [
            'roles' => RoleWire::latest()
						->orWhere('title', 'LIKE', $keyWord)
						->orWhere('short_code', 'LIKE', $keyWord)
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
		$this->title = null;
		$this->short_code = null;
    }

    public function store()
    {
        $this->validate([
		'title' => 'required',
        ]);

        RoleWire::create([ 
			'title' => $this-> title,
			'short_code' => $this-> short_code
        ]);
        
        $this->resetInput();
		$this->emit('closeModal');
		session()->flash('message', 'Role Successfully created.');
    }

    public function edit($id)
    {
        abort_if(Gate::denies('Role_edit'), Response::HTTP_FORBIDDEN, 'Forbidden');
        $record = RoleWire::findOrFail($id);

        $this->selected_id = $id; 
		$this->title = $record-> title;
		$this->short_code = $record-> short_code;
		
        $this->updateMode = true;
    }

    public function update()
    {
        $this->validate([
		'title' => 'required',
        ]);

        if ($this->selected_id) {
			$record = RoleWire::find($this->selected_id);
            $record->update([ 
			'title' => $this-> title,
			'short_code' => $this-> short_code
            ]);

            $this->resetInput();
            $this->updateMode = false;
			session()->flash('message', 'Role Successfully updated.');
        }
    }

    public function destroy($id)
    {
        abort_if(Gate::denies('Role_delete'), Response::HTTP_FORBIDDEN, 'Forbidden');
        if ($id) {
            $record = RoleWire::where('id', $id);
            $record->delete();
        }
    }
}
