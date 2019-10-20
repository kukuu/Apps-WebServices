
@extends('layouts.php')

@section('content')
	<a href="/posts" class="btn btn-default"> Go Back </a>
	<h1> {{$posts->title}}</h1>
	<div>
			{{$posts->body}}
	</div>
	<hr />
	<small>Written on {{$post->created_at }</small>
@endsection