<?php
namespace App\Http\Controllers; 
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB; 
use Illuminate\Support\Facades\File;
use App\Mail\MyTestMail;
use Illuminate\Support\Facades\Mail;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

use App\Models\M_api;
use Session;
//use Sluggable;
class Api extends Controller 
{ 
	public function get_setting()
	{
		$data=  M_api::get_setting(); 
		return response()->json([
			'status'=>true,
       	'message'=>'success',
       	'data'=>$data,
		]);
	}

	public function cek_gelombang()
	{
		$data=  M_api::cek_gelombang(); 
		return response()->json([
			'status'=>true,
       	'message'=>'success',
       	'data'=>$data,
		]);
	}

	public function get_jurusan()
	{
		$data=  M_api::get_jurusan(); 
		return response()->json([
			'status'=>true,
       	'message'=>'success',
       	'data'=>$data,
		]);
	}

	public function get_konsentrasi(Request $request)
	{
		$id_jurusan = $request->input('id_jurusan');
		$data=  M_api::get_konsentrasi($id_jurusan); 
		//return $data;
		return response()->json([
			'status'=>true,
			'message'=>'success',
			'data'=>$data,
		]);
	}

	public function get_rekening()
	{
		$data=  M_api::get_rekening(); 
		return response()->json([
			'status'=>true,
       		'message'=>'success',
       		'data'=>$data,
		]);
	}

	public function get_galeri()
	{
		$data=  M_api::get_galeri(); 
		return response()->json([
			'status'=>true,
       		'message'=>'success',
       		'data'=>$data,
		]);
	}
	

