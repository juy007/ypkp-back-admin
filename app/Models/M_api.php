<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB; 
use Illuminate\Support\Facades\File;

class M_api extends Model
{
    //public $timestamps = false;
    //use HasFactory;
    /*
    protected $table = 'warga';
        protected $primaryKey = 'id_warga';
        protected $fillable = ['nokk', 'nik', 'nama', 'input_warga'];
    }
    */
    public static function cek_link($link)
    {
        return DB::table('link')->where('link_address', $link)->where('status_link', 'false')->get(); 
    }

    public static function cek_gelombang()
    {
        return DB::table('gelombang')
        ->where('status_gelombang', 'aktiv')
        ->get(); 
    }

    public static function get_setting()
    {
        return DB::table('setting')->where('id_setting', '1')->first();
    }

    public static function get_jurusan()
    {
        return DB::table('jurusan')
        ->where('status_jurusan', 'aktiv')
        ->get();
    }

    public static function get_konsentrasi($id_jurusan)
    {
        return DB::table('konsentrasi')
        ->where('id_jurusan', $id_jurusan)
        ->get();
    }

    public static function get_rekening()
    {
        return DB::table('rekening')
        ->where('status_rekening', 'aktif')
        ->get();
    }

    public static function get_galeri()
    {
        return DB::table('galeri')->orderBy('id_galeri', 'desc')->get();
    }

     public static function cek_pendaftaran($id_gelombang, $email)
    {
        return DB::table('pendaftar')
        ->where('id_gelombang', $id_gelombang)
        ->where('email', $email)
        ->get(); 
    }

    public static function simpan_pendaftaran($data)
    {
        $save = DB::table('pendaftar')->insert($data);
        return $save;
    }

    public static function upload_dokumen($file, $name_file, $folder)
    {
        $uploadPath = public_path('uploads/dokumen/'.$folder);
        /*
        if(!File::isDirectory($uploadPath)) {
            File::makeDirectory($uploadPath, 0755, true, true);
        }

        $explode = explode('.', $file->getClientOriginalName());
        $originalName = $explode[0];
        $extension = $file->getClientOriginalExtension();
        */
        $rename = $name_file;//.'.'.$extension;
        $mime = $file->getClientMimeType();
        $filesize = $file->getSize();

        $file->move($uploadPath, $rename);
    }

    public static function update_link($link)
    {
        $save = DB::table('link')->where('link_address', $link)->update(array('status_link' => 'true'));
        return $save;
    }








   

    

    
    /*
    public static function simpan_edit_warga($id, $data)
    {
        $save = DB::table('warga')->where('id_warga', $id)->update($data);
        return $save;
    }

    public static function hapus_warga($id){
        $save = DB::table('warga')->where('id_warga', '=', $id)->delete();
        return $save;
    }
     public static function tampil_warga()
    {
        $data = DB::table('warga')->orderBy('id_warga', 'desc')->get();
        return $data;
    }

    public static function tampil_warga()
    {
        $value=DB::table('warga')->orderBy('id_warga', 'desc')->get(); 
        return $value;
    }

    public static function simpan_warga($data)
    {
        $save = DB::table('warga')->insert($data);
        return $save;
    }

    public static function get_warga($id)
    {
        $value=DB::table('warga')->where('id_warga', $id)->first(); 
        return $value;
    }

   

    public static function hapus_warga($id){
        $save = DB::table('warga')->where('id_warga', '=', $id)->delete();
        return $save;
    }

    public static function get_admin($email, $password)
    {
        return DB::table('admin')->where('email', $email)->first(); 
    }
    */
}