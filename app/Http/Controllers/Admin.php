<?php
//https://makitweb.com/insert-update-and-delete-record-from-mysql-in-laravel/
namespace App\Http\Controllers; 
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB; 

use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Hash;
use	Illuminate\Support\Facades\Http;//api client

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

use PhpOffice\PhpSpreadsheet\Spreadsheet;
//use PhpOffice\PhpSpreadsheet\Reader\Exception;
//use PhpOffice\PhpSpreadsheet\Writer\Xls;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\IOFactory;

use PDF;
use File;
use App\Models\M_admin;
use Session;

class Admin extends Controller 
{ 
	public function domain() 
	{
		$domain = 'solarhub';
		/*
		$kqcom= Http::get('http://www.whois.net.vn/whois.php?domain='.$domain.'.com'); 
     
		if ($kqcom=='0') { 
		  echo $domain.".com<br>";
		  echo "domain tidak terdaftar<br><br>"; 
		}elseif($kqcom=='1'){
		  echo $domain.".com<br>";
		  echo "domain sudah terdaftar<br><br>"; 
		}elseif($kqcom=='-1') { 
		  echo $domain.".com<br>";
		  echo "domain tidak ada<br><br>"; 
		}
	*/
		$kqid= Http::get('http://whois.net.vn/whois.php?domain='.$domain.'.id'); 
		if ($kqid=='0') { 
		  echo $domain.".id<br>";
		  echo "domain tidak terdaftar<br><br>"; 
		}elseif($kqid=='1'){
		  echo $domain.".id<br>";
		  echo "domain sudah terdaftar<br<br>>"; 
		}elseif($kqid=='-1') { 
		  echo $domain.".id<br>";
		  echo "domain tidak ada<br><br>"; 
		}
	
	/*
		$kqcoid= Http::get('http://www.whois.net.vn/whois.php?domain='.$domain.'.co.id'); 
		 
		if ($kqcoid=='0') { 
		  echo $domain.".co.id<br>";
		  echo "domain tidak terdaftar<br><br>"; 
		}elseif($kqcoid=='1'){
		  echo $domain.".co.id<br>";
		  echo "domain sudah terdaftar<br><br>"; 
		}elseif($kqcoid=='-1') { 
		  echo $domain.".co.id<br>";
		  echo "domain tidak ada<br><br>"; 
		}
	*/
	}


	public function change_theme(Request $request) 
	{
		$theme = $request->input('theme');
		session()->put('theme', $theme);
		$callback = array('notif' => 'true');

		return $callback;
	}

	public function index() 
	{
		return view('index');
	}
//Pendaftaran===========================================================================
	public function pendaftaran() 
	{
		$data['data'] = M_admin::gelombang_show();
		return view('pendaftaran', ['data'=> $data]);
	}
	public function data_pmb($id_gelombang) 
	{
		$data['gelombang'] =M_admin::get_where_gelombang($id_gelombang);
		$data['pmb'] = M_admin::pmb_show($id_gelombang);
		return view('data_pmb', ['data'=> $data]);

	}

	public function data_pmb_hapus($id, $gelombang) {
		$data['data'] = M_admin::pmb_select($id);
		File::delete('public/uploads/dokumen/ijazah/'.$data['data']->file_ijazah);
		File::delete('public/uploads/dokumen/transkip/'.$data['data']->file_transkip);
		if (!empty($data['data']->file_toefl)) {
			File::delete('public/uploads/dokumen/toefl/'.$data['data']->file_toefl);
		}
		File::delete('public/uploads/dokumen/pembayaran/'.$data['data']->file_pembayaran);
		File::delete('public/uploads/dokumen/foto/'.$data['data']->file_foto);
		File::delete('public/uploads/dokumen/ktp/'.$data['data']->file_ktp);

		$result=M_admin::pmb_hapus($id);
		
		if($result >= '1'){
			Session::flash('notif_sukses','Berhasil dihapus');
		}else{
			Session::flash('notif_gagal','Gagal dihapus');
		}
		
		return redirect('data-pmb/'.$gelombang);
	}

