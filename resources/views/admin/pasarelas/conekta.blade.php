@extends('adminlte::page')
@section('content')
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-md-12">
            
            <div class="card card-primary">
                
    
                <div class="card-header">
                  {{--<h3 class="card-title">Quick Example</h3>--}}
                  <img src="https://assets.conekta.com/website/Home/conekta-logo-blue-full.svg"  width="200">
                </div>
                <!-- /.card-header -->
                <!-- form start -->
                <form>
                  <div class="card-body">
                    Producción
                    <div class="row">
                        
                    <div class="form-group col-6">
                      <label for="private_key">Private_key</label>
                      <input type="text" class="form-control" id="private_key" placeholder="private_key" value="{{$conekta->private_key}}">
                    </div>
                    <div class="form-group col-6">
                        <label for="public_key">Public_key</label>
                        <input type="text" class="form-control" id="public_key" placeholder="public_key" value="{{$conekta->public_key}}">
                      </div>
                    </div>

                    Desarrollo
                    <div class="row">
                        
                    <div class="form-group col-6">
                      <label for="private_key_test">Private_key</label>
                      <input type="text" class="form-control" id="private_key" placeholder="private_key_test" value="{{$conekta->private_key_test}}">
                    </div>
                    <div class="form-group col-6">
                        <label for="public_key_test">Public_key</label>
                        <input type="text" class="form-control" id="public_key" placeholder="public_key_test" value="{{$conekta->public_key_test}}">
                      </div>
                    </div>
                    
                    {{--<div class="form-check">
                      <input type="checkbox" class="form-check-input" id="exampleCheck1">
                      <label class="form-check-label" for="exampleCheck1">Produccion Activado</label>
                    </div>--}}
                  </div>
                  <!-- /.card-body -->
  
                  <div class="card-footer">
                    <button type="submit" class="btn btn-primary">Submit</button>
                  </div>
                </form>
              </div>
        </div>     
    </div>   
</div>
@endsection
