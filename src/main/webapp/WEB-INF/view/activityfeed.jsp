<%@ page import="codeu.model.data.Activity" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
  <title>Activity Feed</title>
  <link rel="stylesheet" href="/css/main.css">
  <style>
  /*@import url('https://fonts.googleapis.com/css?family=Zilla+Slab');*/
    </style>
</head>
<body>

  <nav>
    <a id="navTitle" href="/">CodeU Chat App</a>
    <% if(request.getSession().getAttribute("user") != null){ %>
      <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
      <a href="/conversations">Conversations</a>
      <a href="/profiles">Profiles</a>
      <a href="/activityfeed">Activity</a>
      <%if (request.getSession().getAttribute("user").equals("EmilyArroyo")
      || request.getSession().getAttribute("user").equals("AlexandriaStorm")
      || request.getSession().getAttribute("user").equals("AnaVitoriadoValleCosta")
      || request.getSession().getAttribute("user").equals("KevinWorkman")
      || request.getSession().getAttribute("user").equals("GavinLifrieri")) { %>
       <a href="/admin">Administration</a>
        <% } else{ %>
          <a href="/login">Log Out</a>
        <% } %>
           <% } else{ %>
      <a href="/login">Login</a>
    <% } %>
    <a href="/about.jsp">About</a>
  </nav>

        <h1>Welcome to the Activity feed<h1>
        <%
            List<Activity> activities =
              (List<Activity>) request.getAttribute("activities");
            if(activities == null || activities.isEmpty()){
            %>
              <p>No activities yet</p>
            <%
            }
            else{
            %>
              <ul class="activity-list" style="font-size: 1.2rem;">
            <%
              for(Activity activity : activities){
            %>
              <li><%= activity.getTime() + ": " + activity.getEvent() %></li>
            <%
              }
            %>
              </ul>
            <%
            }
            %>
    </body>
<html>