	public function data_pmb_hapus_semua($id_gelombang) {
		$data['pmb'] = M_admin::pmb_show($id_gelombang);
		foreach ($data['pmb'] as $key => $valuePmb) {
			File::delete('public/uploads/dokumen/ijazah/'.$valuePmb->file_ijazah);
			File::delete('public/uploads/dokumen/transkip/'.$valuePmb->file_transkip);
			if (!empty($valuePmb->file_toefl)) {
				File::delete('public/uploads/dokumen/toefl/'.$valuePmb->file_toefl);
			}
			File::delete('public/uploads/dokumen/pembayaran/'.$valuePmb->file_pembayaran);
			File::delete('public/uploads/dokumen/foto/'.$valuePmb->file_foto);
			File::delete('public/uploads/dokumen/ktp/'.$valuePmb->file_ktp);

			M_admin::pmb_hapus($valuePmb->id_pendaftar);
		}
		
		Session::flash('notif_sukses','Berhasil dihapus');
		
		return redirect('data-pmb/'.$id_gelombang);
	}

	public function data_pmb_detail($id) 
	{
		$data['data'] = M_admin::pmb_select($id);
		$data['gelombang'] = M_admin::get_where_gelombang($data['data']->id_gelombang);
		return view('data_pmb_detail', ['data'=> $data]);
	}

	public function data_pmb_cetak($id) 
	{
		$data['data'] = M_admin::pmb_select($id);
		$data['gelombang'] = M_admin::get_where_gelombang($data['data']->id_gelombang);
		return view('data_pmb_cetak', ['data'=> $data]);
	}

	 public function data_pmb_pdf($id) {
       
        $data['data'] = M_admin::pmb_select($id);
		$data['gelombang'] = M_admin::get_where_gelombang($data['data']->id_gelombang);
  
        $pdf = PDF::loadView('data_pmb_pdf', ['data' => $data]);
        
        return $pdf->download('Data_calon_mahasiswa_'.$data['data']->nama.'.pdf');
        
      }

