@extends('layouts.admin')

@section('content')

    <div class="card">
        <div class="card-header">{{ __('Edit Role') }}</div>

        <div class="card-body">
            <form method="POST" action="{{ route('admin.roles.update', $role->id) }}">
                @csrf
                @method('PUT')


                <div class="form-group row">
                    <label for="title" class="required col-md-1 col-form-label text-md-right">{{ __('Title') }}</label>

                    <div class="col-md-4">
                        <input id="text" type="title" class="form-control @error('title') is-invalid @enderror" name="title" value="{{ old('title', $role->title) }}" required autocomplete="title">

                        @error('title')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                    <label for="short_code" class="col-md-2 col-form-label text-md-right">{{ __('Short Code') }}</label>

                    <div class="col-md-4">
                        <input id="text" type="short_code" class="form-control @error('short_code') is-invalid @enderror" name="short_code" value="{{ old('short_code', $role->short_code) }}" autocomplete="short_code">

                        @error('short_code')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                </div>


                <div class="form-group row">
                    
                </div>

                {{--<div class="form-group row">
                    <label for="permissions" class="col-md-4 col-form-label text-md-right">{{ __('Permissions') }}</label>

                    <div class="col-md-6" id="permissions-select">
                        <select name="permissions[]" id="permissions" class="@error('permissions') is-invalid @enderror"  multiple>
                            @foreach ($permissions as $id => $permission)
                                <option value="{{ $id }}" {{ (in_array($id, old('permissions', [])) || $role->permissions->contains($id)) ? 'selected' : '' }}>{{ $permission }}</option>
                            @endforeach
                        </select>
                        <a href="#" id="permission-select-all" class="btn btn-link">select all</a>
                        <a href="#" id="permission-deselect-all" class="btn btn-link">deselect all</a>

                        @error('permissions')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror

                    </div>
                </div>--}}
                <div>
                    <div class="row">
                    @foreach ($entidades as $entidad)
                    <div class="col-md-4">
                        <div class="card card-primary collapsed-card " >
                            <div class="card-header ">
                              <h3 class="card-title">{{$entidad->nombre}}</h3>
                          
                              <div class="card-tools ">
                                
                                <!-- This will cause the card to collapse when clicked -->
                                <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i></button>
                                
                              </div>
                              <!-- /.card-tools -->
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body " >
                                @foreach ($permisos as $permiso)
                                @if ($permiso->entidad_id==$entidad->id)
                                     <ol><input type="checkbox" onclick="myFunction({{$permiso->id}},{{$role->id}})" name="permissions[]" id="permiso-{{$permiso->id}}" value="{{$permiso->id}}" @if (seleccionado($permiso->id,$role->id)==1)checked
                                         
                        
                                         
                                     @endif> {{$permiso->name}}</ol>
                                @endif
                                    
                                @endforeach
                            </div>
                            <!-- /.card-body -->
                          </div>
                          <!-- /.card -->
                        </div>                        
                       
                    @endforeach
                    <div class="col-md-4">
                        <div class="card card-primary collapsed-card" >
                            <div class="card-header ">
                              <h3 class="card-title">Sin Entidad Asignada</h3>
                          
                              <div class="card-tools ">
                                
                                <!-- This will cause the card to collapse when clicked -->
                                <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i></button>
                                
                              </div>
                              <!-- /.card-tools -->
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body " >
                                @foreach ($permisos as $permiso)
                                @if ($permiso->entidad_id==0)
                                     <ol><input type="checkbox" onclick="myFunction({{$permiso->id}},{{$role->id}})" name="permissions[]" id="permiso-{{$permiso->id}}" value="{{$permiso->id}}" @if (seleccionado($permiso->id,$role->id)==1)checked
                                         
                        
                                         
                                     @endif> {{$permiso->name}}</ol>
                                @endif
                                    
                                @endforeach
                            </div>
                            <!-- /.card-body -->
                          </div>
                          <!-- /.card -->
                        </div>     
                </div>
                </div>
               

                <div  class="form-group row mb-0">
                    <div class="col-md- offset-md-11" style="float: right;">
                        <button type="submit" class="btn btn-primary">
                            {{ __('Update') }}
                        </button>
                    </div>
                </div>
                
            </form>
        </div>
       
        
    </div>
    {{--<livewire:role-permissions   
    :role="$role->id"/>--}}

@endsection
@section('scripts')

    <script>


        var permission_select = new SlimSelect({
            select: '#permissions-select select',
            //showSearch: false,
            placeholder: 'Select Permissions',
            deselectLabel: '<span>&times;</span>',
            hideSelectedOption: true,
        })

        $('#permissions-select #permission-select-all').click(function(){
            var options = [];
            $('#permissions-select select option').each(function(){
                options.push($(this).attr('value'));
            });

            permission_select.set(options);
        })

        $('#permissions-select #permission-deselect-all').click(function(){
            permission_select.set([]);
        })
    </script>
@endsection
