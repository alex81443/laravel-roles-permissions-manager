<!-- Modal -->
<div wire:ignore.self class="modal fade" id="createDataModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="createDataModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="createDataModalLabel">Create New Permission</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true close-btn">×</span>
                </button>
            </div>
           <div class="modal-body">
				<form>
            <div class="form-group">
                <label for="name"></label>
                <input wire:model="name" type="text" class="form-control" id="name" placeholder="Name">@error('name') <span class="error text-danger">{{ $message }}</span> @enderror
            </div>
         

            <div class="form-group">
                <label for="entidad_id"></label>
                <select wire:model="entidad_id" class="form-control select2" id="entidad_id" name="entidad_id" placeholder="entidad_id">
                    <option value="0">Sin Entidad Asignada</option>
                    @foreach($entidades      as $item)
                        <option value="{{$item->id}}">{{$item->nombre}}</option>
                    @endforeach
                </select>
                @error('entidad_id') <span class="error text-danger">{{ $message }}</span> @enderror
                {{--<input wire:model="modulo_id" type="text" class="form-control" id="modulo_id" placeholder="Modulo Id">@error('modulo_id') <span class="error text-danger">{{ $message }}</span> @enderror--}}
            </div>
            <label><input wire:model="mod" name="mod" type="checkbox" id="cbox1">Generar permisos CRUD para esta entidad</label><br>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary close-btn" data-dismiss="modal">Close</button>
                <button type="button" wire:click.prevent="store()" class="btn btn-primary close-modal">Save</button>
            </div>
        </div>
    </div>
</div>
