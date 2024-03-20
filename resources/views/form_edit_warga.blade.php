@include('layout/header')
<!--start page wrapper -->
<div class="page-wrapper">
	<div class="page-content">


		<div class="row">
			<div class="col-xl-9 mx-auto">
				<h6 class="mb-0 text-uppercase"></h6>
				<hr/>
				<div class="card border-top border-0 border-4 border-primary">
					<div class="card-body">
						<form action="{{ url('warga-edit-simpan') }}" method="POST" enctype="multipart/form-data" class="border p-4 rounded">
							@csrf
							@if (!empty(Session::get('notif_sukses')))
							<div class="alert alert-success border-0 bg-success alert-dismissible fade show">
								<div class="text-white">{{Session::get('notif_sukses')}}</div>
								<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
							</div>
							@endif
							@if (!empty(Session::get('notif_gagal')))
							<div class="alert alert-danger border-0 bg-danger alert-dismissible fade show">
								<div class="text-white">{{Session::get('notif_gagal')}}</div>
								<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
							</div>
							@endif

							<div class="card-title d-flex align-items-center">
								<div><i class="bx bxs-user me-1 font-22 text-primary"></i>
								</div>
								<h5 class="mb-0 text-primary">Form Edit Warga {{ Session::get('notifikasi') }}</h5>
							</div>
							<hr/>
							<div class="row mb-3">
								<label for="nomorkk" class="col-sm-3 col-form-label">Nomor KK</label>
								<div class="col-sm-9">
									<input type="hidden" name="id" value="{{ $data['data']->id_warga }}" placeholder="" required>
									<input type="text" class="form-control" id="nomorkk" name="nokk" value="{{ $data['data']->nokk }}" placeholder="" required>
								</div>
							</div>
							<div class="row mb-3">
								<label for="nik" class="col-sm-3 col-form-label">NIK Kepala Keluarga</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="nik" name="nik" value="{{ $data['data']->nik }}" placeholder="" required>
								</div>
							</div>
							<div class="row mb-3">
								<label for="nama" class="col-sm-3 col-form-label">Nama Kepala Keluarga</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="nama" name="nama" value="{{ $data['data']->nama }}" placeholder="" required>
									<input type="hidden" name="input_warga" value="<?php echo date('Y-m-d'); ?>">
								</div>
							</div>

							<div class="row">
								<label class="col-sm-3 col-form-label"></label>
								<div class="col-sm-9">
									<a href="{{ url('warga')}}" class="btn btn-danger">Batal</a>
									<button type="submit" class="btn btn-primary">Simpan</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!--end row-->
	</div>
</div>
<!--end page wrapper -->
@include('layout/footer')	