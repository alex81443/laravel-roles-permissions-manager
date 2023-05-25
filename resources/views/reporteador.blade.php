@php
	$titulo = '';
@endphp
@extends($dsp)

@section('title', 'La Toga :: ' . $titulo)


@section('content')
<div class="row">
  <div class="col-md-12">
    <div class="box box-default box-solid ">
      <div class="box-header with-border">
        <h3 class="box-title">Expandable</h3>

        <div class="box-tools pull-right">
          <button type="button" class="btn btn-box-tool" data-widget="collapse">
            <i class="fa fa-plus"></i>
          </button>
        </div>
        <!-- /.box-tools -->
      </div>
      <!-- /.box-header -->
      <div class="box-body">

       {{--  <div class="row">
          
          <div class="col-md-12">
            <div class="box box-warning box-solid">
              <div class="box-header with-border">
                <h3 class="box-title">Collapsable</h3>

                <div class="box-tools pull-right">
                  <button type="button" class="btn btn-box-tool" data-widget="collapse">
                    <i class="fa fa-minus"></i>
                  </button>
                </div>
                <!-- /.box-tools -->
              </div>
              <!-- /.box-header -->
              <div class="box-body" style="">
                The body of the box
              </div>
              <!-- /.box-body -->
            </div>
            <!-- /.box -->
          </div>

        </div> --}}

      </div>
      <!-- /.box-body -->
    </div>
    <!-- /.box -->
  </div>
</div>
	<div class="row">
		<div class="col-md-12">
			<div class="box box-solid box-primary">
				<div class="box-header">
					<h3 class="box-title">Catalogo de {{$titulo}}</h3>
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col-md-12">
							<div id="toolbar">
					            <a href="{{route('etiqueta.create')}}" class="btn btn-primary" role="button">
					                <i class="icon-busqueda
"></i>
					                Filtrar
					            </a>
					        </div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<table 
							class="table table-bordered table-striped table-borderless table-responsive-sm"
							id="table_user"
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
				            data-url="{{route('etiquetas')}}"
				            data-buttons-class="primary"
				            data-single-select="true"
							>
								<thead class="bg-light-blue">
						            <tr>
						                <th data-align="center" data-sortable="true" data-field="clave">Clave</th>
						                <th data-align="center" data-sortable="true" data-field="descripcion">Etiqueta</th>
						                <th data-align="center" data-sortable="true" data-field="id_dia">Dia</th>
						                <th data-align="center" data-sortable="true" data-field="color">Color</th>
						                <th data-align="center" data-sortable="true" data-field="id_estatus">Estatus</th>
						                <th data-switchable="false" data-align="center" data-field="id_link"></th>
						            </tr>
					            </thead>
					            <tbody >
					            </tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
@stop

@section('sidebar')
	@parent
@stop


@section('js')
@stop