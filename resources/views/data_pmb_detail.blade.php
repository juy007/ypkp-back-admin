@include('layout/header')
<div class="page-wrapper">
	<div class="page-content">
		
		<div class="container">
			<div class="main-body">
				<div class="row">
					<div class="col-lg-8">
						<div class="card">
							<div class="card-body">
								<a href="{{ url('data-pmb') }}/{{ $data['gelombang']->id_gelombang }}" class="btn btn-primary btn-sm"><i class='bxx bx bx-chevron-left-circle'></i> Kembali</a>
								<div class="d-flex flex-column align-items-center text-center">
									<img src="{{ asset('uploads/dokumen/foto') }}/{{$data['data']->file_foto}}" alt="Admin" class="p-1 bg-danger" width="110">
									<div class="mt-3">
										<h4>{{ $data['data']->nama }}</h4>
										<p class="text-muted font-size-sm">{{ $data['gelombang']->nama_gelombang }}</p>
										<!--
										<p class="text-secondary mb-1"></p>
										<p class="text-muted font-size-sm">Bay Area, San Francisco, CA</p>
										<button class="btn btn-primary">Follow</button>
										<button class="btn btn-outline-primary">Message</button>
										-->
									</div>
								</div>
								<hr class="my-4" />
								<ul class="list-group list-group-flush" id="print">
									<li class="list-group-item d-flex align-items-center flex-wrap">
										<h6 class="mb-0 col-lg-4">Tempat, Tanggal Lahir</h6>
										
										<span class="text-secondary"> : {{ $data['data']->tempat_lahir }}, {{ date('d-m-Y', strtotime($data['data']->tanggal_lahir)) }}</span>
									</li>
									<li class="list-group-item d-flex align-items-center flex-wrap">
										<h6 class="mb-0 col-lg-4">Alamat </h6>
										
										<span class="text-secondary"> : {{ $data['data']->alamat }} Kec.{{ $data['data']->kecamatan }} {{ $data['data']->kota }} Provinsi {{ $data['data']->provinsi }}</span>
									</li>
									<li class="list-group-item d-flex align-items-center flex-wrap">
										<h6 class="mb-0 col-lg-4">Kode Pos </h6>
										
										<span class="text-secondary"> : {{ $data['data']->pos }}</span>
									</li>
									<li class="list-group-item d-flex align-items-center flex-wrap">
										<h6 class="mb-0 col-lg-4">E-mail </h6>
										
										<span class="text-secondary"> : {{ $data['data']->email }}</span>
									</li>
									<li class="list-group-item d-flex align-items-center flex-wrap">
										<h6 class="mb-0 col-lg-4">Telepon </h6>
										
										<span class="text-secondary"> : {{ $data['data']->telepon }}</span>
									</li>
									<li class="list-group-item d-flex align-items-center flex-wrap">
										<h6 class="mb-0 col-lg-4">Whatsapp </h6>
										
										<span class="text-secondary"> : {{ $data['data']->whatsapp }}</span>
									</li>
									<li class="list-group-item d-flex align-items-center flex-wrap">
										<h6 class="mb-0 col-lg-4">Jurusan </h6>
										
										<span class="text-secondary"> : {{ $data['data']->jurusan }}</span>
									</li>
									<li class="list-group-item d-flex align-items-center flex-wrap">
										<h6 class="mb-0 col-lg-4">Konsentrasi </h6>
										
										<span class="text-secondary"> : {{ $data['data']->konsentrasi }}</span>
									</li>
									<li class="list-group-item d-flex align-items-center flex-wrap">
										<h6 class="mb-0 col-lg-4">Foto </h6>
										
										: <a href="{{ asset('uploads/dokumen/foto') }}/{{ $data['data']->file_foto }}" download class="btn btn-primary btn-sm">Unduh</a>
									</li>
									<li class="list-group-item d-flex align-items-center flex-wrap">
										<h6 class="mb-0 col-lg-4">Ijazah </h6>
										
										: <a href="{{ asset('uploads/dokumen/ijazah') }}/{{ $data['data']->file_ijazah }}" download class="btn btn-primary btn-sm">Unduh</a>
									</li>
									<li class="list-group-item d-flex align-items-center flex-wrap">
										<h6 class="mb-0 col-lg-4">Transkip Nilai </h6>
										
										: <a href="{{ asset('uploads/dokumen/transkip') }}/{{ $data['data']->file_transkip }}" download class="btn btn-primary btn-sm">Unduh</a>
									</li>
									@if(!empty($data['data']->file_toefl))
									<li class="list-group-item d-flex align-items-center flex-wrap">
										<h6 class="mb-0 col-lg-4">Toefl </h6>
										
										: <a href="{{ asset('uploads/dokumen/toefl') }}/{{ $data['data']->file_toefl }}" download class="btn btn-primary btn-sm">Unduh</a>
									</li>
									@endif
									<li class="list-group-item d-flex align-items-center flex-wrap">
										<h6 class="mb-0 col-lg-4">KTP </h6>
										
										: <a href="{{ asset('uploads/dokumen/ktp') }}/{{ $data['data']->file_ktp }}" download class="btn btn-primary btn-sm">Unduh</a>
									</li>
									<li class="list-group-item d-flex align-items-center flex-wrap">
										<h6 class="mb-0 col-lg-4">Formulir </h6>
										
										: <a href="{{ asset('uploads/dokumen/formulir') }}/{{ $data['data']->file_formulir }}" download class="btn btn-primary btn-sm">Unduh</a>
									</li>

									<li class="list-group-item d-flex align-items-center flex-wrap">
										<h6 class="mb-0 col-lg-4">Surat Pernyataan Mahasiswa Baru </h6>
										
										: <a href="{{ asset('uploads/dokumen/pernyataan') }}/{{ $data['data']->file_pernyataan }}" download class="btn btn-primary btn-sm">Unduh</a>
									</li>
									
									<li class="list-group-item d-flex align-items-center flex-wrap">
										<h6 class="mb-0 col-lg-4">Pembayaran </h6>
										
										: <a href="{{ asset('uploads/dokumen/pembayaran') }}/{{ $data['data']->file_pembayaran }}" download class="btn btn-primary btn-sm">Unduh</a>
									</li>
									

									<li class="list-group-item d-flex align-items-center flex-wrap">
										<h6 class="mb-0 col-lg-4">Waktu pendaftaran </h6>
										
										<span class="text-secondary"> : {{ date('d-m-Y', strtotime($data['data']->tanggal_input)) }} {{ $data['data']->time }}</span>
									</li>
									
								</ul>
								<hr class="my-4" />
								<div class="d-flex flex-column align-items-center text-center">
									<div class="mt-3">
										<a href="{{ url('data-pmb-cetak') }}/{{ $data['data']->id_pendaftar  }}" target="_blank" class="btn btn-primary">Cetak</a>
										<a href="{{ url('data-pmb-pdf') }}/{{ $data['data']->id_pendaftar  }}" class="btn btn-outline-primary">Unduh PDF</a>
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
@include('layout/footer')