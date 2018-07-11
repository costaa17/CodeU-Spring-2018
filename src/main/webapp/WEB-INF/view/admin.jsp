<%@ page import = "java.util.List" %>
<%@ page import = "codeu.model.data.User" %>
<%@ page import = "codeu.model.store.basic.UserStore" %> 
<%@ page import = "codeu.model.data.Conversation " %>
<%@ page import = "codeu.model.store.basic.ConversationStore" %>

<!DOCTYPE html>
<html>
<head>
  <title>Administration</title>
  <link rel="stylesheet" href="/css/main.css">
</head>
<body>

  <nav>
    <a id="navTitle" href="/">CodeU Chat App</a>
    <a href="/conversations">Conversations</a>
    <% if(request.getSession().getAttribute("user") != null){ %>
      <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
	<%if(request.getSession().getAttribute("user").equals("EmilyArroyo")||request.getSession().getAttribute("user").equals("AlexandriaStorm")||request.getSession().getAttribute("user").equals("AnaVitoriadoValleCosta")||request.getSession().getAttribute("user").equals("KevinWorkman")||request.getSession().getAttribute("user").equals("GavinLifrieri")) { %>
        <a href="/admin">Administration</a>
        <% } else{ %>
          <a href="/login">Login</a>
        <% } %>
    <% } else{ %>
      <a href="/login">Login</a>
    <% } %>
    <a href="/about.jsp">About</a>
  </nav>

<div id="container">
    <div>
      <style="width:75%; margin-left:auto; margin-right:auto; margin-top: 50px;">
	
      <h1>Admin Stats</h1>
	<% List<User> users = UserStore.getInstance().getUsersList(); %>
	<% String recentUser = users.get(users.size() -1).getName(); %>
        <% List<Conversation> conversations = ConversationStore.getInstance().getAllConversations(); %>

	
	<p> Number of Users: <%= UserStore.getInstance().numberUsers(users) %>
   	</p>
	<p> Number of Conversations: <%= conversations.size() %> </p>

    </div>
        </body>
</html>

