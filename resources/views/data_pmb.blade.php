@include('layout/header')
<!--start page wrapper -->
<div class="page-wrapper">
	<div class="page-content">
		<h6 class="mb-0 text-uppercase">Data Pendaftaran [ {{$data['gelombang']->nama_gelombang}} ]</h6>
		
		<hr/>

		<a href="{{ url('data-pmb-hapus-semua')}}/{{$data['gelombang']->id_gelombang}}" style="float:right;" type="button" class="btn btn-danger btn-sm"><i class='bxx bx bx-trash'></i>Hapus semua</a>
		<!--<a style="float:right;margin-right: 5px;" href="{{ url('data-pmb-excel') }}/{{$data['gelombang']->id_gelombang}}" type="button" class="btn btn-success btn-sm"><i class='bxx bx bx-spreadsheet'></i>Export Excel</a>-->
		<a style="float:right;margin-right: 5px;" href="{{ url('pendaftaran') }}" type="button" class="btn btn-primary btn-sm"><i class='bxx bx bx-chevron-left-circle'></i>Kembali</a>
		<br><br>
		<div class="card col-xl-12 mx-auto">

			@if (!empty(Session::get('notif_sukses')))
			<div class="col-md-8 alert alert-success border-0 bg-success alert-dismissible fade show">
				<div class="text-white">{{Session::get('notif_sukses')}}</div>
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
			@endif
			@if (!empty(Session::get('notif_gagal')))
			<div class="col-md-8 alert alert-danger border-0 bg-danger alert-dismissible fade show">
				<div class="text-white">{{Session::get('notif_gagal')}}</div>
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
			@endif

			<div id="notif_true" class="notif_fix alert">
				<strong>status changed successfully</strong>
			</div>
			<div id="notif_false" class="notif_fix alert">
				<strong>failed to change status</strong>
			</div>

			<div class="card-body">
				<div class="table-responsive">
					<table id="example" class="table table-striped table-hover table-bordered" style="width:100%">
						<thead>
							<tr>
								<th>No</th>
								<th>Foto</th>
								<th>Nama</th>
								<th>Jurusan</th>
								<th>Tanggal Mendaftar</th>
								<th>Aksi</th>
							</tr>
						</thead>
						<tbody>
							<?php $no=0; ?>

							@foreach($data['pmb']  as $valuePmb)
							<tr>
								<td valign="middle">{{ ++$no }}</td>
								<td valign="middle" align="center"><img style="height: 80px;" src="{{ asset('uploads/dokumen/foto') }}/{{ $valuePmb->file_foto}}"></td>
								<td valign="middle">{{ $valuePmb->nama }}</td>
								<td valign="middle">{{ $valuePmb->jurusan }}</td>
								<td valign="middle" align="center">{{ date('d-m-Y', strtotime($valuePmb->tanggal_input)) }}</td>
								<td align="center" valign="middle">
									<a href="{{ url('data-pmb-detail')}}/{{ $valuePmb->id_pendaftar }}" type="button" class="btn btn-primary btn-sm px-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Lihat"><i class='bxx bx bx-show-alt'></i></a>
									<a href="{{ url('data-pmb-hapus'); }}/{{ $valuePmb->id_pendaftar }}/{{ $data['gelombang']->id_gelombang }}" class="btn btn-danger btn-sm px-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Hapus"><i class='bxx bx bx-trash'></i></a>

									
								</td>
							</tr>
							@endforeach
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<!--end page wrapper -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
@include('layout/footer')