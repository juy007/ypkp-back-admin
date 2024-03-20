<div style="width: 650px;padding-right: 20px;padding-left: 20px;padding-bottom: 40px;">
	<table border="0" style="width: 100%;">
		<tr>
			<td><img style="height:150px;" src={{ asset('assets/images/logo.png') }}></td>
			<td align="center" valign="middle" style="">
				<h3 style="margin-top:10px;">Data Calon Mahasiswa</h3><br>
				<h3 style="margin-top:-20px;">Universitas Sangga Buana YPKP Bandung</h3><br>
				<p style="margin-top:-20px;font-size: 13px;">Jl. PH.H. Mustofa No.68, Cikutra, Kec. Cibeunying Kidul Kota Bandung, Jawa Barat 40124</p>
			</td>
		</tr>
	</table><hr><br>
	<table border="0" style="width: 100%;">
		<tr>
			<td width="140"><img src="{{ asset('uploads/dokumen/foto') }}/{{$data['data']->file_foto}}" alt="Admin" class="p-1 bg-danger" width="110"></td>
			<td><h2>{{ $data['data']->nama }}</h2></td>
		</tr>
	</table><hr><br>
	<table border="0" style="width: 100%;font-size: 16px;">
		<tr>
			<td width="200" height="40" valign="middle">Gelombang</td>
			<td>: {{ $data['gelombang']->nama_gelombang }}</td>
		</tr>
		<tr>
			<td width="200" height="40" valign="middle">Tempat, Tanggal Lahir</td>
			<td>: {{ $data['data']->tempat_lahir }}, {{ date('d-m-Y', strtotime($data['data']->tanggal_lahir)) }}</td>
		</tr>
		<tr>
			<td width="200" height="40" valign="middle">Alamat</td>
			<td>: {{ $data['data']->alamat }} Kec.{{ $data['data']->kecamatan }} {{ $data['data']->kota }} Provinsi {{ $data['data']->provinsi }}</td>
		</tr>
		<tr>
			<td width="200" height="40" valign="middle">Kode Pos</td>
			<td>: {{ $data['data']->pos }}</td>
		</tr>
		<tr>
			<td width="200" height="40" valign="middle">E-mail</td>
			<td>: {{ $data['data']->email }}</td>
		</tr>
		<tr>
			<td width="200" height="40" valign="middle">Telepon</td>
			<td>: {{ $data['data']->telepon }}</td>
		</tr>
		<tr>
			<td width="200" height="40" valign="middle">Whatsapp</td>
			<td>: {{ $data['data']->whatsapp }}</td>
		</tr>
		<tr>
			<td width="200" height="40" valign="middle">Jurusan</td>
			<td>: {{ $data['data']->jurusan }}</td>
		</tr>
		<tr>
			<td width="200" height="40" valign="middle">Konsentrasi</td>
			<td>: {{ $data['data']->konsentrasi }}</td>
		</tr>
		<tr>
			<td width="200" height="40" valign="middle">Waktu Pendaftaran</td>
			<td>: {{ date('d-m-Y', strtotime($data['data']->tanggal_input)) }} {{ $data['data']->time }}</td>
		</tr>
		
	</table>
	<hr>
</div>
			
									
<script type="text/javascript">
	window.print();
</script>