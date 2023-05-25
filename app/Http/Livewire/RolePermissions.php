<?php

namespace App\Http\Livewire;

use App\Models\Entidad;
use App\Models\Firstlogin;
use App\Models\Permission;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Livewire\Component;
use Livewire\WithFileUploads;

class RolePermissions extends Component
{
    use WithFileUploads;
    public $usuario,$nombre,$photo,$email,$contraseña,$fl;
    public function render()
    {   $this->fl=(Firstlogin::where('id_usuario',Auth::user()->id)->first())?1:0;
        return view('livewire.perfil.role-permissions');
        /*
        if($this->fl==0){
            return view('livewire.perfil.role-permissions');
        }else{
            return view('livewire.perfil.firslog');
        }*/
        
    }
    public function mount(){
        $this->fl=(Firstlogin::where('id_usuario',Auth::user()->id)->first())?1:0;
        $this->usuario=Auth::user();
        $this->nombre=Auth::user()->name;
        $this->email=Auth::user()->email;
        $this->photo = '';
    }
    public function store(){
        
        
        $user=User::find(Auth::user()->id);
       // $user->name = $this->nombre;
        if($this->photo){
            $user->addMedia($this->photo->getRealPath())->toMediaCollection('profile_picture');}
        //$user->save();
        return redirect('/admin/perfil')->with('status-success','Permission Updated');

    }
    public function firtslogin(){
        $this->validate([
            'photo' => 'required',
            'contraseña' => 'required',
            ]);
        
        $user=User::find(Auth::user()->id);
       // $user->name = $this->nombre;
            $user->password= bcrypt($this->contraseña);
        if($this->photo){
            $user->addMedia($this->photo->getRealPath())->toMediaCollection('profile_picture');}
            $first=Firstlogin::where('id_usuario',Auth::user()->id)->first();
            $user->role_id=$first->id_role;
            $user->save();
            $first->delete();
            auth()->logout();
            return redirect()->route('login');
        //return redirect('/admin/perfil')->with('status-success','Permission Updated');

    }
   
}
