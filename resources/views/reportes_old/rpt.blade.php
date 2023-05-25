@extends($dsp)
@push('rpt_css')
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
@endpush
@section('content_header')
@if(isset($entidadmaster)){{$entidadmaster}}@endif
@endsection
@section('content')
<form id="form-reporte" method="post" action="{{route('result',[$reporte,$encrypt])}}" autocomplete="off">
    @csrf
    <div class="form-row">
        <div class="col-12">
            <div class="float-right">
                <a href="{{route('reporte.index', [$encrypt])}}" class="btn btn-lg btn-outline-secondary" role="button" data-toggle="tooltip" data-placement="top" title="Regresar">
                  <i class="fas fa-arrow-left"></i>
                </a>
                <a id="btn-filtros" class="btn btn-lg btn-outline-secondary" role="button" data-toggle="tooltip" data-placement="top" title="Desocultar Filtros">
                  <i class="fas fa-expand-arrows-alt"></i>
                </a>
                <button type="submit" class="btn btn-lg btn-outline-secondary" data-toggle="tooltip" data-placement="top" title="Mostrar Reporte">
                    <i class="fas fa-file-alt"></i>
                </button>
            </div>
        </div>
    </div>
    <div class="form-group row">
      <div id="filtros" class="col-md-4">
        @foreach ($filtros as $filtro)
            @include('reportes.filtro',['filtro'=>$filtro,'parametros'=>(isset($parametros) ? $parametros : null)])
        @endforeach
      </div>
      <div id="reporte" class="col-md-8">
        @isset ($pdf)
          <iframe src="{{ asset($pdf) }}" style="height:500px;width:100%" frameborder="0"></iframe>    
        @endisset 
      </div>
    </div>
</form>
@endsection
@push('js')
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script type="text/javascript">
    const locate = {
      "format": "DD/MM/YYYY",
      "separator": " - ",
      "applyLabel": "Seleccionar",
      "cancelLabel": "Cancelar",
      "fromLabel": "Desde",
      "toLabel": "Hasta",
      "customRangeLabel": "Pers.",
      "weekLabel": "S",
      "daysOfWeek": [
          "Do",
          "Lu",
          "Ma",
          "Mi",
          "Ju",
          "Vi",
          "Sa"
      ],
      "monthNames": [
          "Enero",
          "Febrero",
          "Marzo",
          "Abril",
          "Mayo",
          "Junio",
          "Julio",
          "Agosto",
          "Septiembre",
          "Octubre",
          "Noviembre",
          "Diciembre"
      ],
      "firstDay": 1
    };
    $('.singledatepicker').daterangepicker({
        singleDatePicker: true,
        showDropdowns: true,
        locale: locate
        }, function(start, end, label) {
            //console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
    });
    $('.datepicker').daterangepicker({
        showDropdowns: true,
        locale: locate
        }, function(start, end, label) {
            //console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
    });
</script>
<script type="text/javascript">

  var form = document.getElementById('form-reporte');
      btnFiltros = document.getElementById('btn-filtros');
      filtros = document.getElementById('filtros');
      reporte = document.getElementById('reporte');

  form.addEventListener('submit', ocultarFiltros, false);
  btnFiltros.addEventListener('click', function(){
    if (this.childNodes[1].classList.contains('fa-expand-arrows-alt')) {
      this.childNodes[1].classList.remove('fa-expand-arrows-alt')
      this.childNodes[1].classList.add('fa-compress-arrows-alt')
    }
    else{
      this.childNodes[1].classList.add('fa-expand-arrows-alt')
      this.childNodes[1].classList.remove('fa-compress-arrows-alt') 
    }
    
    if (filtros.classList.contains('d-none')) {
      aparecerFiltros();
    }
    else{
      ocultarFiltros();
    }
  }, false)

  function ocultarFiltros() {
    filtros.classList.remove('col-md-4');
    reporte.classList.remove('col-md-8');
    filtros.classList.add('d-none');
    reporte.classList.add('col-md-12');
  }

  function aparecerFiltros() {
    filtros.classList.remove('d-none');
    reporte.classList.remove('col-md-12');
    filtros.classList.add('col-md-4');
    reporte.classList.add('col-md-8'); 
  }
</script>
@endpush