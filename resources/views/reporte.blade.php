{{-- resources/views/admin/dashboard.blade.php --}}
@extends($dsp)
@section('title', 'Reporte')

@section('content_header')
    Reporte en pantalla
@stop

@section('content')
    <div class="row">
    	<div class="col-12">
    		<button onclick="mostrarPDF('{{$file}}')">Mostrar</button>
    	</div>
    </div>
    <div class="row d-none">
    	<object id="mostrar" data="" type="" class="col-12"></object>
    </div>
@stop

@section('sidebar')
	@parent
@stop

{{--
@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
@stop
--}}

@section('js')
    <script>
    function mostrarPDF(file) {
     	$('#mostrar')
     	.css('height', '500px')
     	.attr('data', file)
     	.parent('div')
     	.removeClass('d-none');
     }
    </script>
@stop
