			</div><!-- col -->
		</div><!-- row -->
	</div><!-- container -->

	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; MCABooks 2019</p>
		</div>
	</footer>
	
<!-- Bootstrap core JavaScript -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script>
	$(".logoutbtn").on("click", function(e) {
		e.preventDefault();
		$("#logoutForm").submit();
	});
	</script>
</body>
</html>