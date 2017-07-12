<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.mySlides {
	display: none;
	width: 300px;
	height: 400px;
	border: 1px solid black;
	background-color: gray;
}

.btn {
	cursor: pointer
}

#test {
	border: 1px solid black;
	width: 300px;
	display: inline-block;
}

.btn {
	display: inline-block;
	border: 1px solid black;
	color: black;
	width: 50px;
	height: 200px;
	vertical-align: middle;
}
</style>
<body>

	<div class="w3-container">
		<h2>Slideshow Indicators</h2>
		<p>An example of using buttons to indicate how many slides there
			are in the slideshow, and which slide the user is currently viewing.</p>
	</div>

	<div id="l" class="btn" onclick="plusDivs(-1)">&#10094;</div>

	<div id="test" class="w3-content w3-display-container"
		style="max-width: 800px">
		<div class="mySlides">fdfasssf</div>
		<div class="mySlides">23213123124</div>
		<div class="mySlides">a@#@$@$!#@$</div>
	</div>

	<div id="r" class="btn" onclick="plusDivs(1)">&#10095;</div>

	<script>
		$("#l").click(function() {

			$(".mySlides").attr("class", "mySlides w3-animate-left");
		});

		$("#r").click(function() {
			$(".mySlides").attr("class", "mySlides w3-animate-right");
		});

		var slideIndex = 1;
		showDivs(slideIndex);

		function plusDivs(n) {
			showDivs(slideIndex += n);
		}

		function currentDiv(n) {
			showDivs(slideIndex = n);
		}

		function showDivs(n) {
			var i;
			var x = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("demo");
			if (n > x.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = x.length
			}
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			x[slideIndex - 1].style.display = "block";
		}
	</script>

</body>
</html>
