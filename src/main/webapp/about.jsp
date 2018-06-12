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
  <title>CodeU Chat App</title>
  <link rel="stylesheet" href="/css/main.css">
</head>
<body>


  <nav>
    <a id="navTitle" href="/">CodeU Chat App</a>
    <a href="/conversations">Conversations</a>
        <% if(request.getSession().getAttribute("user") != null){ %>
      <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
       <a href="/profiles">Profiles</a>
      <%if(request.getSession().getAttribute("user").equals("EmilyArroyo")| request.getSession().getAttribute("user").equals("AlexandriaStorm")|request.getSession().getAttribute("user").equals("AnaVitoriadoValleCosta")|request.getSession().getAttribute("user").equals("KevinWorkman")|request.getSession().getAttribute("user").equals("GavinLifrieri")) { %>

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
   <div
      style="width:75%; margin-left:auto; margin-right:auto; margin-top: 50px;">

      <h1>About the CodeU Chat App</h1>
      <p>
        This is an example chat application designed to be a starting point
        for your CodeU project team work. Here's some stuff to think about:
      </p>

      <h1>The Students of Team 18!</h1>
      <ul>
        <li>
          <strong>Alexandria Storm: </strong> Alexandria is a student at University of California, Berkeley. She enjoys Photography, listening to Kehlani, Hayley Kiyoko and Beyonce, and watching Jane the Virgin!
        </li>
        <li>
          <strong>Ana Vitorio do Valle Costa: </strong> Ana studies at University of Washington and plans to major in computer engineering.
        </li>
        <li>
          <strong>Emily Arroyo: </strong> Emily is at student at Columbia University and intends to study Computer Science and minor in economics. She enjoys spending time with family and friends, running, and adventuring in her free time.
        </li>
        <li>
          <strong>Gavin Lifrieri: </strong> Gavin is a Computer Science concentrator at Harvard University. He enjoys skateboarding in his free time.
        </li>
        <li>
          <strong>Kevin Workman: </strong> Kevin works for Google Maps and has been a CodeU advisor for two years. He still has no idea what he's doing most of the time.
        </li>
      </ul>

      <h1>Changelist</h1>

      <h3>Week 0 (5/6-5/13)</h3>
      <ul>
        <li>Updated about page with temporary bios, and changelist organized by week</li>
        <li>Updated index page with team name and team members</li>
        <li>Deployed to Google AppEngine</li>
      </ul>
    </div>
  </div>
</body>
</html>
