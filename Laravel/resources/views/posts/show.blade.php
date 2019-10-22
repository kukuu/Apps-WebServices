
@extends('layouts.php')

@section('content')
	<a href="/posts" class="btn btn-default"> Go Back </a>
	<h1> {{$posts->title}}</h1>
	<div>
			{!!$posts->body!!}
	</div>
	<hr />
	<small>Written on {{$post->created_at }</small>
	<hr />
	<a href="/posts/{{$post->id}}/edit" class="btn btn-default">Edit</a>
	{!! Form:: open(['action' => ['PostController@destroy', $post->id], 'method' => 'POST', 'class' => 'pull-right']) !!}
		{{Form::hidden('_method', 'DELETE')}}
		{{Form::submit('Delete', ['class' => 'btn btn-danger'])}}
	{!! Form::close() !!}
@endsection