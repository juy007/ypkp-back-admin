@include('layout/header')
<!--start page wrapper -->
<div class="page-wrapper">
	<div class="page-content">
		<h4 class="mb-0 text-uppercase">Galeri</h4>
		
		<hr/>
		<button style="float:right;" type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#formGaleri"><i class='bxx bx bx-plus'></i>Tambah</button>

		<div class="modal fade" id="formGaleri" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Form Admin</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form action="{{ url('upload-galeri') }}" method="POST" enctype="multipart/form-data" class="border p-4 rounded">
							@csrf
							<div class="row mb-3">
								<label for="formnama" class="col-sm-3 col-form-label">Nama</label>
								<div class="col-sm-9">
								<input type="file" class="form-control" id="customFile" name="img" accept=".png,.jpg,.jpeg" required>
								</div>
							</div>
							
										

							<div class="modal-footer">
								<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Batal</button>
								<button type="submit" class="btn btn-primary">Simpan</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

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
								<th>Image</th>
								<th>Name</th>
								<th>Aksi</th>
							</tr>
						</thead>
						<tbody>
							<?php $no=0; ?>

							@foreach($data['data'] as $valueGaleri)
							<tr>
								<td>{{ ++$no }}</td>
								<!--<td><img width="500" src="../pascasarjana/assets/images/galeri/{{ $valueGaleri->img }}" alt=""></td>-->
								<td><img width="500" src="../public_html/assets/images/galeri/{{ $valueGaleri->img }}" alt=""></td>
								<td>{{ $valueGaleri->img }}</td>
								<td align="center">
									<a href="{{ url('galeri-hapus'); }}/{{ $valueGaleri->id_galeri }}" class="btn btn-danger btn-sm px-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Hapus"><i class='bxx bx bx-trash mr-1'></i></a>
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


@include('layout/footer')	