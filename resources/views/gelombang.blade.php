@include('layout/header')
<!--start page wrapper -->
<div class="page-wrapper">
	<div class="page-content">
		<h6 class="mb-0 text-uppercase">Gelombang Pendaftaran</h6>
		
		<hr/>
		<button style="float:right;" type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#formgelombang"><i class='bxx bx bx-plus'></i>Tambah Gelombang</button>

		<div class="modal fade" id="formgelombang" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Form Gelombang</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form action="{{ url('gelombang-simpan') }}" method="POST" enctype="multipart/form-data" class="border p-4 rounded">
							@csrf
							<div class="row mb-3">
								<label for="formgelombang" class="col-sm-3 col-form-label">Tahun Ajaran</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="formgelombang" name="gelombang" placeholder="Tahun Ajaran 2020/2021 Gelombang I" required>
								</div>
							</div>
							<div class="row mb-3">
								<label for="formgelombang" class="col-sm-3 col-form-label">Tanggal Pendaftaran</label>
								<div class="col-sm-3">
									<input type="date" class="form-control" id="tanggal_awal" name="tanggal_awal" min="{{ date('Y-m-d')}}" onchange="tanggal_gelombang();" required>
								</div>
								<div class="col-sm-1" style="text-align: center;padding-top: 8px;">
									<span>S/d</span>
								</div>
								<div class="col-sm-3">
									<input type="date" class="form-control" id="tanggal_akhir" name="tanggal_akhir" required>
								</div>
							</div>
							<div class="row mb-3">
								<label for="formgelombang" class="col-sm-3 col-form-label">Status</label>
								<div class="col-sm-6">
									
									<select id="inputState" class="status_gelombang form-select" name="status_gelombang">
										@if(count($data['gelombang_aktiv'])<1)
										<option value="aktiv" selected>Aktiv</option>
										@endif
										<option value="nonaktiv">Nonaktiv</option>
									</select>
									
									<span id="noteFormStatus" style="color:#DDA601;">
										@if(count($data['gelombang_aktiv'])>0)
										Status otomatis nonkativ karena masih ada gelombang yang aktiv
										@endif
									</span>
									
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
									Aktiv
									<label class="switch">
										<input id="status_change_c{{ $valueGelombang->id_gelombang }}" type="checkbox" class="" onclick="status_change('status_change_c','{{ $valueGelombang->id_gelombang }}','{{ $valueGelombang->tanggal_akhir }}');" checked>
										<span class="slider round"></span>
									</label>
									Nonaktiv
									@elseif ($valueGelombang->status_gelombang=='nonaktiv' && date('Y-m-d') <= $valueGelombang->tanggal_akhir)
									Aktiv
									<label class="switch">
										<input id="status_change{{ $valueGelombang->id_gelombang }}" type="checkbox" class="" onclick="status_change('status_change','{{ $valueGelombang->id_gelombang }}', '{{ $valueGelombang->tanggal_akhir }}');">
										<span class="slider round"></span>
									</label>
									Nonaktiv
									@else
									<label class="badge bg-danger">Kadaluarsa</label>
									@endif
								</td>
								<td align="center">
									<button type="button" class="btn btn-primary btn-sm px-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Perpanjang" onclick="form_perpanjang('{{ $valueGelombang->id_gelombang }}');"><i class='bxx bx bx-calendar-plus'></i></button>
									<a href="{{ url('gelombang-hapus'); }}/{{ $valueGelombang->id_gelombang }}" class="btn btn-danger btn-sm px-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Hapus"><i class='bxx bx bx-trash'></i></a>

									
								</td>
							</tr>
							@endforeach
						</tbody>
					</table>

					<div class="modal fade" id="formPerpanjang" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Form Perpanjang Gelombang</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form action="{{ url('gelombang-simpan-perpanjang') }}" method="POST" enctype="multipart/form-data" class="border p-4 rounded">
										@csrf
										<div class="row mb-3">
											<label for="formgelombang_perpanjang" class="col-sm-3 col-form-label">Tahun Ajaran</label>
											<div class="col-sm-9">
												<input type="hidden" id="id_gelombang" name="id_gelombang" value="">
												<input type="text" class="form-control" id="formgelombang_perpanjang" name="gelombang" placeholder="Tahun Ajaran 2020/2021 Gelombang I" readonly required>
											</div>
										</div>
										<div class="row mb-3">
											<label for="formgelombang" class="col-sm-3 col-form-label">Tanggal Pendaftaran</label>
											<div class="col-sm-3">
												<input type="date" class="form-control" id="tanggal_awal_perpanjang" name="tanggal_awal" readonly required>
											</div>
											<div class="col-sm-1" style="text-align: center;padding-top: 8px;">
												<span>S/d</span>
											</div>
											<div class="col-sm-3">
												<input type="date" class="form-control" id="tanggal_akhir_perpanjang" name="tanggal_akhir" min="{{ date('Y-m-d')}}" required>
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
	function tanggal_gelombang()
	{
		document.getElementById('tanggal_akhir').min=$('#tanggal_awal').val();
	}
	
	function status_change(id_switch, id_gelombang, tanggal_akhir)
	{

		if (document.getElementById(id_switch+id_gelombang).checked) {
			var status_change='aktiv';
		}else {
			var status_change='nonaktiv';
		}
		var url="{{ url('gelombang-status')}}";

		$.ajax({
			type    : 'POST',
			url     : url,
			data    : {'id_gelombang': id_gelombang, 'gelombang_status': status_change, 'tanggal_akhir': tanggal_akhir,  '_token': '{{csrf_token()}}'},
			dataType: "json",
			success : function(result){
				if (result.notif=='true') {
					$("#notif_true").html('<strong>Berhasil mengubah status gelombang</strong>');
					$("#notif_true").fadeIn(1500);
					$("#notif_true").fadeOut(1500);
                    //document.querySelector('#notif_true').classList.add('show');
                }else if(result.notif=='false') {
                	$("#notif_false").html('<strong>Gagal mengubah status gelombang</strong>');
                    $("#notif_false").fadeIn(1500);
                    $("#notif_false").fadeOut(1500);
                }else if(result.notif=='not') {
                	document.getElementById(id_switch+id_gelombang).checked=false;
                	$("#notif_false").html('<strong>Gelombang pendataran sedang ada yang aktiv</strong>');
                    $("#notif_false").fadeIn(1500);
                    $("#notif_false").fadeOut(1500);
                }else if(result.notif=='not2') {
                	document.getElementById(id_switch+id_gelombang).checked=false;
                	$("#notif_false").html('<strong>Gelombang sudah melewati tanggal akhir</strong>');
                    $("#notif_false").fadeIn(1500);
                    $("#notif_false").fadeOut(1500);
                }else if(result.notif=='not3') {
                	document.getElementById(id_switch+id_gelombang).checked=false;
                	$("#notif_false").html('<strong>Minimal harus aktiv satu jurusan</strong>');
                    $("#notif_false").fadeIn(1500);
                    $("#notif_false").fadeOut(1500);
                }

               	if (result.gelombang_aktiv <1) {
               		$('.status_gelombang').html('<option value=aktiv selected>Aktiv</option><option value=nonaktiv>Nonaktiv</option>');
               		$('#noteFormStatus').html('');
               	}else if (result.gelombang_aktiv >0) {
               		$('.status_gelombang').html('<option value="nonaktiv">Nonaktiv</option>');
               		$('#noteFormStatus').html('Status otomatis nonkativ karena masih ada gelombang yang aktiv');
               	}
                
            }
        });
	}

	function form_perpanjang(id_gelombang)
	{
		//$('#formPerpanjang').modal('show');
		var url = "{{ url('gelombang-get') }}";

		$.ajax({
			type    : 'POST',
			url     : url,
			data    : {'id_gelombang': id_gelombang,'_token': '{{csrf_token()}}'},
			dataType: "json",
			success : function(result){
				$('#id_gelombang').val(result.id_gelombang);
				$('#formgelombang_perpanjang').val(result.nama_gelombang);
				$('#tanggal_awal_perpanjang').val(result.tanggal_awal);
				$('#tanggal_akhir_perpanjang').val(result.tanggal_akhir);
				$('#formPerpanjang').modal('show');
            }
        });
	}
	
</script>
@include('layout/footer')