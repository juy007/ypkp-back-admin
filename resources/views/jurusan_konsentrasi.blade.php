@include('layout/header')
<!--start page wrapper -->
<div class="page-wrapper">
	<div class="page-content">
		<h6 class="mb-0 text-uppercase">Jurusan-Konsentrasi</h6>
		
		<hr/>
		<button style="float:right;" type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#formJurusan"><i class='bxx bx bx-plus'></i>Tambah Konsentrasi</button>
        <a style="float:right;margin-right: 5px;" href="{{ url('jurusan') }}" type="button" class="btn btn-primary btn-sm"><i class='bxx bx bx-chevron-left-circle'></i>Kembali</a>

		<div class="modal fade" id="formJurusan" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Form Konsentrasi</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form action="{{ url('jurusan-konsentrasi-simpan') }}" method="POST" enctype="multipart/form-data" class="border p-4 rounded">
							@csrf
							<div class="row mb-3">
								<label for="formkonsentrasi" class="col-sm-3 col-form-label">Konsentrasi</label>
								<div class="col-sm-9">
                                    <input type="hidden" name="id_jurusan" value="{{ $data['id_jurusan'];}}">
									<input type="text" class="form-control" id="formkonsentrasi" name="konsentrasi" placeholder="" required>
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
        Jurusan : {{ $data['jurusan']->nama_jurusan; }}
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
								<th>Konsentrasi</th>
								<th>Aksi</th>
							</tr>
						</thead>
						<tbody>
							<?php $no=0; ?>
                            
							@foreach($data['data'] as $valueKonsentrasi)
							<tr>
								<td>{{ ++$no }}</td>
								<td>{{ $valueKonsentrasi->konsentrasi }}</td>
								
								<td align="center">
									<a href="{{ url('jurusan-konsentrasi-hapus'); }}/{{ $valueKonsentrasi->id_jurusan}}/{{ $valueKonsentrasi->id_konsentrasi}}" class="btn btn-danger btn-sm" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Hapus"><i class='bxx bx bx-trash'></i></a>
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
<script type="text/javascript">
	function status_change(id_switch, id_jurusan)
	{

		if (document.getElementById(id_switch+id_jurusan).checked) {
			var status_change='aktiv';
		}else {
			var status_change='nonaktiv';
		}
		var url="{{ url('jurusan-status')}}";

		$.ajax({
			type    : 'POST',
			url     : url,
			data    : {'id_jurusan': id_jurusan, 'jurusan_status': status_change,  '_token': '{{csrf_token()}}'},
			dataType: "json",
			success : function(result){
				if (result.notif=='true') {
					$("#notif_true").fadeIn(1500);
					$("#notif_true").fadeOut(1500);
                    //document.querySelector('#notif_true').classList.add('show');
                }else if(result.notif=='false') {
                    $("#notif_false").fadeIn(1000);
                    $("#notif_false").fadeOut(1000);
                }
            }
        });
	}
</script>
@include('layout/footer')	