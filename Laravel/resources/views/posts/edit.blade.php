
@extends('layout.php')

@section
	<h1>Edit Post</h1>
	{!! Form:: open(['action' => ['PostController@update', $post->id], 'method' => 'POST']) !!}
		<div class="form-group">
			{{ Form:: label('title', 'Tttle')}}
			{{ Form::text('title', '', ['class' => 'form-control', 'placeholder' => 'Title' ] )}}
		</div>
		<div class="form-group">
			{{Form::label('body', 'Body')}}
			{{Form::textarea('body', '', ['id' => 'article-ckeditor', class' => 'form-control', 'placeholder' => 'Body text'])}}
		</div>
		{{Form::hidden('_method', 'PUT')}}
		{Form::submit('Submit', ['class'=> 'btn btn-primary'])}}
		{!! Form::close() !!}
@endsection