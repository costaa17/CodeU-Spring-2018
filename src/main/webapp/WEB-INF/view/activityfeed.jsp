<%@ page import="codeu.model.data.Activity" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Activity Feed</title>
    </head>
    <body>
        <h1>This is the activity feed<h1>
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
              <ul class="activity-list">
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