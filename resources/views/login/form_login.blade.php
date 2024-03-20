<!doctype html>
	<html lang="en">

	<head>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!--favicon-->
		<link rel="icon" href="{{ asset('assets/images/favicon.png') }}" type="image/png" />
		<!--plugins-->
		<link href="{{ asset('assets/plugins/simplebar/css/simplebar.css') }}" rel="stylesheet" />
		<link href="{{ asset('assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css') }}" rel="stylesheet" />
		<link href="{{ asset('assets/plugins/metismenu/css/metisMenu.min.css') }}" rel="stylesheet" />
		<!-- loader-->
		<link href="{{ asset('assets/css/pace.min.css') }}" rel="stylesheet" />
		<script src="{{ asset('assets/js/pace.min.js') }}"></script>
		<!-- Bootstrap CSS -->
		<link href="{{ asset('assets/css/bootstrap.min.css') }}" rel="stylesheet">
		<link href="{{ asset('assets/css/app.css') }}" rel="stylesheet">
		<link href="{{ asset('assets/css/icons.css') }}" rel="stylesheet">
		<title>Login | Administrator</title>

		<style type="text/css">

	</style>
</head>

<body class="bg-login" style="background: #000;">
	<!--wrapper-->
	<div class="wrapper">
		<div class="section-authentication-signin d-flex align-items-center justify-content-center my-5 my-lg-0">
			<div class="container-fluid">
				<div class="row row-cols-1 row-cols-lg-2 row-cols-xl-3">
					<div class="col mx-auto">
						<div class="card card-d">
							<div class="card-body">
								<div class="border p-4 rounded">
									<div class="text-center logo-form">
										<img src="{{ asset('assets/images/logo.png') }}" width="180" alt="" />
										<h3 class="c-white" style="margin-top:-20px;">Administrator</h3>
									</div>
									<div class="form-body">
										<form action="{{ url('authentication'); }}" method="POST" class="row g-3">
											@csrf
											
											<div class="col-12">
												<label for="inputEmailAddress" class="form-label c-white">Email</label>
												<input type="email" class="form-control form-no-backg c-white" id="inputEmailAddress" name="email" placeholder="Email Address" value="admin@admin.com" required>
											</div>
											<div class="col-12">
												<label for="inputChoosePassword" class="form-label c-white">Password</label>
												<div class="input-group" id="show_hide_password">
													<input type="password" class="form-control form-no-backg c-white border-end-0" id="inputChoosePassword" name="password" value="admin" placeholder="Enter Password" required> <a href="javascript:;" class="input-group-text bg-transparent c-white"><i class='bx bx-hide'></i></a>
												</div>
											</div>
											
											<div class="col-12">
												<div class="d-grid">
													<button type="submit" class="btn btn-danger"><i class="bx bxs-lock-open"></i>Sign in</button>
												</div>
											</div>
											
										</form><br>
										@if (!empty(Session::get('notif_gagal')))
										<div class="col-md-12 alert alert-danger border-0 bg-danger alert-dismissible fade show">
											<div class="text-white">{{Session::get('notif_gagal')}}</div>
											<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
										</div>
										@endif
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--end row-->
			</div>
		</div>
	</div>
	<!--end wrapper-->
	<!-- Bootstrap JS -->
	<script src="{{ asset('assets/js/bootstrap.bundle.min.js') }}"></script>
	<!--plugins-->
	<script src="{{ asset('assets/js/jquery.min.js') }}"></script>
	<script src="{{ asset('assets/plugins/simplebar/js/simplebar.min.js') }}"></script>
	<script src="{{ asset('assets/plugins/metismenu/js/metisMenu.min.js') }}"></script>
	<script src="{{ asset('assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js') }}"></script>
	<!--Password show & hide js -->
	<script>
		$(document).ready(function () {
			$("#show_hide_password a").on('click', function (event) {
				event.preventDefault();
				if ($('#show_hide_password input').attr("type") == "text") {
					$('#show_hide_password input').attr('type', 'password');
					$('#show_hide_password i').addClass("bx-hide");
					$('#show_hide_password i').removeClass("bx-show");
				} else if ($('#show_hide_password input').attr("type") == "password") {
					$('#show_hide_password input').attr('type', 'text');
					$('#show_hide_password i').removeClass("bx-hide");
					$('#show_hide_password i').addClass("bx-show");
				}
			});
		});
	</script>
	<!--app JS-->
	<script src="{{ asset('assets/js/app.js') }}"></script>
</body>

</html>