{{-- resources/views/admin/dashboard.blade.php --}}
@extends('adminlte::page')
@section('title', 'La Toga :: ' . $titulo)

@section('content')
	<form
	action="{{ route('admin.subreporte.store')}}"
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
				<a href="@if(isset($list)){{route('admin.report.delete', [$list->id_rpt])}}@else{{route('admin.report.index')}}@endif" class="btn btn-lg btn-outline-secondary" role="button" data-toggle="tooltip" data-placement="top" title="Eliminar">
					<i class="icon-eliminar"></i>
				</a>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group col-xl-2 col-md-2 offset-xl-10 offset-md-8 text-right order-1 order-md-2 order-xl-2 d-flex justify-content-between">
			<div class="icheck-primary">
				<input name="hace_consulta" id="hace_consulta" type="checkbox" @if(isset($list)) @if($list->hace_consulta == 1) checked @endif @else checked @endif>
				<label for="hace_consulta">Consulta a BD</label>&nbsp;
			</div>
		</div>
	</div>
	<div class="row">
		<div class="form-group col-xl-4 col-md-4 col-12">
			<label for="descripcion">Reporte</label>
			<select name="id_rpt" id="id_rpt" class="select2">
				@foreach ($reportes as $reporte)
					<option value="{{$reporte->id_rpt}}">{{$reporte->descripcion}}</option>
				@endforeach
			</select>
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