    public function data_pmb_excel($id_gelombang) 
	{
		$data['gelombang'] =M_admin::get_where_gelombang($id_gelombang);
	
		$data_pmb = M_admin::pmb_show($id_gelombang);
		//return view('data_pmb', ['data'=> $data]);


		/*foreach ($data['pmb'] as $key => $value) {
			$array[]=$value->nama;
			
		}*/
		
		
       	$data_array [] = array("No","Nama","Tempat Lahir","Tanggal Lahir","Alamat","Kecamatan","Kabupaten/Kota", "Provinsi", "Kode Pos","Telepon","Whatsapp","Email","Jurusan", "Konsentrasi", "Tanggal Mendaftar");
       	$no=1;
       	foreach($data_pmb as $data_item)
       	{
           $data_array[] = array(
	           	"No"=>$no++,
	           	"Nama"=>$data_item->nama,
	           	"Tempat Lahir"=>$data_item->tempat_lahir,
	           	"Tanggal Lahir"=>date('d/m/Y', strtotime($data_item->tanggal_lahir)),
	           	"Alamat"=>$data_item->alamat,
	           	"Kecamatan"=>$data_item->kecamatan,
	           	"Kabupaten/Kota"=>$data_item->kota,
				"Provinsi"=>$data_item->provinsi,
	           	"Kode Pos"=>$data_item->pos,
	           	"Telepon"=>$data_item->telepon,
	           	"Whatsapp"=>$data_item->whatsapp,
	           	"Email"=>$data_item->email,
	           	"Jurusan"=>$data_item->jurusan,
				"Konsentrasi"=>$data_item->konsentrasi,
	           	"Tanggal Mendaftar" =>date('d/m/Y', strtotime($data_item->tanggal_input))
           );
       }
       $this->ExportExcel($data_array);


	
	}
	public function ExportExcel($customer_data){
       ini_set('max_execution_time', 0);
       ini_set('memory_limit', '4000M');
       try {
        	$spreadSheet = new Spreadsheet();
			$sheet = $spreadSheet->getActiveSheet();
        	//$spreadsheet->getActiveSheet()->getHeaderFooter()->setOddHeader('');
         	//$spreadSheet->getActiveSheet()->getDefaultColumnDimension("B1:M1")->setWidth(20);
         	//$spreadSheet->getActiveSheet()->getDefaultColumnDimension("A:M")->setAutoSize(true);
			 $sheet->getColumnDimension('A')->setAutoSize(TRUE);
			 $sheet->getColumnDimension('B')->setAutoSize(TRUE);
			 $sheet->getColumnDimension('C')->setAutoSize(TRUE);
			 $sheet->getColumnDimension('D')->setAutoSize(TRUE);
			 $sheet->getColumnDimension('E')->setAutoSize(TRUE);
			 $sheet->getColumnDimension('F')->setAutoSize(TRUE);
			 $sheet->getColumnDimension('G')->setAutoSize(TRUE);
			 $sheet->getColumnDimension('H')->setAutoSize(TRUE);
			 $sheet->getColumnDimension('I')->setAutoSize(TRUE);
			 $sheet->getColumnDimension('J')->setAutoSize(TRUE);
			 $sheet->getColumnDimension('K')->setAutoSize(TRUE);
			 $sheet->getColumnDimension('L')->setAutoSize(TRUE);
			 $sheet->getColumnDimension('M')->setAutoSize(TRUE);
			 $sheet->getColumnDimension('N')->setAutoSize(TRUE);
			 $sheet->getColumnDimension('O')->setAutoSize(TRUE);
          	$spreadSheet->getActiveSheet()->getStyle("A1:O1")->getFont()->setBold( true );
          	$spreadSheet->getActiveSheet()->getStyle('A1:O1')->getFont()->setSize(14);
        	$spreadSheet->getActiveSheet()->fromArray($customer_data);
         	$Excel_writer = new Xlsx($spreadSheet);
         	header('Content-Type: application/vnd.ms-excel');
           	header('Content-Disposition: attachment;filename="PMB_'.date('d-m-Y').'.xlsx"');
           	header('Cache-Control: max-age=0');
           	ob_end_clean();
           	$Excel_writer->save('php://output');
           	exit();
       	} catch (Exception $e) {
           return;
       	}


   }
//PendaftaranEnd========================================================================
//Link=================================================================================
	public function link() 
	{
		$data['data'] = M_admin::link_show();
		return view('link', ['data'=> $data]);
	}

	public function tambah_link() 
	{
		date_default_timezone_set('Asia/Jakarta');
		//$link = Crypt::encryptString(date('ymdhis'));
		$link = sha1(date('ymdhis'));
		$data = array('link_address'=>$link, 'status_link'=>'false', 'input_link'=>date('Y-m-d'));
		$save = M_admin::link_tambah($data);
		if($save == '1'){
			Session::flash('notif_sukses','Link berhasil ditambahkan');
		}else{
			Session::flash('notif_gagal','Link gagal ditambahkan');
		}
		return redirect('link');
		
	}

	public function link_hapus() {
		$result=M_admin::link_hapus();
		
		if($result >= '1'){
			Session::flash('notif_sukses','Link berhasil dihapus');
		}else{
			Session::flash('notif_gagal','Link gagal dihapus');
		}
		
		return redirect('link');
	}

	public function link_hapus_select($id) {
		$result=M_admin::link_hapus_select($id);
		
		if($result >= '1'){
			Session::flash('notif_sukses','Link berhasil dihapus');
		}else{
			Session::flash('notif_gagal','Link gagal dihapus');
		}
		
		return redirect('link');
	}

//LinkEnd==============================================================================
//Gelombang=============================================================================
	public function gelombang() 
	{
		$data['data'] = M_admin::gelombang_show();
		$data['gelombang_aktiv'] = M_admin::cek_gelombang();
		return view('gelombang', ['data'=> $data]);
	}

