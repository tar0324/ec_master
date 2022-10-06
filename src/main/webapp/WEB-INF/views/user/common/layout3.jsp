<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<style type="text/css">
#container {
	height: 1500px;
}
#cc {/* header */
	height: 100px;
}
#neo { /* side */
	float: left;
	width: 230px;
	height: auto;
	margin-bottom: 100px;
}

#bb { /* body */
	width: 800px;
	height: auto;
	margin-left: 230px;
	margin-top: 20px;
	margin-bottom: 100px;
}
#aa { /* footer */
	position: fixed ;
    bottom : 0;
    width: 100%;
}


/* html, body {
	height: 100%;
} */
</style>
<title><tiles:insertAttribute name="title" /></title>
</head>
<body>
	<div id="container">
		<div id="cc">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="neo">
			<tiles:insertAttribute name="side" />
				<div id="bb">
				<tiles:insertAttribute name="body" />
				</div>
			</div>
	</div>
		<div id="aa">
				<tiles:insertAttribute name="footer" />
		</div>

</body>
</html>