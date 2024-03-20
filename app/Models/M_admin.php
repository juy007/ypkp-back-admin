<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB; 

class M_admin extends Model
{
    /*public $timestamps = false;
    use HasFactory;

    protected $table = 'warga';
        protected $primaryKey = 'id_warga';
        protected $fillable = ['nokk', 'nik', 'nama', 'input_warga'];
    }
    */
    public static function theme()
    {
        $value=DB::table('setting')->where('id_setting', '1')->first(); 
        return $value;
    }
    
    public static function pmb_show($id_gelombang)
    {
        $value=DB::table('pendaftar')->where('id_gelombang', $id_gelombang)->orderBy('id_pendaftar', 'desc')->get(); 
        return $value;
    }

     public static function pmb_select($id)
    {
        $value=DB::table('pendaftar')->where('id_pendaftar', $id)->first(); 
        return $value;
    }

     public static function pmb_hapus($id)
    {
        $save = DB::table('pendaftar')->where('id_pendaftar', $id)->delete(); 
        return $save;
    }

     public static function pmb_excel($id_gelombang)
    {
        $value=DB::table('pendaftar')->where('id_gelombang', $id_gelombang)->orderBy('id_pendaftar', 'desc')->get(); 
        return $value;
    }



//link=======================================================================
    public static function link_show()
    {
        $value=DB::table('link')->orderBy('id_link', 'desc')->get(); 
        return $value;
    }
    public static function link_tambah($data)
    {
        $save = DB::table('link')->insert($data); 
        return $save;
    }
    public static function link_hapus()
    {
        $save = DB::table('link')->delete(); 
        return $save;
    }
    public static function link_hapus_select($id)
    {
        $save = DB::table('link')->where('id_link', $id)->delete(); 
        return $save;
    }
//linkEnd=======================================================================
//Gelombang=======================================================================
    public static function gelombang_show()
    {
        $value=DB::table('gelombang')->orderBy('id_gelombang', 'desc')->get(); 
        return $value;
    }

    public static function cek_gelombang()
    {
        return DB::table('gelombang')
            ->where('status_gelombang', 'aktiv')
            ->where('tanggal_akhir','>=', date('Y-m-d'))//baru
            ->get(); 
            // ->where('tanggal_akhir','>', $tanggal_awal)
    }

    public static function simpan_gelombang($data)
    {
        $save = DB::table('gelombang')->insert($data);
        return $save;
    }

    public static function cek_jurusan_aktiv()
    {
        return DB::table('jurusan')->where('status_jurusan', 'aktiv')->get(); 
    }

     public static function status_gelombang($id_gelombang, $data)
    {
        $save = DB::table('gelombang')->where('id_gelombang', $id_gelombang)->update($data);
        return $save;
    }

    public static function hapus_gelombang($id_gelombang){
        return DB::table('gelombang')->where('id_gelombang', $id_gelombang)->delete();
    }

     public static function cek_pendaftaran($id_gelombang)
    {
        $value=DB::table('pendaftar')->where('id_gelombang', $id_gelombang)->get(); 
        return $value;
    }
     public static function get_where_gelombang($id_gelombang)
    {
        $value=DB::table('gelombang')->where('id_gelombang', $id_gelombang)->first(); 
        return $value;
    }

    public static function simpan_gelombang_perpanjang($id_gelombang, $data)
    {
        $save = DB::table('gelombang')->where('id_gelombang', $id_gelombang)->update($data);
        return $save;
    }
//GelombangEnd====================================================================
//Jurusan=========================================================================
    public static function jurusan_show()
    {
        $value=DB::table('jurusan')->orderBy('id_jurusan', 'desc')->get(); 
        return $value;
    }

    public static function cek_jurusan($jurusan)
    {
        return DB::table('jurusan')->where('nama_jurusan', $jurusan)->first(); 
    }

    public static function simpan_jurusan($data)
    {
        $save = DB::table('jurusan')->insert($data);
        return $save;
    }

      public static function status_jurusan($id_jurusan, $data)
    {
        $save = DB::table('jurusan')->where('id_jurusan', $id_jurusan)->update($data);
        return $save;
    }

    public static function hapus_jurusan($id_jurusan){
        DB::table('konsentrasi')->where('id_jurusan', $id_jurusan)->delete();
        return DB::table('jurusan')->where('id_jurusan', $id_jurusan)->delete();
    }
    
    public static function jurusan_konsentrasi($id_jurusan)
    {
        $value=DB::table('konsentrasi')->where('id_jurusan', $id_jurusan)->orderBy('id_konsentrasi', 'desc')->get(); 
        return $value;
    }

