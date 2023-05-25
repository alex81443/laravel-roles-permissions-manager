<label for="{{$filtro->valor}}" class=" col-form-label">{{$filtro->etiqueta}}</label>
{!!GetControl($filtro,(!empty($parametros) ? $parametros[$filtro->valor] : old($filtro->valor)))!!}		
