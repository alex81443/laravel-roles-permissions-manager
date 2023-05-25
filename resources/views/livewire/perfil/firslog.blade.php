<div>
<div class="row">
  First Login
    <div class="col-md-3"></div>
     <!-- Profile Image -->
     <div class="card card-primary card-outline col-md-6">
        <div class="card-body box-profile">
          <div class="text-center">
            @if($photo)
            <img class="profile-user-img img-fluid img-circle"
            src="{{ $photo->temporaryUrl() }}"
                alt="User profile picture"> 
            @else
            <img class="profile-user-img img-fluid img-circle"
                src="{{ $usuario->getFirstMediaUrl('profile_picture') }}"
                alt="User profile picture">
            @endif    
          </div>
          
          

          <h3 class="profile-username text-center">{{$usuario->name}}</h3>

          <p class="text-muted text-center">{{$usuario->email}}</p>

          <form>  
            <div class="form-group">
            <label for="exampleInputEmail1" >Email address</label>
            <input type="email" wire:model="email" disabled class="form-control" id="exampleInputEmail1" placeholder="Enter email">
            </div>
            <div class="form-group">
            <label for="exampleInputPassword1" >Password</label>
            <input type="password" wire:model="contraseña" required class="form-control" id="exampleInputPassword1" placeholder="Password">
            </div>
            <div class="form-group">
            <label for="exampleInputFile">File input</label>
            <div class="input-group">
            <div class="custom-file">
            <input required type="file" class="custom-file-input" id="exampleInputFile"  wire:model="photo">
            <label class="custom-file-label" for="exampleInputFile">Choose file</label>
            </div>
          
            </div>
            </div>
<div class="form-group">
    

    @error('photo') <span class="error">{{ $message }}</span> @enderror
</div>
<button type="button" wire:click.prevent="store()" class="btn btn-primary">Save</button>
</form>


        </div>
        <!-- /.card-body -->
      </div>
      
     
    </div>


</div>