	public function post_pmb(Request $request) {
		date_default_timezone_set('Asia/Jakarta');
		$link = $request->input('link');
		$id_gelombang = $request->input('id_gelombang');
		$nama_lengkap = $request->input('nama_lengkap');
		$tempat_lahir = $request->input('tempat_lahir');
		$tanggal_lahir = $request->input('tanggal_lahir');
		$alamat = $request->input('alamat');
		$kota = $request->input('kota');
		$provinsi = $request->input('provinsi');
		$kecamatan = $request->input('kecamatan');
		$kode_pos = $request->input('kode_pos');
		$email = $request->input('email');
		$telepon = $request->input('telepon');
		$whatsapp = $request->input('whatsapp');
		$jurusan = $request->input('jurusan');
		$konsentrasi = $request->input('konsentrasi');

		$cek_pendaftaran = M_api::cek_pendaftaran($id_gelombang, $email);

		if (count($cek_pendaftaran) > 0) {
			//return redirect('http://localhost/pascasarjana/daftar/email-failed');
			return redirect('https://pascasarjanausbypkp.ac.id/daftar/email-failed');
		}
		
		$nama_file_ijazah = 'Ijazah_'.str_replace(' ', '_', $nama_lengkap).'_'.$id_gelombang.'_'. date('YmdHis').'.'.$request->file('ijazah')->getClientOriginalExtension();

		$nama_file_transkip = 'Transkip_'.str_replace(' ', '_', $nama_lengkap).'_'.$id_gelombang.'_'. date('YmdHis').'.'.$request->file('transkip')->getClientOriginalExtension();

		/*
		if ($request->hasFile('toefl')) {
			$nama_file_toefl = 'Toefl_'.str_replace(' ', '-', $nama_lengkap).'_'.$id_gelombang.'_'. date('YmdHis').'.'.$request->file('toefl')->getClientOriginalExtension();
		}else{*/
			$nama_file_toefl = '';
		//}
		

		$nama_file_pembayaran = 'Pembayaran_'.str_replace(' ', '-', $nama_lengkap).'_'.$id_gelombang.'_'. date('YmdHis').'.'.$request->file('pembayaran')->getClientOriginalExtension();

		$nama_file_foto = 'Foto_'.str_replace(' ', '-', $nama_lengkap).'_'.$id_gelombang.'_'. date('YmdHis').'.'.$request->file('foto')->getClientOriginalExtension();

		$nama_file_ktp = 'KTP_'.str_replace(' ', '-', $nama_lengkap).'_'.$id_gelombang.'_'. date('YmdHis').'.'.$request->file('ktp')->getClientOriginalExtension();

		$nama_file_formulir = 'Formulir_'.str_replace(' ', '-', $nama_lengkap).'_'.$id_gelombang.'_'. date('YmdHis').'.'.$request->file('formulir')->getClientOriginalExtension();

		$nama_file_pernyataan = 'Surat_Pernyataan_MABA_'.str_replace(' ', '-', $nama_lengkap).'_'.$id_gelombang.'_'. date('YmdHis').'.'.$request->file('formulir')->getClientOriginalExtension();


		$data = array( 'id_gelombang'=> $id_gelombang, 'nama'=> $nama_lengkap, 'tempat_lahir'=> $tempat_lahir, 'tanggal_lahir'=> $tanggal_lahir, 'alamat'=> $alamat, 'provinsi'=> $provinsi, 'kota'=> $kota, 'kecamatan'=> $kecamatan, 'pos'=> $kode_pos, 'telepon'=> $telepon, 'whatsapp'=> $whatsapp, 'email'=> $email, 'jurusan'=> $jurusan, 'konsentrasi'=> $konsentrasi, 'file_ijazah'=> $nama_file_ijazah , 'file_transkip'=> $nama_file_transkip , 'file_toefl'=> $nama_file_toefl , 'file_pembayaran'=> $nama_file_pembayaran, 'file_foto'=> $nama_file_foto , 'file_ktp'=> $nama_file_ktp ,'file_formulir'=> $nama_file_formulir, 'file_pernyataan'=> $nama_file_pernyataan, 'tanggal_input'=> date('Y-m-d'), 'time'=> date('H:i:s'));

		$save = M_api::simpan_pendaftaran($data);
		if($save == '1'){
				M_api::update_link($link);
				if($request->hasFile('ijazah')) {

					$file_ijazah = $request->file('ijazah');
					
					$save_ijazah = M_api::upload_dokumen($file_ijazah, $nama_file_ijazah,'ijazah');		        
					/*

					if($file->move($uploadPath, $rename)) {
						$media = new M_api;
						$media->name = $originalName;
						$media->file = $rename;
						$media->extension = $extension;
						$media->size = $filesize;
						$media->mime = $mime;
						$media->save();
						}
						*/
					//  return "updload ok";
					
				}
				if($request->hasFile('transkip')) {

					$file_transkip = $request->file('transkip');
					
					$save_transkip = M_api::upload_dokumen($file_transkip, $nama_file_transkip, 'transkip');		        
				}
				/*if($request->hasFile('toefl')) {

					$file_toefl = $request->file('toefl');
					
					$save_toefl = M_api::upload_dokumen($file_toefl, $nama_file_toefl, 'toefl');		        
				}*/
				if($request->hasFile('pembayaran')) {

					$file_pembayaran = $request->file('pembayaran');
					
					$save_pembayaran = M_api::upload_dokumen($file_pembayaran, $nama_file_pembayaran, 'pembayaran');		        
				}
				if($request->hasFile('foto')) {

					$file_foto = $request->file('foto');
					
					$save_foto = M_api::upload_dokumen($file_foto, $nama_file_foto ,'foto');		        
				}
				if($request->hasFile('ktp')) {

					$file_ktp = $request->file('ktp');
					
					$save_ktp = M_api::upload_dokumen($file_ktp, $nama_file_ktp , 'ktp');		        
				}
				if($request->hasFile('formulir')) {

					$file_ktp = $request->file('formulir');
					
					$save_ktp = M_api::upload_dokumen($file_ktp, $nama_file_formulir , 'formulir');		        
				}
				if($request->hasFile('pernyataan')) {

					$file_pernyataan = $request->file('pernyataan');
					
					$save_pernyataan = M_api::upload_dokumen($file_pernyataan, $nama_file_pernyataan , 'pernyataan');		        
				}

				


				require base_path("vendor/autoload.php");
					$mail = new PHPMailer(true);     // Passing `true` enables exceptions

		

				// Email server settings
				$mail->SMTPDebug = 0;
				$mail->isSMTP();
				$mail->Host = 'mail.pascasarjanausbypkp.ac.id';             //  smtp host
				$mail->SMTPAuth = true;
				$mail->Username = 'info-noreply@pascasarjanausbypkp.ac.id';   //  sender username
				$mail->Password = '@infoemail';       // sender password
				$mail->SMTPSecure = 'ssl';                  // encryption - ssl/tls
				$mail->Port = 465;                          // port - 587/465

				$mail->setFrom('info-noreply@pascasarjanausbypkp.ac.id', 'Registrasi');
				$mail->addAddress($email);
				

				//$mail->addReplyTo('info-noreply@pascasarjanausbypkp.ac.id', 'sender-reply-name');
			

				$mail->isHTML(true);                // Set email content format to HTML

				$mail->Subject = 'Registrasi Pascasarjana Universitas Sangga Buana YPKP';
				$mail->Body    = view('email/email_registrasi',['nama'=>$nama_lengkap]);


				// $mail->AltBody = plain text version of email body;

				$mail->send();
				//return redirect('http://localhost/pascasarjana/daftar/success');
				return redirect('https://pascasarjanausbypkp.ac.id/daftar/success');


		}else{
			//return redirect('http://localhost/pascasarjana/daftar/failed');
			return redirect('https://pascasarjanausbypkp.ac.id/daftar/failed');
		}
	}


	public function index()
	{
		$data=  M_api::tampil_warga(); 
		return response()->json([
			'status'=>true,
       	'message'=>'success',
       	'data'=>$data,
		]);
	}

	public function cek_link($link)
	{
		$data=  M_api::cek_link($link); 
		return response()->json([
			'status'=>true,
       	'message'=>'success',
       	'data'=>$data,
		]);
	}
}