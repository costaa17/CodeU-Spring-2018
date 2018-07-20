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
      @import url('https://fonts.googleapis.com/css?family=Zilla+Slab');
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
      <div style="width:100%; margin-left:auto; margin-right:auto;
        margin-top: 50px; text-align: center; color: #222429;">
        <h1>Team 18's Google CodeU Project</h1>
        <img src="/images/google.gif" style="width: 400px;"/>
        <h2>Welcome to our Translation Chat Web App!</h2>
        <body> We created this open source project as a part of the Google CodeU Summer Program.

        <h2>Features:</h2>
        <ul>
          Translation Feature - We used Google Translate's APIs to create a chat application
            that automatically translate's all messages from friends to the user's preferred language.
          This eliminates the language barrier for users to communicate easily with different people.
          Each user declares their main language upon registration and then the website shows all of their
          conversations in that language.
          <br>
          Conversations - Users are able to create their own chat rooms</li>

        </ul>
        <img src="/images/translate.gif" style="width: 400px; position: relative; left: 30px;"/>
      </div>
    </div>
  </body>

  </html>
