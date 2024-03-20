@include('layout/header')
<!--start page wrapper -->
<div class="page-wrapper">
	<div class="page-content">
		<h6 class="mb-0 text-uppercase">Customer Services</h6>
		
		<hr/>
		<button style="float:right;" type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#formJurusan"><i class='bxx bx bx-plus'></i>Tambah CS</button>

		<div class="modal fade" id="formJurusan" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Form Customer Services</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form action="{{ url('cs-simpan') }}" method="POST" enctype="multipart/form-data" class="border p-4 rounded">
							@csrf
							<div class="row mb-3">
								<label for="formnama" class="col-sm-3 col-form-label">Nama</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="formnama" name="nama" placeholder="" required>
								</div>
							</div>
							<div class="row mb-3">
								<label for="formemail" class="col-sm-3 col-form-label">E-mail</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="formemail" name="email" placeholder="" required>
								</div>
							</div>
							<div class="row mb-3">
								<label for="formusername" class="col-sm-3 col-form-label">Username</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="formusername" name="username" placeholder="" required>
								</div>
							</div>
							<div class="row mb-3">
								<label for="formpassword" class="col-sm-3 col-form-label">Password</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="formpassword" name="password" placeholder="" required>
									<input type="hidden" name="level" value="cs">
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
		<div class="card col-xl-9 mx-auto">

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
								<th>Nama</th>
								<th>E-mail</th>
								<th>Username</th>
								<th>Aksi</th>
							</tr>
						</thead>
						<tbody>
							<?php $no=0; ?>

							@foreach($data['data'] as $valueUser)
							<tr>
								<td>{{ ++$no }}</td>
								<td>{{ $valueUser->nama }}</td>
								<td>{{ $valueUser->email }}</td>
								<td>{{ $valueUser->username }}</td>
								<td align="center">
									<button class="btn btn-primary btn-sm px-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Ubah" onclick="modal_edit('{{$valueUser->id_user}}')"><i class='bxx bx bx-edit-alt mr-1'></i></button>
									@if(session()->get('emailAdmin') != $valueUser->email)
									<a href="{{ url('cs-hapus'); }}/{{ $valueUser->id_user }}" class="btn btn-danger btn-sm px-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Hapus"><i class='bxx bx bx-trash mr-1'></i></a>
									@endif
								</td>
							</tr>
							@endforeach
						</tbody>
					</table>
					<div class="modal fade" id="formEdit" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Form Admin</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form action="{{ url('cs-simpan-update') }}" method="POST" enctype="multipart/form-data" class="border p-4 rounded">
										@csrf
										<div class="row mb-3">
											<label for="formnama" class="col-sm-3 col-form-label">Nama</label>
											<div class="col-sm-9">
												<input type="hidden" name="id" id="formidEdit" value="">
												<input type="text" class="form-control" id="formnamaEdit" name="namaEdit" placeholder="" required>
											</div>
										</div>
										<div class="row mb-3">
											<label for="formemail" class="col-sm-3 col-form-label">E-mail</label>
											<div class="col-sm-9">
												<input type="email" class="form-control" id="formemailEdit" name="emailEdit" placeholder="" required>
											</div>
										</div>
										<div class="row mb-3">
											<label for="formusername" class="col-sm-3 col-form-label">Username</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="formusernameEdit" name="usernameEdit" placeholder="" required>
											</div>
										</div>
										<div class="row mb-3">
											<label for="formpassword" class="col-sm-3 col-form-label">Password</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="formpasswordEdit" name="passwordEdit" placeholder="Isi password jika ingin mengubahnya">
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
				</div>
			</div>
		</div>
	</div>
</div>
<!--end page wrapper -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	function modal_edit(id_user)
	{
		var url = "{{ url('cs-ambil-data') }}";

		$.ajax({
			type    : 'POST',
			url     : url,
			data    : {'id_user': id_user,'_token': '{{csrf_token()}}'},
			dataType: "json",
			success : function(result){
				$('#formidEdit').val(result.id_cs);
				$('#formnamaEdit').val(result.nama);
				$('#formemailEdit').val(result.email);
				$('#formusernameEdit').val(result.username);
				$('#formEdit').modal('show');
            }
        });
	}
</script>
@include('layout/footer')	