<div class="wrapper-wel importantNone" id="wrapper-search">
	<div class="welcome none" id="welcome-search">
		<h3>Welcome to Ti Shoes!</h3>
		<div class="ok-btn">
			<button id="ok-search">OK</button>
		</div>
	</div>
</div>
<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	// msg search input empty
	$("#search-link-icon").click(
			function() {
				var txt = $('#search').val();
				if (txt == "") {
					$("#wrapper-search").removeClass("importantNone");
					$("#welcome-search").removeClass("none");
					$("#welcome-search h3").html(
							"You have not entered search information!");
				} else {
					$("#search-link-icon").attr("type", "submit");
				}
			});
</script>
<script type="text/javascript">
	// msg search input nav empty
	$("#nav-btn-search").click(
			alert("T");
			function() {
				var txt = $('#search-nav').val();
				if (txt == "") {
					$("#wrapper-search").removeClass("importantNone");
					$("#welcome-search").removeClass("none");
					$("#welcome-search h3").html(
							"You have not entered search information!");
				} else {
					$("#nav-btn-search").attr("type", "submit");
				}
			});
</script>
<script>
	$("#ok-search").click(function() {
		$("#welcome-search").addClass("none");
		$("#wrapper-search").addClass("importantNone");
	});
</script>