	public function gelombang_simpan(Request $request) 
	{
		$gelombang = $request->input('gelombang');
		$tanggal_awal = $request->input('tanggal_awal');
		$tanggal_akhir = $request->input('tanggal_akhir');
		$status_gelombang = $request->input('status_gelombang');
		$data = array('nama_gelombang'=>$gelombang, 'tanggal_mulai'=>$tanggal_awal, 'tanggal_akhir'=>$tanggal_akhir, 'status_gelombang'=>$status_gelombang);

		$cek_data = M_admin::cek_gelombang($tanggal_awal, $tanggal_akhir);

		if ($status_gelombang == 'nonaktiv') {
			$save = M_admin::simpan_gelombang($data);
			if($save == '1'){
				Session::flash('notif_sukses','Gelombang berhasil ditambahkan dengan status nonaktiv');
			}else{
				Session::flash('notif_gagal','Gelombang gagal ditambahkan');
			}
		}elseif($status_gelombang == 'aktiv'){
			$cek_jurusan = M_admin::cek_jurusan_aktiv();
			if (count($cek_jurusan)>0) {
				if(count($cek_data)<1){
					$save = M_admin::simpan_gelombang($data);
					if($save == '1'){
						Session::flash('notif_sukses','Gelombang berhasil ditambahkan dengan status aktiv');
					}else{
						Session::flash('notif_gagal','Gelombang gagal ditambahkan');
					}
				}else{
					Session::flash('notif_gagal','Gelombang gagal ditambahkan karena ada gelombang yang masih aktiv');
				}
			}else{
				Session::flash('notif_gagal','Gelombang gagal ditambahkan, minimal harus aktiv satu jurusan');
			}
		}
		return redirect("/gelombang");
	}

	public function gelombang_status(Request $request) 
	{
		$id_gelombang = $request->input('id_gelombang');
		$status_gelombang = $request->input('gelombang_status');
		$tanggal_akhir = $request->input('tanggal_akhir');

		$data = array('status_gelombang'=>$status_gelombang);
		
		if ($status_gelombang == 'aktiv') {//status gelombang aktiv
			$cek_jurusan = M_admin::cek_jurusan_aktiv();
			if (count($cek_jurusan)>0) {//cek jurusan yang aktiv
				if (date('Y-m-d') <= $tanggal_akhir) {//cek tanggal akhir harus lebih besar = dari tgl sekarang
					$cek_data = M_admin::cek_gelombang();
					if(count($cek_data)<1){//cek gelombang yang aktiv
						$save = M_admin::status_gelombang($id_gelombang, $data);
						if($save == '1'){
							$result = 'true';
						}else{
							$result = 'false';
						}
					}else{
						$result = 'not';	
					}
				}else{
					$result = 'not2';	
				}
			}else{
				$result = 'not3';	
			}
		}else if ($status_gelombang == 'nonaktiv') {
			$save = M_admin::status_gelombang($id_gelombang, $data);
			if($save == '1'){
				$result = 'true';
			}else{
				$result = 'false';
			}
		}
		$callback = array('notif' => $result, 'gelombang_aktiv'=> count(M_admin::cek_gelombang()));
		return $callback;
	}

	public function gelombang_hapus($id_gelombang) {
		$cek_pendaftaran = M_admin::cek_pendaftaran($id_gelombang);
		if (count($cek_pendaftaran) < 1) {
			$result=M_admin::hapus_gelombang($id_gelombang);

			if($result == '1'){
				Session::flash('notif_sukses','Gelombang berhasil dihapus');
			}else{
				Session::flash('notif_gagal','Gelombang gagal dihapus');
			}
		}else{
			$get_gelombang = M_admin::get_where_gelombang($id_gelombang);
			Session::flash('notif_gagal','Gagal hapus gelombang. Silahkan hapus semua data pendaftaran'.$get_gelombang->nama_gelombang);
		}
		return redirect("/gelombang");
	}

	public function gelombang_get(Request $request) 
	{
		$id_gelombang = $request->input('id_gelombang');
		$data = M_admin::get_where_gelombang($id_gelombang);
		$callback = array(
			'id_gelombang' => $data->id_gelombang,
			'nama_gelombang'=> $data->nama_gelombang,
			'tanggal_awal' => $data->tanggal_mulai,
			'tanggal_akhir' => $data->tanggal_akhir,
		);
		return $callback;	
	}

