<%-- 
    Document   : banner-top
    Created on : Dec 3, 2019, 10:23:40 PM
    Author     : Nguyen Minh Dang
--%>
<div class="banner-top">
	<div class="container">
        <h1><%=session.getAttribute("title")%> </h1>
		<em></em>
		<h2><a href="home">Home</a><label>/</label><%=session.getAttribute("title")%></h2>
	</div>
</div>
