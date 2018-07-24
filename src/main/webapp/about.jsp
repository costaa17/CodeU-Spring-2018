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
    <style>
    </style>
    <link rel="stylesheet" href="/css/main.css">
  </head>
  <body>


    <nav>
      <a id="navTitle" href="/">CodeU Chat App</a>
      <% if(request.getSession().getAttribute("user") != null){ %>
        <a>Hello
          <%= request.getSession().getAttribute("user") %>!</a>
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
            <a href="/login">Logout</a>
            <% } %>
              <% } else{ %>
                <a href="/login">Login</a>
                <% } %>
                  <a href="/about.jsp">About</a>
    </nav>



    <div id="container">
      <div style="width:75%; margin-left:auto; margin-right:auto;">

        <h1>About the CodeU Chat App</h1>
        <p>
          This chat application was created as the project for the Google CodeU program. Our team decided to focus on an application
          that has conversations, an activity feed, profile pages, and friends.
        </p>

        <h1>The Students of Team 18!</h1>
        <ul>
          <li>
            <strong>
              <a href="http://www.github.com/alexandriastorm">Alexandria Storm:</a>
            </strong> Alexandria is a student at University of California, Berkeley. She enjoys Photography, listening to Kehlani,
            Hayley Kiyoko and Beyonce, and watching Jane the Virgin!
          </li>
          <li>
            <strong>
              <a href="http://www.github.com/costaa17">Ana Vitorio do Valle Costa:</a>
            </strong> Ana studies at University of Washington and plans to major in computer engineering.
          </li>
          <li>
            <strong>
              <a href="http://www.github.com/emilyarroyo">Emily Arroyo:</a>
            </strong> Emily is at student at Columbia University and intends to study Computer Science and minor in economics. She
            enjoys spending time with family and friends, running, and adventuring in her free time.
          </li>
          <li>
            <strong>
              <a href="http://www.github.com/CaelumTerrae"> Gavin Lifrieri:</a>
            </strong> Gavin is a Computer Science concentrator at Harvard University. He enjoys skateboarding in his free time.
          </li>
          <li>
            <strong>
              <a href="http://www.github.com/KevinWorkman"> Kevin Workman:</a>
            </strong> Kevin works for Google Maps and has been a CodeU advisor for two years. He still has no idea what he's doing
            most of the time.
          </li>
        </ul>
      </div>
    </div>
  </body>

  </html>