	public function gelombang_simpan_perpanjang(Request $request) 
	{
		$id_gelombang = $request->input('id_gelombang');
		$tanggal_akhir = $request->input('tanggal_akhir');

		$data = array('tanggal_akhir'=>$tanggal_akhir);

		$save = M_admin::simpan_gelombang_perpanjang($id_gelombang, $data);
		if($save == '1'){
			Session::flash('notif_sukses','Gelombang berhasil diperpanjang');
		}else{
			Session::flash('notif_gagal','Gelombang gagal diperpanjang');
		}
		return redirect("/gelombang");
	}
//GelombangEnd==========================================================================
//Jurusan===============================================================================
	public function jurusan() 
	{
		$data['data'] = M_admin::jurusan_show();
		return view('jurusan', ['data'=> $data]);
	}

	public function jurusan_simpan(Request $request) 
	{
		$jurusan = $request->input('jurusan');
		$status_jurusan = 'nonaktiv';//$request->input('status_jurusan');

		$cek_data = M_admin::cek_jurusan($jurusan);

		if(empty($cek_data)){
			$data = array('nama_jurusan'=>$jurusan, 'status_jurusan'=>$status_jurusan);

			$save = M_admin::simpan_jurusan($data);

			if($save == '1'){
				Session::flash('notif_sukses','Jurusan berhasil ditambahkan');
				return redirect("/jurusan");
			}else{
				Session::flash('notif_gagal','Jurusan gagal ditambahkan');
				return redirect("/jurusan");
			}
		}else{
			Session::flash('notif_gagal','Jurusan sudah ada');
			return redirect("/jurusan");
		}
	}

	public function jurusan_status(Request $request) 
	{
		$id_jurusan = $request->input('id_jurusan');
		$status_jurusan = $request->input('jurusan_status');

		$data = array('status_jurusan'=>$status_jurusan);
		
		$cek_konsentrasi = count(DB::table('konsentrasi')->where('id_jurusan', $id_jurusan)->get()); 
		if($cek_konsentrasi > 0){
			$save = M_admin::status_jurusan($id_jurusan, $data);
			if($save == '1'){	$result = 'true';}else{ $result = 'false';}
		}else{
			$result = 'warning';
		}
		
		$callback = array('notif' => $result);

		return $callback;
	}

	public function jurusan_hapus($id_jurusan) 
	{
		$result=M_admin::hapus_jurusan($id_jurusan);

		if($result == '1'){
			Session::flash('notif_sukses','Jurusan berhasil dihapus');
			return redirect("/jurusan");
		}else{
			Session::flash('notif_gagal','Jurusan gagal dihapus');
			return redirect("/jurusan");
		}
	}
	public function jurusan_konsentrasi($id_jurusan)
	{
		$data['data'] = M_admin::jurusan_konsentrasi($id_jurusan);
		$data['jurusan'] = DB::table('jurusan')->where('id_jurusan', $id_jurusan)->first(); 
		$data['id_jurusan'] = $id_jurusan;
		return view('jurusan_konsentrasi', ['data'=> $data]);
	}

	public function jurusan_konsentrasi_simpan(Request $request)
	{
		$id = $request->input('id_jurusan');
		$konsentrasi = $request->input('konsentrasi');
		$data = array('id_jurusan'=>$id, 'konsentrasi'=>$konsentrasi, 'tanggal_input'=>date('Y-m-d'));

		$save = M_admin::konsentrasi_simpan($data);

		if($save == '1'){
			Session::flash('notif_sukses','Konsentrasi berhasil ditambahkan');
			return redirect("/jurusan-konsentrasi/".$id);
		}else{
			Session::flash('notif_gagal','Konsentrasi gagal ditambahkan');
			return redirect("/jurusan-konsentrasi/".$id);
		}
	}
	public function jurusan_konsentrasi_hapus($id_jurusan, $id_konsentrasi) 
	{
		$result=M_admin::hapus_jurusan_konsentrasi($id_konsentrasi);
		$cek_konsentrasi = count(DB::table('konsentrasi')->where('id_jurusan', $id_jurusan)->get()); 
		if ($cek_konsentrasi < 1) {
			$data = array('status_jurusan'=>'nonaktiv');
			$save = M_admin::status_jurusan($id_jurusan, $data);
		}
		if($result == '1'){
			Session::flash('notif_sukses','Konsentrasi berhasil dihapus');
			return redirect("/jurusan-konsentrasi/".$id_jurusan);
		}else{
			Session::flash('notif_gagal','Konsentrasi gagal dihapus');
			return redirect("/jurusan-konsentrasi/".$id_jurusan);
		}
	}
//JurusanEnd============================================================================
//akun==================================================================================
	public function admin() 
	{
		$data['data'] = M_admin::admin_show();
		return view('admin', ['data'=> $data]);
	}

