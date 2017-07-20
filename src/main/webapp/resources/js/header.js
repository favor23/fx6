$("#bar_logo").click(function() {
			alert($(this).attr("class"));
			location.href=$(this).attr("class");
		})
		$(".admin_li").click(function() {
			location.href=$(this).attr("id");
		})
		$(".header_li").click(function() {
			location.href=$(this).attr("id");
		})