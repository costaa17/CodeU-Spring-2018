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
<%@ page import="java.util.List" %>
<%@ page import="codeu.model.data.Conversation" %>
<%@ page import="codeu.model.data.Message" %>
<%@ page import="codeu.model.data.User" %>
<%@ page import="codeu.model.store.basic.UserStore" %>
<%@ page import="com.google.cloud.translate.Translate" %>
<%@ page import="com.google.cloud.translate.Translate.TranslateOption" %>
<%@ page import="com.google.cloud.translate.TranslateOptions" %>
<%@ page import="com.google.cloud.translate.Translation" %>
<%@ page import="com.google.cloud.translate.Language" %>
<%@ page import="com.google.cloud.translate.Detection" %>


<%
Conversation conversation = (Conversation) request.getAttribute("conversation");
List<Message> messages = (List<Message>) request.getAttribute("messages");
User user = (User) request.getAttribute("user");
Translate translate = TranslateOptions.getDefaultInstance().getService();
%>

<!DOCTYPE html>
<html>
<head>
  <title><%= conversation.getTitle() %></title>
  <link rel="stylesheet" href="/css/main.css" type="text/css">
  <link rel="stylesheet" href="/css/chat.css" type="text/css">
  <style>
    @import url('https://fonts.googleapis.com/css?family=Zilla+Slab');
    </style>
  <style>

  </style>

  <script>
    // scroll the chat div to the bottom
    function scrollChat() {
      var chatDiv = document.getElementById('chat');
      chatDiv.scrollTop = chatDiv.scrollHeight;
    };
  </script>
</head>
<body onload="scrollChat()">

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
    <h1><%= conversation.getTitle() %>
      <a href="" style="float: right">&#8635;</a></h1>
    <div id="chat">
      <ul>
    <%
      for (Message message : messages) {
        String messageContent = "";
        String author = UserStore.getInstance()
          .getUser(message.getAuthorId()).getName();
        if (user != null){
          Detection detection = translate.detect(message.getContent());
          TranslateOption srcLang = TranslateOption.sourceLanguage(detection.getLanguage());
          TranslateOption tgtLang = TranslateOption.targetLanguage(user.getLanguage());
          TranslateOption model = TranslateOption.model("nmt");
          Translation translation = translate.translate(message.getContent(), srcLang, tgtLang, model);
          messageContent = translation.getTranslatedText();
        }else{
        messageContent = message.getContent();
      }
    %>
      <li><strong><%= author %>:</strong> <%= messageContent %></li>
    <%
      }
    %>
      </ul>
    </div>
    <hr/>
    <% if (request.getSession().getAttribute("user") != null) { %>
    <form action="/chat/<%= conversation.getTitle() %>" method="POST">
      <div id="messageSubmitContainer">
        <input type="text" name="message">
        <button type="submit">Send</button>
      </div>
    </form>
    <% } else { %>
      <p><a href="/login">Login</a> to send a message.</p>
    <% } %>
    <hr/>
  </div>
</body>
