<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Livewire\WithPagination;
use Illuminate\Support\Facades\Gate;
use Illuminate\Http\Response;
use App\Models\Post;

class Posts extends Component
{
    use WithPagination;

	protected $paginationTheme = 'bootstrap';
    public $selected_id, $keyWord, $nombre, $descripcion;
    public $updateMode = false;

    public function render()
    {
        abort_if(Gate::denies('Post_access'), Response::HTTP_FORBIDDEN, 'Forbidden');
		$keyWord = '%'.$this->keyWord .'%';
        return view('livewire.posts.view', [
            'posts' => Post::latest()
						->orWhere('nombre', 'LIKE', $keyWord)
						->orWhere('descripcion', 'LIKE', $keyWord)
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
		$this->descripcion = null;
    }

    public function store()
    {
        $this->validate([
		'nombre' => 'required',
		'descripcion' => 'required',
        ]);

        Post::create([ 
			'nombre' => $this-> nombre,
			'descripcion' => $this-> descripcion
        ]);
        
        $this->resetInput();
		$this->emit('closeModal');
		session()->flash('message', 'Post Successfully created.');
    }

    public function edit($id)
    {
        abort_if(Gate::denies('Post_edit'), Response::HTTP_FORBIDDEN, 'Forbidden');
        $record = Post::findOrFail($id);

        $this->selected_id = $id; 
		$this->nombre = $record-> nombre;
		$this->descripcion = $record-> descripcion;
		
        $this->updateMode = true;
    }

    public function update()
    {
        $this->validate([
		'nombre' => 'required',
		'descripcion' => 'required',
        ]);

        if ($this->selected_id) {
			$record = Post::find($this->selected_id);
            $record->update([ 
			'nombre' => $this-> nombre,
			'descripcion' => $this-> descripcion
            ]);

            $this->resetInput();
            $this->updateMode = false;
			session()->flash('message', 'Post Successfully updated.');
        }
    }

    public function destroy($id)
    {
        abort_if(Gate::denies('Post_delete'), Response::HTTP_FORBIDDEN, 'Forbidden');
        if ($id) {
            $record = Post::where('id', $id);
            $record->delete();
        }
    }
}
