@extends('adminlte::page')

@section('content')

    	<div id="toolbar">
		
			<a href="{{route('admin.report.create')}}" class="btn btn-lg btn-outline-secondary" role="button" data-toggle="tooltip" data-placement="top" 	title="Nueva">
				<i class="fa fa-plus-circle" aria-hidden="true"></i>
			</a>
        
        </div>
			<a href="{{route('admin.subreporte.create')}}" class="btn btn-lg btn-outline-secondary" role="button" data-toggle="tooltip" data-placement="top" 	title="Nuevo Sub Reporte">
				<i class="icon-nuevo"></i>
			</a>
		
	</div>
	<table
	id="table_user"
	{{-- data-icons="{paginationSwitchDown: 'fa-caret-square-down',paginationSwitchUp: 'fa-caret-square-up',refresh: 'icon-actualizar',toggleOff: 'fa-toggle-off',toggleOn: 'fa-toggle-on',columns: 'icon-filtro',fullscreen: 'icon-expandir',detailOpen: 'fa-plus',detailClose: 'fa-minus'}" --}}
	data-toggle="table"
	data-toolbar="#toolbar"
	data-search="true"
	data-show-refresh="true"
	data-show-toggle="false"
	data-show-fullscreen="true"
	data-show-columns="true"
	data-click-to-select="true"
	data-minimum-count-columns="1"
	data-pagination="true"
	data-page-list="[10, 25, 50, 100, all]"
	data-url="{{route('admin.reportes')}}"
	data-classes="table table-striped table-borderless table-responsive-sm"
	data-buttons-class="btn btn-lg btn-outline-secondary"
	data-single-select="true"
	>
		<thead class="bg-light-blue">
			<tr>
				{{-- <th data-align="center" data-sortable="true" data-field="id_rpt">ID</th> --}}
				<th data-align="center" data-sortable="true" data-field="clave">Clave</th>
				<th data-align="center" data-sortable="true" data-field="descripcion">Nombre</th>
				<th data-align="center" data-sortable="true" data-field="archivo">Archivo</th>
				<th data-align="center" data-sortable="true" data-field="modulo">Módulo</th>
				<th data-align="center" data-field="edit">Editar</th> 
				<th data-align="center" data-field="exec">Ejecutar</th>
				<th data-align="center" data-sortable="true" data-field="estatus">Estatus</th>
			</tr>
		</thead>
		<tbody >
		</tbody>
	</table>

@endsection
