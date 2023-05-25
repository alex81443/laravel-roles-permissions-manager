@section('title', __('Entidads'))
<div class="container-fluid">
	<div class="row justify-content-center">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<div style="display: flex; justify-content: space-between; align-items: center;">
						<div class="float-left">
							<h4><i class="fab fa-laravel text-info"></i>
							Entidad Listing </h4>
						</div>
						<div wire:poll.60s>
							<code><h5>{{ now()->format('H:i:s') }} UTC</h5></code>
						</div>
						@if (session()->has('message'))
						<div wire:poll.4s class="btn btn-sm btn-success" style="margin-top:0px; margin-bottom:0px;"> {{ session('message') }} </div>
						@endif
						<div>
							<input wire:model='keyWord' type="text" class="form-control" name="search" id="search" placeholder="Search Entidads">
						</div>
						
						@can('Entidad_create')
						<div class="btn btn-sm btn-info" data-toggle="modal" data-target="#createDataModal">
						<i class="fa fa-plus"></i>  Add Entidads
						@endcan
						</div>
					</div>
				</div>
				
				<div class="card-body">
						@include('livewire.entidads.create')
						@include('livewire.entidads.update')
				<div class="table-responsive">
					<table class="table table-bordered table-sm">
						<thead class="thead">
							<tr> 
								<td>#</td> 
								<th>Nombre</th>
								<th>Orden</th>
								<th>Ruta</th>
								<th>Icono</th>
								<th>Modulo Id</th>
								<th>Permiso</th>
								<td>ACTIONS</td>
							</tr>
						</thead>
						<tbody>
							@foreach($entidads as $row)
							<tr>
								<td>{{ $loop->iteration }}</td> 
								<td>{{ $row->nombre }}</td>
								<td>{{ $row->orden }}</td>
								<td>{{ $row->ruta }}</td>
								<td>{{ $row->icono }}</td>
								<td>{{ $row->modulo_id }}</td>
								<td>{{ $row->permiso }}</td>
								
								<td width="90">
								<div class="btn-group">
									<button type="button" class="btn btn-info btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									Actions
									</button>
									<div class="dropdown-menu dropdown-menu-right">
									@can('Entidad_edit')
									<a data-toggle="modal" data-target="#updateModal" class="dropdown-item" wire:click="edit({{$row->id}})"><i class="fa fa-edit"></i> Edit </a>							 
									@endcan
									@can('Entidad_delete')
									<a class="dropdown-item" onclick="confirm('Confirm Delete Entidad id {{$row->id}}? \nDeleted Entidads cannot be recovered!')||event.stopImmediatePropagation()" wire:click="destroy({{$row->id}})"><i class="fa fa-trash"></i> Delete </a>   
									@endcan
									</div>
								</div>
								</td>
							@endforeach
						</tbody>
					</table>						
					{{ $entidads->links() }}
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
