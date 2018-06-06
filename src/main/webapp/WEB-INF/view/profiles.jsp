<!DOCTYPE html>
<html>
    <head>
        <body>
    <% if (user != null) {%>
           <title><%= user.getName() %></

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



<html>
