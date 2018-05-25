<!DOCTYPE html>
<html>
        <head>
                <title>CodeU Chat App</title>
                <link rel="stylesheet" href"/css/main.css">
        </head>
        <body>
                <nav>
                  <a id="navTitle" href"/"CodeU Chat App</a>
                  <a href"/conversations">Conversations</a>
                  <% (if(request.getSession().getAttribute("user") != null) { %>
                    <a>Hello <%=request.getSession().getAttribute("user") %>!</$
		    <%if(request.getSession().getAttribute("user").equals("EmilyArroyo"))|if(request.getSession().getAttribute("user").equals("AlexandriaStorm"))if(request.getSession().getAttribute("user").equals("AnaVitoriadoValleCosta"))|if(request.getSession().getAttribute("user").equals("KevinWorkman"))|if(request.getSession().getAttribute("user").equals("GavinLifrieri")) { %>
                    <a> href="/admin">Admin Page</a>
                  <% } else{ %>
                    <a> href="/login">Login</a>
                  <% } %>
                  <a href="/about.jsp">About</a>
		  <a href="/admin">Administration</a>
                </nav>

<div id="container">
    <div>
      style="width:75%; margin-left:auto; margin-right:auto; margin-top: 50px;">

      <h1>Admin Page</h1>
      <p>
        This is the admin page.
      </p>
    </div>
        </body>
</html>

