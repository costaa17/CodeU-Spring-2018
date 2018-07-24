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
      <div style="width:100%; margin-left:auto; margin-right:auto;
        margin-top: 50px; text-align: center; color: #222429;">
        <h1>Team 18's Google CodeU Project</h1>
        <img src="/images/google.gif" style="width: 400px;"/>
        <h2>Welcome to our Translation Chat Web App!</h2>
        <body> We created this open source project as a part of the Google CodeU Summer Program.
          We worked on the project from May - August 2018. Visit our About page to learn more
          about our team and try out our site by logging in! Below are the highlights of the
          features that we worked on.
        <h2>Features:</h2>
        <ul>
          Translation Feature - We utilized the Google Translate API to create a chat application <tbody>
          eliminate the languange barrier between users. Upon registration, each user is prompted for their
          language of choice so our website will translate all of the messages sent to them by other people
          into their language. For example, if a user picks Spanish as their main language, all of their
          languages will show up in that language even if they are replying to someone who speaks Chinese.
          </tbody>
          <br>
          Profiles and Friends - Every user's profile page is visible to their friends via hyperlink.
          All of the registered users are additionally visible on the general "Profiles" page. A user's
          profile page displays their username, the date they joined, as well as their biography and
          language of choice. When visiting a profile page a user can add another user as a friend!
          There also will eventually be interests, where the user can display 3 interests on thier profile,
          and an add profile image feature.
          <br>
          Conversations - Users are able to create their own chat rooms. By clicking the "Conversations" page,
          users can enter a single word name for the title of the conversation and they will be redirected to that chat room.
          All chat rooms can be accessed from the main Conversations page.
          <br>
          Activity Feed - The activity feed publishes the recent activity of users, so whenever somebody joins the site,
          starts a conversation, or sends a message the activity feed is updated.
          <br>
          Administration Page - The "Administration" page is visible to admin users, or the students who created this site.
          It retrieves the analytics for our site and publishes them.Then there is also a profile image feature, where the user can upload a displayed
           profile image. This is done using blobstore.
        </ul>
        <img src="/images/translate.gif" style="width: 400px; position: relative; left: 30px;"/>
      </div>
    </div>
  </body>
  </html>
