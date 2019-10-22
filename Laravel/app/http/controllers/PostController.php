
class PostController extends Controller
{
	/**
	* Display a listing of the resource.
	* @return @illuminate\Http\Response
	*
	*/

	public function index()
	{

		//posts = Post::all();
		//return Post::where('title', 'Post Two')->get();
		//$posts = DB::select('SELECT * FROM posts');
		//$posts = Post::orderBy('title', 'desc')->take(1)->get();
		//$posts = Post::orderBy('title', 'desc')->get();

		$posts = Post::orderBy('title', 'desc')->paginate(10);
		return view('posts.index')->with('posts', $posts);
	}


	/**
	* Show the form for creating a new resource
	*
	* @return \Illuminate\Http\Response

	*/

	public function create()
	{
		return view('posts.create');
	}

	public function store(Request, $request)
	{
		$this->calidate($request, [
			'title' => 'required',
			'body' => 'required'
		]);
		
		return 123;
	}



}