<!-- Modal -->
<div wire:ignore.self class="modal fade" id="updateModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
       <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateModalLabel">Update Permission</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span wire:click.prevent="cancel()" aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
					<input type="hidden" wire:model="selected_id">
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

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" wire:click.prevent="cancel()" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" wire:click.prevent="update()" class="btn btn-primary" data-dismiss="modal">Save</button>
            </div>
       </div>
    </div>
</div>
