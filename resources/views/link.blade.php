@include('layout/header')
<!--start page wrapper -->
<div class="page-wrapper">
	<div class="page-content">
		<h6 class="mb-0 text-uppercase">Link Pendaftaran</h6>
		
		<hr/>
		<a href="{{ url('tambah-link')}}" style="float:right;" type="button" class="btn btn-primary btn-sm"><i class='bxx bx bx-plus'></i>Tambah link</a>;
		<a href="{{ url('link-hapus')}}" style="float:right;margin-right: 5px;" type="button" class="btn btn-danger btn-sm"><i class='bxx bx bx-trash'></i>Hapus semua link</a>
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
				<strong>Link disalin</strong>
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
								<th>Link</th>
								<th>Status</th>
								<th>Aksi</th>
							</tr>
						</thead>
						<tbody>
							<?php $no=0; ?>

							@foreach($data['data'] as $valueLink)
							<tr>
								<td>{{ ++$no }}</td>
								<td>http://localhost/pascasarjana/daftar/{{ substr($valueLink->link_address, 0, 10) }}...</td>
								<td align="center">
									@if($valueLink->status_link=='false')
									<label class="badge bg-warning">belum mendaftar</label>
									@elseif ($valueLink->status_link=='true')
									<label class="badge bg-success">sudah mendaftar</label>
									@endif
								</td>
								<td align="center">
									@if($valueLink->status_link=='false')
									<button type="button" class="btn btn-primary btn-sm px-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Salin link" onclick="salin_link('{{ $valueLink->link_address }}');"><i class='bxx bx bx-copy'></i></button>
									@endif
									
									<a href="{{ url('link-hapus-select'); }}/{{ $valueLink->id_link }}" class="btn btn-danger btn-sm px-2" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Hapus"><i class='bxx bx bx-trash'></i></a>
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
<input style="background: none;border: none;outline: none;color: none;" type="text"  id="copy_link" name="copy_link">
<!--end page wrapper -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	function status_change(id_switch, id_link)
	{

		if (document.getElementById(id_switch+id_link).checked) {
			var status_change='aktiv';
		}else {
			var status_change='nonaktiv';
		}
		var url="{{ url('jurusan-status')}}";

		$.ajax({
			type    : 'POST',
			url     : url,
			data    : {'id_link': id_link, 'jurusan_status': status_change,  '_token': '{{csrf_token()}}'},
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
	function salin_link(link)
	{
		$('#copy_link').val('http://localhost/pascasarjana/daftar/'+link);
		document.getElementById('copy_link').select();
        document.execCommand("copy")
        $("#notif_true").fadeIn(1500);
		$("#notif_true").fadeOut(1500);
	}
</script>
@include('layout/footer')	