    public static function konsentrasi_simpan($data)
    {
        $save = DB::table('konsentrasi')->insert($data);
        return $save;
    }
    public static function hapus_jurusan_konsentrasi($id_konsentrasi)
    {
        return DB::table('konsentrasi')->where('id_konsentrasi', $id_konsentrasi)->delete();
    }
//JurusanEnd=======================================================================
//Akun=============================================================================
    public static function admin_show()
    {
        $value=DB::table('admin')->where('level', '1')->orderBy('id_admin', 'desc')->get(); 
        return $value;
    }
    public static function cek_email_admin($email)
    {
        $value=DB::table('admin')->where('email', $email)->get(); 
        return $value;
    }

    public static function cek_username_admin($username)
    {
        $value=DB::table('admin')->where('username', $username)->get(); 
        return $value;
    }

     public static function simpan_admin($data)
    {
        $save = DB::table('admin')->insert($data);
        return $save;
    }

    public static function admin_hapus($id_admin){
        return DB::table('admin')->where('id_admin', $id_admin)->delete();
    }

     public static function ambil_data_admin($id_admin)
    {
        return DB::table('admin')->where('id_admin', $id_admin)->first(); 
    }

    public static function simpan_admin_update($id, $data)
    {
        $save = DB::table('admin')->where('id_admin', $id)->update($data);
        return $save;
    }

    
    public static function cs_show()
    {
        $value=DB::table('user')->where('level', 'cs')->orderBy('id_user', 'desc')->get(); 
        return $value;
    }
     public static function cek_email_cs($email)
    {
        $value=DB::table('user')->where('email', $email)->get(); 
        return $value;
    }

    public static function cek_username_cs($username)
    {
        $value=DB::table('user')->where('username', $username)->get(); 
        return $value;
    }
    public static function simpan_cs($data)
    {
        $save = DB::table('user')->insert($data);
        return $save;
    }

     public static function cs_hapus($id_cs){
        return DB::table('user')->where('id_user', $id_cs)->delete();
    }

     public static function ambil_data_cs($id_cs)
    {
        return DB::table('user')->where('id_user', $id_cs)->first(); 
    }

    public static function simpan_cs_update($id, $data)
    {
        $save = DB::table('user')->where('id_user', $id)->update($data);
        return $save;
    }
//Akunend==========================================================================
//Setting==========================================================================
    public static function setting_show()
    {
        $value=DB::table('setting')->where('id_setting', '1')->first(); 
        return $value;
    }
      public static function update_setting($data)
    {
        $save = DB::table('setting')->where('id_setting', '1')->update($data);
        return $save;
    }

    public static function data_rekening()
    {
        $value=DB::table('rekening')->orderBy('id_rekening', 'desc')->get(); 
        return $value;
    }

    public static function simpan_rekening($data)
    {
        $save = DB::table('rekening')->insert($data);
        return $save;
    }

    public static function update_rekening($id, $data)
    {
        $save = DB::table('rekening')->where('id_rekening', $id)->update($data);
        return $save;
    }
    public static function rekening_hapus($id)
    {
        $save = DB::table('rekening')->where('id_rekening', $id)->delete(); 
        return $save;
    }
//SettingEnd=======================================================================

     public static function data_admin($email, $password)
    {
        return DB::table('admin')->where('email', $email)->first(); 
    }



    public static function data_galeri()
    {
        $value=DB::table('galeri')->orderBy('id_galeri', 'desc')->get(); 
        return $value;
    }

    public static function galeri_simpan($nama_img)
    {
        $data = array('img' => $nama_img, 'status_img' => '1');
        $save = DB::table('galeri')->insert($data);
        return $save;
    }

    public static function upload_galeri($img)
    {
       $uploadPath = public_path('../../pascasarjana/assets/images/galeri/');
       //$uploadPath = public_path('../ok');
        /*
        if(!File::isDirectory($uploadPath)) {
            File::makeDirectory($uploadPath, 0755, true, true);
        }

        $explode = explode('.', $file->getClientOriginalName());
        $originalName = $explode[0];
        $extension = $file->getClientOriginalExtension();
        */
        //$rename = $name_file;//.'.'.$extension;
        $rename =  $img->getClientOriginalName();
        /*$mime = $img->getClientMimeType();
        $filesize = $img->getSize();
        */
        $img->move($uploadPath, $rename);
    }

    public static function get_galeri($id)
    {
        return DB::table('galeri')->where('id_galeri', $id)->first(); 
    }

    public static function galeri_hapus($id)
    {
        $save = DB::table('galeri')->where('id_galeri', $id)->delete(); 
        return $save;
    }

}