	public function admin_simpan(Request $request) 
	{
		$nama = $request->input('nama');
		$email = $request->input('email');
		$username = $request->input('username');
		$password = bcrypt($request->input('password'));

		$cek_email = M_admin::cek_email_admin($email);
		$cek_username = M_admin::cek_username_admin($username);

		if(count($cek_email) < 1 && count($cek_username) < 1){
			$data = array('nama'=>$nama, 'email'=>$email, 'username'=>$username, 'password'=>$password);

			$save = M_admin::simpan_admin($data);

			if($save == '1'){
				Session::flash('notif_sukses','Admin berhasil ditambahkan');
				return redirect("/admin");
			}else{
				Session::flash('notif_gagal','Admin gagal ditambahkan');
				return redirect("/admin");
			}
		}else{
			if (count($cek_email) > 0) {
				$note ="E-mail sudah di gunakan";
			}else{
				$note="";
			}
			if (count($cek_username) > 0) {
				$note2 ="Username sudah di gunakan";
			}else{
				$note2="";
			}
			Session::flash('notif_gagal',$note.' | '.$note2);
			return redirect("/admin");
		}
	}

	public function admin_simpan_update(Request $request) 
	{
		$id = $request->input('id');
		$nama = $request->input('namaEdit');
		$email = $request->input('emailEdit');
		$username = $request->input('usernameEdit');
		$password = $request->input('passwordEdit');

		if (empty($password)) {
			$data = array('nama'=>$nama, 'email'=>$email, 'username'=>$username);
		}else{
			$data = array('nama'=>$nama, 'email'=>$email, 'username'=>$username, 'password'=>bcrypt($password));	
		}
		

		$save = M_admin::simpan_admin_update($id, $data);

		if($save == '1'){
			Session::flash('notif_sukses','Admin berhasil diupdate');
		}else{
			Session::flash('notif_gagal','Admin gagal diupdate');
		}
		return redirect("/admin");
		
	}

	public function admin_hapus($id_admin) 
	{
		$result=M_admin::admin_hapus($id_admin);

		if($result == '1'){
			Session::flash('notif_sukses','admin berhasil dihapus');
			return redirect("/admin");
		}else{
			Session::flash('notif_gagal','admin gagal dihapus');
			return redirect("/admin");
		}
	}

	public function ambil_data_admin(Request $request) 
	{
		$id_admin = $request->input('id_admin');
		$data = M_admin::ambil_data_admin($id_admin);
		$callback = array(
			'id_admin' => $data->id_admin,
			'nama' => $data->nama,
			'email'=> $data->email,
			'username' => $data->username,
		);
		return $callback;	
	}

	public function cs() 
	{
		$data['data'] = M_admin::cs_show();
		return view('cs', ['data'=> $data]);
	}

	public function cs_simpan(Request $request) 
	{
		$nama = $request->input('nama');
		$email = $request->input('email');
		$username = $request->input('username');
		$password = $request->input('password');
		$level = $request->input('level');

		$cek_email = M_admin::cek_email_cs($email);
		$cek_username = M_admin::cek_username_cs($username);

		if(count($cek_email) < 1 && count($cek_username) < 1){
			$data = array('nama'=>$nama, 'email'=>$email, 'username'=>$username, 'password'=>bcrypt($password), 'level'=>$level);

			$save = M_admin::simpan_cs($data);

			if($save == '1'){
				Session::flash('notif_sukses','CS berhasil ditambahkan');
				return redirect("/cs");
			}else{
				Session::flash('notif_gagal','CS gagal ditambahkan');
				return redirect("/cs");
			}
		}else{
			if (count($cek_email) > 0) {
				$note ="E-mail sudah di gunakan";
			}else{
				$note="";
			}
			if (count($cek_username) > 0) {
				$note2 ="Username sudah di gunakan";
			}else{
				$note2="";
			}
			Session::flash('notif_gagal',$note.' | '.$note2);
			return redirect("/cs");
		}
	}

