<%--
  Copyright 2017 Google Inc.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
--%>
<!DOCTYPE html>
<html>
<head>
  <title>Login</title>
  <link rel="stylesheet" href="/css/main.css">
  <link rel="stylesheet" href="/css/form.css">
  <style>
    @import url('https://fonts.googleapis.com/css?family=Zilla+Slab');
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

  <div id="container">
    <% if(request.getAttribute("error") != null){ %>
        <h2 style="color:red" id="error"><%= request.getAttribute("error") %></h2>
    <% } %>

    <form action="/login" method="POST" id="form">
      <div class="form-box">
        <h2>Login</h2>
        <div class="fb-item">
          <input type="text" name="username" id="username">
          <br/>
          <span>Username</span>
        </div>

        <div class="fb-item">
          <input type="password" name="password" id="password">
          <br/>
          <span>Password</span>
        </div>

        <button type="submit" class="form-button">Login</button>
      </div>
    </form>

    <p style="text-align:  center; font-size: 20px;"
      >New users can register <a href="/register">here</a>.
    </p>
  </div>
</body>
</html>
