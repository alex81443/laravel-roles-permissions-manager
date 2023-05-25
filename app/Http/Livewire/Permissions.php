<?php

namespace App\Http\Livewire;

use App\Models\Entidad;
use Livewire\Component;
use Livewire\WithPagination;
use Illuminate\Support\Facades\Gate;
use Illuminate\Http\Response;
use App\Models\Permission;

class Permissions extends Component
{
    use WithPagination;

	protected $paginationTheme = 'bootstrap';
    public $selected_id, $keyWord, $name, $entidad_id,$entidades,$mod;
    public $updateMode = false;
    

    public function render()
    {
        abort_if(Gate::denies('Permission_access'), Response::HTTP_FORBIDDEN, 'Forbidden');
		$keyWord = '%'.$this->keyWord .'%';
        return view('livewire.permissions.view', [
            'permissions' => Permission::latest()
						->orWhere('name', 'LIKE', $keyWord)->orderby('entidad_id')
						->orWhere('entidad_id', 'LIKE', $keyWord)
						->paginate(10),
        ]);
    }
	
    public function cancel()
    {
        $this->resetInput();
        $this->updateMode = false;
    }
    public function mount(){
        $this->mod=false;
        $this->entidades=Entidad::all();
        $this->permisos=Permission::all();
        $this->entidad_id=1;
        }
    private function resetInput()
    {		
		$this->name = null;
		$this->entidad_id = null;
    }

    public function store()
    {
        
        $this->validate([
		'name' => 'required',
        ]);
        
        if($this->mod==true){
            Permission::create([ 
                'name' => $this-> name."_access",
                'entidad_id' => $this-> entidad_id
            ]);
            Permission::create([ 
                'name' => $this-> name."_edit",
                'entidad_id' => $this-> entidad_id
            ]);
            Permission::create([ 
                'name' => $this-> name."_delete",
                'entidad_id' => $this-> entidad_id
            ]);
            Permission::create([ 
                'name' => $this-> name."_create",
                'entidad_id' => $this-> entidad_id
            ]);
            Permission::create([ 
                'name' => $this-> name."_show",
                'entidad_id' => $this-> entidad_id
            ]);

        }else{
            Permission::create([ 
                'name' => $this-> name,
                'entidad_id' => $this-> entidad_id
            ]);
        }
       
        
        $this->resetInput();
		$this->emit('closeModal');
		session()->flash('message', 'Permission Successfully created.');
    }

    public function edit($id)
    {
        abort_if(Gate::denies('Permission_edit'), Response::HTTP_FORBIDDEN, 'Forbidden');
        $record = Permission::findOrFail($id);
        $this->entidades=Entidad::all();
        
        $this->selected_id = $id; 
		$this->name = $record-> name;
		$this->entidad_id = $record-> entidad_id;
		
        $this->updateMode = true;
    }

    public function update()
    {
        $this->validate([
		'name' => 'required',
        ]);

        if ($this->selected_id) {
			$record = Permission::find($this->selected_id);
            $record->update([ 
			'name' => $this-> name,
			'entidad_id' => $this-> entidad_id
            ]);

            $this->resetInput();
            $this->updateMode = false;
			session()->flash('message', 'Permission Successfully updated.');
        }
    }

    public function destroy($id)
    {
        abort_if(Gate::denies('Permission_delete'), Response::HTTP_FORBIDDEN, 'Forbidden');
        if ($id) {
            $record = Permission::where('id', $id);
            $record->delete();
        }
    }
}
