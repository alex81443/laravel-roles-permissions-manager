@extends('adminlte::page',['iFrameEnabled' => false])

@section('title', 'Dashboard')

@section('content_header')
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
<style>
	.select2{
		font-family: fontAwesome
	}
</style>



    <h1>Dashboard</h1>
@stop

@section('content')
    
@stop

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
	<link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.21.3/dist/bootstrap-table.min.css">
@stop

@section('js')
<script src="https://unpkg.com/bootstrap-table@1.21.3/dist/bootstrap-table.min.js"></script>
    
    
@stop