	public function cs_hapus($id_cs) 
	{
		$result=M_admin::cs_hapus($id_cs);

		if($result == '1'){
			Session::flash('notif_sukses','cs berhasil dihapus');
		}else{
			Session::flash('notif_gagal','cs gagal dihapus');
		}
		return redirect("/cs");
	}

	public function ambil_data_cs(Request $request) 
	{
		$id_user = $request->input('id_user');
		$data = M_admin::ambil_data_cs($id_user);
		$callback = array(
			'id_cs' => $data->id_user,
			'nama' => $data->nama,
			'email'=> $data->email,
			'username' => $data->username,
		);
		return $callback;	
	}

	public function cs_simpan_update(Request $request) 
	{
		$id = $request->input('id');
		$nama = $request->input('namaEdit');
		$email = $request->input('emailEdit');
		$username = $request->input('usernameEdit');
		$password = $request->input('passwordEdit');

		if (empty($password)) {
			$data = array('nama'=>$nama, 'email'=>$email, 'username'=>$username);
		}else{
			$data = array('nama'=>$nama, 'email'=>$email, 'username'=>$username, 'password'=>bcrypt($password));	
		}
		
	
			$save = M_admin::simpan_cs_update($id, $data);

			if($save == '1'){
				Session::flash('notif_sukses','Cs berhasil diupdate');
			}else{
				Session::flash('notif_gagal','Cs gagal diupdate');
			}
			return redirect("/cs");
		
		
	}
//akunEnd===============================================================================
//Setting===============================================================================
	public function facebook_pixel() 
	{
		$data['data'] = M_admin::setting_show();
		return view('facebook_pixel', ['data'=> $data]);
	}

	public function update_facebook_pixel(Request $request)  
	{
		$kode = $request->input('kode');
		$save = M_admin::update_setting(array('facebook_pixel'=>$kode));
		if($save >= '1'){
			Session::flash('notif_sukses','Facebook pixel berhasil diupdate');
		}else{
			Session::flash('notif_gagal','Facebook pixel gagal diupdate');
		}
		return redirect("/setting-facebook-pixel");
	}
	public function biaya() 
	{
		$data['data'] = M_admin::setting_show();
		return view('biaya', ['data'=> $data]);
	}

	public function update_biaya(Request $request)  
	{
		$biaya = $request->input('biaya');
		$save = M_admin::update_setting(array('biaya'=>$biaya));
		if($save >= '1'){
			Session::flash('notif_sukses','Biaya berhasil diupdate');
		}else{
			Session::flash('notif_gagal','Biaya gagal diupdate');
		}
		return redirect("/setting-biaya");
	}

	public function rekening() 
	{
		$data['data'] = M_admin::data_rekening();
		return view('rekening', ['data'=> $data]);
	}

	public function rekening_simpan(Request $request) 
	{
		$bank = $request->input('bank');
		$nama_rekening = $request->input('nama_rekening');
		$nomor_rekening = $request->input('nomor_rekening');
		$catatan = $request->input('catatan');
		$status = $request->input('status');
		//echo $bank.'/'.$nama_rekening.'/'.$nomor_rekening.'/'.$status;
		
		$data=array('bank'=>$bank, 'nama'=>$nama_rekening, 'nomor'=>$nomor_rekening,'note'=>$catatan, 'status_rekening'=>$status);
		$save = M_admin::simpan_rekening($data);

		if($save == '1'){
			Session::flash('notif_sukses','Data berhasil ditambahkan');
			return redirect("/setting-rekening");
		}else{
			Session::flash('notif_gagal','Data gagal ditambahkan');
			return redirect("/setting-rekening");
		}
	}

