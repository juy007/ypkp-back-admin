@include('layout/header')
<!--start page wrapper -->
<div class="page-wrapper">
	<div class="page-content">
		<h6 class="mb-0 text-uppercase">Gelombang Pendaftaran</h6>
		
		<hr/>
		
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
								<th>Nama Gelombang</th>
								<th>Tanggal Pendaftaran</th>
								<th>Status</th>
								<th>Aksi</th>
							</tr>
						</thead>
						<tbody>
							<?php $no=0; ?>

							@foreach($data['data'] as $valueGelombang)
							<tr>
								<td>{{ ++$no }}</td>
								<td>{{ $valueGelombang->nama_gelombang }}</td>
								<td>{{ date('d-m-Y', strtotime($valueGelombang->tanggal_mulai)) }} S/d {{ date('d-m-Y', strtotime($valueGelombang->tanggal_akhir)) }}</td>
								<td align="center">
									@if($valueGelombang->status_gelombang=='aktiv' && date('Y-m-d') <= $valueGelombang->tanggal_akhir)
									<label class="badge bg-success">Aktiv</label>
									@elseif ($valueGelombang->status_gelombang=='nonaktiv' && date('Y-m-d') <= $valueGelombang->tanggal_akhir)
									<label class="badge bg-danger">Nonaktiv</label>
									@else
									<label class="badge bg-warning">Kadaluarsa</label>
									@endif
								</td>
								<td align="center">
									<a href="{{ url('data-pmb')}}/{{ $valueGelombang->id_gelombang }}" type="button" class="btn btn-primary btn-sm px-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Lihat"><i class='bxx bx bx-show-alt'></i></a>
									
									
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