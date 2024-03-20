@include('layout/header')
<!--start page wrapper -->
<div class="page-wrapper">
	<div class="page-content">
		<h6 class="mb-0 text-uppercase">Rekening</h6>
		
		<hr/>
		<button style="float:right;" type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#formJurusan"><i class='bxx bx bx-plus'></i>Tambah</button>

		<div class="modal fade" id="formJurusan" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Form Rekening</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form action="{{ url('rekening-simpan') }}" method="POST" enctype="multipart/form-data" class="border p-4 rounded">
							@csrf
							<div class="row mb-3">
								<label for="bank" class="col-sm-3 col-form-label">Nama Bank</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="bank" name="bank" placeholder="" required>
								</div>
							</div>
							<div class="row mb-3">
								<label for="nama_rekening" class="col-sm-3 col-form-label">Nama Rekening</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="nama_rekening" name="nama_rekening" placeholder="" required>
								</div>
							</div>
							<div class="row mb-3">
								<label for="nomor_rekening" class="col-sm-3 col-form-label">Nomor</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="nomor_rekening" name="nomor_rekening" placeholder="" required>
								</div>
							</div>
							<div class="row mb-3">
								<label for="catatan" class="col-sm-3 col-form-label">Catatan</label>
								<div class="col-sm-9">
									<textarea class="form-control" name="catatan" id="catatan" rows="5"></textarea>
								</div>
							</div>

							<div class="row mb-3">
								<label for="status" class="col-sm-3 col-form-label">Nomor</label>
								<div class="col-sm-9">	
									<select id="status" class="form-select" name="status">
										<option value="aktif" selected>Aktif</option>
										<option value="nonaktif">Nonaktif</option>
									</select>
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
								<th>Bank</th>
								<th>Nama</th>
								<th>Nomor</th>
								<th>Catatan</th>
								<th>Status</th>
								<th>Aksi</th>
							</tr>
						</thead>
						<tbody>
							<?php $no=0; ?>

							@foreach($data['data'] as $valueRekening)
							<tr>
								<td>{{ ++$no }}</td>
								<td>{{ $valueRekening->bank }}</td>
								<td>{{ $valueRekening->nama }}</td>
								<td>{{ $valueRekening->nomor }}</td>
								<td>{{ $valueRekening->note }}</td>
								<td>{{ $valueRekening->status_rekening }}</td>
								<td align="center">
									<button class="btn btn-primary btn-sm px-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Ubah" onclick="modal_edit('{{$valueRekening->id_rekening}}','{{$valueRekening->bank}}','{{$valueRekening->nama}}','{{$valueRekening->nomor}}','{{$valueRekening->note}}','{{$valueRekening->status_rekening}}')"><i class='bxx bx bx-edit-alt mr-1'></i></button>
									
									<a href="{{ url('rekening-hapus'); }}/{{ $valueRekening->id_rekening }}" class="btn btn-danger btn-sm px-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Hapus"><i class='bxx bx bx-trash mr-1'></i></a>
									
								</td>
							</tr>
							@endforeach
						</tbody>
					</table>
					<div class="modal fade" id="formEdit" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Form Edit Rekening</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form action="{{ url('update-rekening') }}" method="POST" enctype="multipart/form-data" class="border p-4 rounded">
										@csrf
										<input type="hidden" name="id" id="formidEdit" value="">
										<div class="row mb-3">
											<label for="bank" class="col-sm-3 col-form-label">Nama Bank</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="bankEdit" name="bank" placeholder="" required>
											</div>
										</div>
										<div class="row mb-3">
											<label for="nama_rekening" class="col-sm-3 col-form-label">Nama Rekening</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="nama_rekeningEdit" name="nama_rekening" placeholder="" required>
											</div>
										</div>
										<div class="row mb-3">
											<label for="nomor_rekening" class="col-sm-3 col-form-label">Nomor</label>
											<div class="col-sm-9">
												<input type="text" class="form-control" id="nomor_rekeningEdit" name="nomor_rekening" placeholder="" required>
											</div>
										</div>
										<div class="row mb-3">
											<label for="catatanEdit" class="col-sm-3 col-form-label">Catatan</label>
											<div class="col-sm-9">
												<textarea class="form-control" name="catatan" id="catatanEdit" rows="5"></textarea>
											</div>
										</div>
										<div class="row mb-3">
											<label for="status" class="col-sm-3 col-form-label">Status</label>
											<div class="col-sm-9">	
												<select id="statusEdit" class="form-select" name="status">
													
												</select>
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
<script src="{{ asset('assets/js/jquery.min.js') }}"></script>
<script type="text/javascript">
	function modal_edit(id_rekening,bank,nama,nomor,note,status)
	{
		
		$('#formidEdit').val(id_rekening);
		$('#bankEdit').val(bank);
		$('#nama_rekeningEdit').val(nama);
		$('#nomor_rekeningEdit').val(nomor);
		$('#catatanEdit').val(note);
		document.getElementById('statusEdit').innerHTML='<option value='+status+' selected>'+status+'</option><option value=aktif>Aktif</option><option value=nonaktif>Nonaktif</option>';
		
		$('#formEdit').modal('show');

	}
</script>
@include('layout/footer')	