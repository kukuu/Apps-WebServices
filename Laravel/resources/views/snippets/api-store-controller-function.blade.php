

public function store(Request, $request){
	$this->validate($request, [
		'title' => 'required', 
		'body' => 'required'
	])

	<!--return "Alexander";-->

	<!-- Create Post-->
	$post = new Post;
	$post->title = $request->input('title');
	$post->body = $request->('body');
}