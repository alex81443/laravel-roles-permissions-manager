{{-- resources/views/admin/dashboard.blade.php --}}
@extends('adminlte::page')
@section('title', 'La Toga :: ' . $titulo)

@section('content')
	<form
	action="@if(isset($list)){{route('admin.report.update', [$list->id_rpt]) }}@else{{ route('admin.report.store')}}@endif"
	method="post" enctype='multipart/form-data'>
	@if (isset($list))@method('PUT')@endif
	@csrf
	<div class="row">
		<div class="form-group col-xl-6 col-md-6 col-12">
			<h3>@if(isset($list)){{'Editar'}}@else{{'Nueva'}}@endif {{$titulo}}</h3>
		</div>
		<div class="form-group col-xl-6 col-md-6 col-12">
			<div class="form-inline float-right">
				<a href="{{route('admin.report.index')}}" class="btn btn-lg btn-outline-secondary" role="button" data-toggle="tooltip" data-placement="top" title="Regresar">
					<i class="fas fa-arrow-left"></i>
				</a>
				<button type="submit" class="btn btn-lg btn-outline-secondary" data-toggle="tooltip" data-placement="top" title="Guardar"><i class="icon-grabar-guardar"></i></button>
				<a href="@if(isset($list)){{route('admin.report.destroy', [$list->id_rpt])}}@else{{route('admin.report.index')}}@endif" class="btn btn-lg btn-outline-secondary" role="button" data-toggle="tooltip" data-placement="top" title="Eliminar">
					<i class="icon-eliminar"></i>
				</a>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group col-xl-4 col-md-4 col-12 order-2 order-md-1 order-xl-1">
			<input type="text" name="id_entidad" id="id_entidad" value="14" hidden>
			<label for="clave">Clave</label>
			<input class="form-control" type="text" id="clave" name="clave" required value="@if(isset($list)){{$list->clave}}@else{{old('clave')}}@endif" maxlength="45">
		</div>
		<div class="form-group col-xl-4 col-md-3 offset-xl-4 offset-md-3 text-right order-1 order-md-2 order-xl-2 d-flex justify-content-between">
			<div class="icheck-primary">
				<input name="user_session" id="user_session" type="checkbox" @if(isset($list)) @if($list->user_session == 1) checked @endif @elseif(old('user_session')) checked @endif>
				<label for="user_session">Sesión de Usuario</label>&nbsp;
			</div>
			<div class="icheck-primary">
				<input name="hace_consulta" id="hace_consulta" type="checkbox" @if(isset($list)) @if($list->hace_consulta == 1) checked @endif @elseif(old('hace_consulta')) checked @endif>
				<label for="hace_consulta">Consulta a BD</label>&nbsp;
			</div>
			<div class="icheck-primary">
				<input name="id_estatus" id="id_estatus" type="checkbox" @if(isset($list)) @if($list->estatus == 1) checked @endif @elseif(old('id_estatus')) checked @endif>
				<label for="id_estatus">Activo</label>&nbsp;
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group col-xl-4 col-md-4 col-12">
			<label for="descripcion">Nombre</label>
			<input type="text" class="form-control" id="nombre" name="nombre" value="@if (isset($list)) {{$list->descripcion}} @endif">
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
			<label for="archivo">Archivo JRXML</label>
			<div class="custom-file mb-3">
				<input type="file" class="custom-file-input" name="archivo" id="archivo" @if(!isset($list->archivo)) required @endif>
				@if (isset($list->archivo))
					<label class="custom-file-label mt-0" id="label-archivo" for="archivo">{{$list->archivo}}</label>
				@else
					<label class="custom-file-label mt-0" id="label-archivo" for="archivo">Examinar</label>
				@endif
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group col-xl-2 col-md-2 col-12">
			<label for="select-filtro">Seleccionar filtro:</label>
			<select name="select-filtro" id="select-filtro" class="select2">
				@foreach ($tipos_filtro as $filtro)
					<option value="{{$filtro->id_tip_filt}}">{{$filtro->tipo}}</option>
				@endforeach
			</select>
		</div>
		<div class="col-2" style="margin-top:32px;">
			<label for="">Añadir filtro</label>&nbsp;&nbsp;&nbsp;
			<a onclick="add_filtro()" class="btn btn-primary">+</a>
		</div>
	</div>
		<div class="row">
		<div class="form-group col-xl-4 col-md-4 col-12">
			<label for="modulo">Seleccionar modulo:</label>
			<select name="modulo" id="modulo" class="select2" required>
				@foreach ($modulos as $modulo)
					<option value="{{$modulo->id}}">{{$modulo->nombre}}</option>
				@endforeach
			</select>
		</div>
	</div>
		<div class="row">
		<div class="form-group col-xl-4 col-md-4 col-12">
			<label for="roles">Seleccionar roles:</label>
			<select name="roles[]" id="roles" class="select2" multiple="multiple" required>
				@foreach ($roles as $rol)
					<option value="{{$rol->id}}" @if(isset($list) && $list->roles->contains($rol->id)) selected @endif >{{$rol->title}}</option>
				@endforeach
			</select>
		</div>
	</div>
	<div class="row">
		<div id="filtros" class="col-md-12">
			@isset ($list->filtros)
				@foreach ($list->filtros as $filtro)
					@if ($filtro->id_tip_filt < 3)
					<div id="filtro-{{$filtro->orden}}" class="filtro py-3 row">
						<div class="col-1 boton">
							<a style="margin-top:32px" class="btn btn-danger" onclick="del_filtro({{$filtro->orden}})">X</a>
						</div>
						<div class="col-2 tipo">
							<label>Tipo:</label>
							<input type="text" class="form-control" name="filtros[{{$filtro->orden}}][tipo]" hidden value="{{$filtro->id_tip_filt}}">
							<input type="text" class="form-control" name="filtros[{{$filtro->orden}}][tipo2]" disabled value="{{$filtro->tipo}}">
						</div>
						<div class="col-2 id_filtro">
							<label>Id del filtro:</label>
							<input type="text" class="form-control" name="filtros[{{$filtro->orden}}][id_filtro]" value="{{$filtro->valor}}" required>
						</div>
						<div class="col-2 etiqueta">
							<label>Etiqueta del filtro:</label>
							<input type="text" class="form-control" name="filtros[{{$filtro->orden}}][etiqueta]" value="{{$filtro->etiqueta}}" required>
						</div>
						<div class="col-2 valor">
							<label>Valor a mostrar del filtro:</label>
							<input type="text" class="form-control" name="filtros[{{$filtro->orden}}][valor]" value="{{$filtro->texto}}" required>
						</div>
						<div class="col-2 orden">
							<label>Orden:</label>
							<input type="text" class="form-control" name="filtros[{{$filtro->orden}}][orden]" value="{{$filtro->orden}}" required>
						</div>
						<div class="col-12 mt-1 query">
							<label>Consulta SQL:</label>
							<textarea class="form-control" name="filtros[{{$filtro->orden}}][query]" cols="30" rows="5" required>{{$filtro->consulta}}</textarea>
						</div>
					</div>
					@else
					<div id="filtro-{{$filtro->orden}}" class="filtro py-3 row">
						<div class="col-1 boton">
							<a style="margin-top:32px" class="btn btn-danger" onclick="del_filtro({{$filtro->orden}})">X</a>
						</div>
						<div class="col-2 tipo">
							<label>Tipo:</label>
							<input type="text" class="form-control" name="filtros[{{$filtro->orden}}][tipo]" hidden value="{{$filtro->id_tip_filt}}">
							<input type="text" class="form-control" name="filtros[{{$filtro->orden}}][tipo2]" disabled value="{{$filtro->tipo}}">
						</div>
						<div class="col-3 id_filtro">
							<label>Id del filtro:</label>
							<input type="text" class="form-control" name="filtros[{{$filtro->orden}}][id_filtro]" value="{{$filtro->valor}}" required>
						</div>
						<div class="col-3 etiqueta">
							<label>Etiqueta del filtro:</label>
							<input type="text" class="form-control" name="filtros[{{$filtro->orden}}][etiqueta]" value="{{$filtro->etiqueta}}" required>
						</div>
						<div class="col-3 orden">
							<label>Orden:</label>
							<input type="text" class="form-control" name="filtros[{{$filtro->orden}}][orden]" value="{{$filtro->orden}}" required>
						</div>
					</div>
					@endif
				@endforeach			    
			@endisset
		</div>
	</div>
	</form>
