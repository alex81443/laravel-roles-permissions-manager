@extends('adminlte::page')
@section('content')
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-md-12">
            @livewire('sizes')
        </div>     
    </div>   
</div>
@endsection
@livewireScripts
    <script type="text/javascript">
        window.livewire.on('closeModal', () => {
            $('#createDataModal').modal('hide');
        });
    </script>