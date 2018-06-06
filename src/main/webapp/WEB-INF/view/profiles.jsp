<!DOCTYPE html>
<html>
    <head>
        <body>

  <nav>
    <a id="navTitle" href="/">CodeU Chat App</a>
    <a href="/conversations">Conversations</a>
    <% if(request.getSession().getAttribute("user") != null) { %>
      <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
    <%
        <a href="/profiles.jsp">Profiles</a>
    }
    else { %>
      <a href="/login">Login</a>
    <% } %>
    <a href="/about.jsp">About</a>
  </nav>


      <% if (user != null) {%>
           <title><%= user.getName() %></
    
        <title>User Profile</title>
    </head>
    <body>
        <h1>This is the user's profile.<h1>
    </body>
<html>
