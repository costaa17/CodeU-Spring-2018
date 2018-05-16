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
          <strong>Alexandria Storm: </strong> Filler text until I get a bio from Alexandria.
        </li>
        <li>
          <strong>Ana Vitorio do Valle Costa: </strong> Filler text until I get a bio from Ana.
        </li>
        <li>
          <strong>Emily Arroyo: </strong> Filler text until I get a bio from Emily.
        </li>
        <li>
          <strong>Gavin Lifrieri: </strong> Filler text until I come up with something witty.
        </li>
        <li>
          <strong>Kevin Workman: </strong> Filler text until I get a bio from Kevin.
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
