
@extends('layout.php')

@section
	<h1>Create Post</h1>
	{!! Form:: open(['action' => 'PostController@store', 'method' => 'POST']) !!}
		<div class="form-group">
			{{ Form:: label('title', 'Tttle')}}
			{{ Form::text('title', '', ['class' => 'form-control', 'placeholder' => 'Title' ] )}}
		</div>
		<div class="form-group">
			{{Form::label('body', 'Body')}}
			{{Form::textarea('body', '', ['class' => 'form-control', 'placeholder' => 'Body text'])}}
		</div>
	{!! Form::close() !!}
@endsection