@stop

@section('sidebar')
@parent
@stop

@section('js')
<script>
	function add_filtro() {
		let sf = $('#select-filtro');
			filtros = $('#filtros .filtro');
			filtro = parseInt(filtros.length) + 1;

		// console.log(sf.val(), filtros, filtro);

		if (sf.val() < 3) {
			$('#filtros').append('<div id="filtro-'+filtro+'" class="filtro py-3 row"><div class="col-1 boton">	<a style="margin-top:32px" class="btn btn-danger" onclick="del_filtro('+filtro+')">X</a>	</div>	<div class="col-2 tipo">	<label>Tipo:</label>	<input type="text" class="form-control" name="filtros['+filtro+'][tipo]" hidden value="'+sf.val()+'">	<input type="text" class="form-control" name="filtros['+filtro+'][tipo2]" disabled value="'+sf.children('option:selected').text()+'">	</div>	<div class="col-2 id_filtro">	<label>Id del filtro:</label>	<input type="text" class="form-control" name="filtros['+filtro+'][id_filtro]" value="" required>	</div>	<div class="col-2 etiqueta">	<label>Etiqueta del filtro:</label>	<input type="text" class="form-control" name="filtros['+filtro+'][etiqueta]" value="" required>	</div>	<div class="col-2 valor">	<label>Valor a mostrar del filtro:</label>	<input type="text" class="form-control" name="filtros['+filtro+'][valor]" value="" required>	</div>	<div class="col-2 orden">	<label>Orden:</label>	<input type="text" class="form-control" name="filtros['+filtro+'][orden]" value="'+filtro+'" required>	</div>	<div class="col-12 mt-1 query">	<label>Consulta SQL:</label>	<textarea class="form-control" name="filtros['+filtro+'][query]" cols="30" rows="5" required></textarea>	</div></div>');
		}
		else{
			$('#filtros').append('<div id="filtro-'+filtro+'" class="filtro py-3 row">	<div class="col-1 boton">	<a style="margin-top:32px" class="btn btn-danger" onclick="del_filtro('+filtro+')">X</a>	</div>	<div class="col-2 tipo">	<label>Tipo:</label>	<input type="text" class="form-control" name="filtros['+filtro+'][tipo]" hidden value="'+sf.val()+'">	<input type="text" class="form-control" name="filtros['+filtro+'][tipo2]" disabled value="'+sf.children('option:selected').text()+'">	</div>	<div class="col-3 id_filtro">	<label>Id del filtro:</label>	<input type="text" class="form-control" name="filtros['+filtro+'][id_filtro]" value="" required>	</div>	<div class="col-3 etiqueta">	<label>Etiqueta del filtro:</label>	<input type="text" class="form-control" name="filtros['+filtro+'][etiqueta]" value="" required>	</div>	<div class="col-3 orden">	<label>Orden:</label>	<input type="text" class="form-control" name="filtros['+filtro+'][orden]" value="'+filtro+'" required>	</div></div>');
		}
	}

	function del_filtro(orden) {
		$('#filtros #filtro-'+orden).remove();
		let filtros = $('#filtros .filtro');

		$.each(filtros, function(i, filtro) {
			c = i+1;
			filtro.id = 'filtro-'+c;
			 $.each($('#'+filtro.id).find('input, a'), function(index, val) {
			 	 if (val.parentNode.classList.contains('boton')) {
			 	 	console.log(val);
			 	 	val.setAttribute( "onClick", "del_filtro("+c+");" );
			 	 }
			 	 if (val.parentNode.classList.contains('tipo')) {
			 	 	val.name = 'filtros['+c+'][tipo]';
			 	 }
			 	 if (val.parentNode.classList.contains('tipo2')) {
			 	 	val.name = 'filtros['+c+'][tipo2]';
			 	 }
			 	 if (val.parentNode.classList.contains('id_filtro')) {
			 	 	val.name = 'filtros['+c+'][id_filtro]';
			 	 }
			 	 if (val.parentNode.classList.contains('reporte.index')) {
			 	 	val.name = 'filtros['+c+'][etiqueta]';
			 	 }
			 	 if (val.parentNode.classList.contains('valor')) {
			 	 	val.name = 'filtros['+c+'][valor]';
			 	 }
			 	 if (val.parentNode.classList.contains('orden')) {
			 	 	val.name = 'filtros['+c+'][orden]';
			 	 	val.value = c;
			 	 }
			 	 if (val.parentNode.classList.contains('query')) {
			 	 	val.name = 'filtros['+c+'][query]';
			 	 }
			 });
		});
	}

	function handleFileSelect(evt) {
	  var files = evt.target.files; // FileList object
	  console.log(files);
	  // Loop through the FileList and render image files as thumbnails.
	  document.getElementById('label-archivo').textContent = files[0].name;
	}
	document.getElementById('archivo').addEventListener('change', handleFileSelect, false);
</script>
@stop