	public function rekening_hapus($id) {
		$result=M_admin::rekening_hapus($id);
		
		if($result >= '1'){
			Session::flash('notif_sukses','Berhasil dihapus');
		}else{
			Session::flash('notif_gagal','Gagal dihapus');
		}
		
		return redirect('setting-rekening');
	}


	public function update_rekening(Request $request)  
	{
		$id = $request->input('id');
		$nama_bank = $request->input('bank');
		$nama_rekening = $request->input('nama_rekening');
		$nomor_rekening = $request->input('nomor_rekening');
		$catatan = $request->input('catatan');
		$status = $request->input('status');

		$data=array('bank'=>$nama_bank, 'nama'=>$nama_rekening, 'nomor'=>$nomor_rekening,'note'=>$catatan, 'status_rekening'=>$status);

		$save = M_admin::update_rekening($id,$data);
		if($save >= '1'){
			Session::flash('notif_sukses','Berhasil diupdate');
		}else{
			Session::flash('notif_gagal','Gagal diupdate');
		}
		return redirect("/setting-rekening");
		
	}


//SettingEnd============================================================================


	public function kirim(){
		require base_path("vendor/autoload.php");
        $mail = new PHPMailer(true);     // Passing `true` enables exceptions

        //try {

            // Email server settings
            $mail->SMTPDebug = 0;
            $mail->isSMTP();
            $mail->Host = 'iix200.idcloudhost.com';             //  smtp host
            $mail->SMTPAuth = true;
            $mail->Username = 'info-noreply@pascasarjanausbypkp.ac.id';   //  sender username
            $mail->Password = '@infoemail';       // sender password
            $mail->SMTPSecure = 'ssl';                  // encryption - ssl/tls
            $mail->Port = 465;                          // port - 587/465

            $mail->setFrom('info-noreply@pascasarjanausbypkp.ac.id', 'system email');
            $mail->addAddress('julistiasyafari95@gmail.com');
            //$mail->addCC('emailCc');
            //$mail->addBCC('emailBcc');

            $mail->addReplyTo('info-noreply@pascasarjanausbypkp.ac.id', 'sender-reply-name');
            /*
            if(isset($_FILES['emailAttachments'])) {
                for ($i=0; $i < count($_FILES['emailAttachments']['tmp_name']); $i++) {
                    $mail->addAttachment($_FILES['emailAttachments']['tmp_name'][$i], $_FILES['emailAttachments']['name'][$i]);
                }
            }
			*/

            $mail->isHTML(true);                // Set email content format to HTML

            $mail->Subject = 'coba email';
            $mail->Body    = view('email/email_registrasi');//'coba email laravel';

            // $mail->AltBody = plain text version of email body;

            if( !$mail->send() ) {
                //return back()->with("failed", "Email not sent.")->withErrors($mail->ErrorInfo);
                return "gagal";
            }
            
            else {
            	return "hasil";
                //return back()->with("success", "Email has been sent.");
            }

       // } catch (Exception $e) {
             //return back()->with('error','Message could not be sent.');
        //	return "close";
       // }
	}

	public function tem_email(){
		return view('email/email_registrasi');
	}

	public function galeri() 
	{
		$data['data'] = M_admin::data_galeri();
		return view('galeri', ['data'=> $data]);
	}

	public function upload_galeri(Request $request) {
		$img = $request->file('img');
		$result=M_admin::galeri_simpan($img->getClientOriginalName());
		
		if($result >= '1'){
			M_admin::upload_galeri($img);
			Session::flash('notif_sukses','Berhasil diupload');
		}else{
			Session::flash('notif_gagal','Gagal diupload');
		}
		
		return redirect('galeri');
	}

	public function galeri_hapus($id) {
		$data = M_admin::get_galeri($id);
		
		$result=M_admin::galeri_hapus($id);
		
		if($result >= '1'){
			File::delete(public_path('../pascasarjana/assets/images/galeri/'.$data->img));
			Session::flash('notif_sukses','Berhasil dihapus');
		}else{
			Session::flash('notif_gagal','Gagal dihapus');
		}
		
		return redirect('galeri');
	}
}