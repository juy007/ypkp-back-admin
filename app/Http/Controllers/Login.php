<?php
//https://makitweb.com/insert-update-and-delete-record-from-mysql-in-laravel/
namespace App\Http\Controllers; 
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB; 
use App\Models\M_login;
use App\Models\M_admin;
use Session;
use Auth;

class Login extends Controller 
{ 
	public function index() {
		return view('login/form_login');
	}

	public function authentication(Request $request) {
		// Validate the form data
		 $credentials = $request->validate([
			'email' => 'required|email',
			'password' => 'required'
		]);
		 
		 
	    if (Auth::attempt($credentials)) {
            $request->session()->regenerate();
 			
 			$dataAdmin = M_admin::data_admin($request->email, $request->password);
 			session()->put('namaAdmin',  $dataAdmin->nama);
 			session()->put('emailAdmin',  $dataAdmin->email);
 			session()->put('usernameAdmin',  $dataAdmin->username);
 			session()->put('passwordAdmin',  $dataAdmin->password);
 			//session()->put('theme', 'semi-dark');
 			session()->put('theme', 'semi-dark');
 			//session()->put('theme', 'light-theme');
			 session()->put('levelAdmin', $dataAdmin->level);

 			
            return redirect()->intended('dashboard');
        }else{
        	Session::flash('notif_gagal','E-mail atau password salah');
			return back();
		}

	    // Passwordnya pake bcrypt
		//if (Auth::guard('admin')->attempt(['email' => $request->email, 'password' => $request->password])) {
		//	return redirect()->intended('/warga');
		
		 /*else if (Auth::guard('user')->attempt(['email' => $request->email, 'password' => $request->password])) {
			return redirect()->intended('/user');
		}*/

	}

	public function logout(Request $request)
	{
	    Auth::logout();
	 
	    $request->session()->invalidate();
	 
	    $request->session()->regenerateToken();
	 
	    return redirect('/login');
	}
}