<!-- Modal -->
<div wire:ignore.self class="modal fade" id="createDataModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="createDataModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="createDataModalLabel">Create New Modulo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true close-btn">×</span>
                </button>
            </div>
           <div class="modal-body">
				<form>
            <div class="form-group">
                <label for="nombre"></label>
                <input wire:model="nombre" type="text" class="form-control" id="nombre" placeholder="Nombre">@error('nombre') <span class="error text-danger">{{ $message }}</span> @enderror
            </div>
            <div class="form-group">
                <label for="orden"></label>
                <input wire:model="orden" type="text" class="form-control" id="orden" placeholder="Orden">@error('orden') <span class="error text-danger">{{ $message }}</span> @enderror
            </div>
            <div class="form-group">
                <label for="ruta"></label>
                <input wire:model="ruta" type="text" class="form-control" id="ruta" placeholder="Ruta">@error('ruta') <span class="error text-danger">{{ $message }}</span> @enderror
            </div>
            <div class="form-group">
                <label for="icono"></label>
                <input wire:model="icono" type="text" class="form-control" id="icono" placeholder="Icono">@error('icono') <span class="error text-danger">{{ $message }}</span> @enderror
            </div>
            <div class="form-group">
                <label for="permiso"></label>
                <input wire:model="permiso" type="permiso" class="form-control" id="permiso" placeholder="permiso">@error('permiso') <span class="error text-danger">{{ $message }}</span> @enderror
            </div>
            <label><input wire:model="nomod" name="nomod" type="checkbox" id="cbox1">¿No es modulo?</label><br>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary close-btn" data-dismiss="modal">Close</button>
                <button type="button" wire:click.prevent="store()" class="btn btn-primary close-modal">Save</button>
            </div>
        </div>
    </div>
</div>
