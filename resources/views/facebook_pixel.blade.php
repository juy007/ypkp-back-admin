@include('layout/header')
<!--start page wrapper -->
<div class="page-wrapper">
	<div class="page-content">


		<div class="row">
			<div class="col-xl-9 mx-auto">
				<h6 class="mb-0 text-uppercase"></h6>
				
				<div class="card border-top border-0 border-4 border-primary">
					<div class="card-body">
						<form action="{{ url('update-facebook-pixel') }}" method="POST" enctype="multipart/form-data" class="border p-4 rounded">
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

							
							
							<div class="row mb-3">
								<label for="nama" class="col-sm-3 col-form-label">Kode Facebook Pixel</label>
								<div class="col-sm-9">
									<textarea class="form-control" rows="10" id="facebook_pixel" name="kode" placeholder="" required>{{ $data['data']->facebook_pixel }}</textarea>
									
								</div>
							</div>

							<div class="row">
								<label class="col-sm-3 col-form-label"></label>
								<div class="col-sm-9" style="text-align:right;">
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