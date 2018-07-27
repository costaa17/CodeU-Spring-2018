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
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.google.auth.Credentials" %>
<%@ page import="com.google.auth.oauth2.GoogleCredentials" %>
<%@ page import="com.google.cloud.translate.Translate" %>
<%@ page import="com.google.cloud.translate.Translate.TranslateOption" %>
<%@ page import="com.google.cloud.translate.Translate.LanguageListOption" %>
<%@ page import="com.google.cloud.translate.TranslateOptions" %>
<%@ page import="com.google.cloud.translate.Translation" %>
<%@ page import="com.google.cloud.translate.Language" %>

<%
<<<<<<< HEAD
String APIKEY = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDNpWOIW+llUIuQVDThZE/P5wF9MPrE/EvJbVKDS1pqmSqqBJZx5iAlQa0oS9RkuBfDtbJziYK17sf+Woe4U/tD4CyZS1+z6+PXHzFq/Ws8krdMTnhiG3m5eN3MoubNcXujpNlCpu7FzaOwkr3CE95iTEQP8sfc2olNxgov/d1QSwfvhADFxytdrG0RpiTusNzC7ay7jXVn7zhRB4CZciryQgnChJiO/o9TrHwks/ZTqTLrN13o8DQQVcuI2Uma5N1gPgwh9yOpD55H+N5P3VjkLRgYehJV9ScpT8z6roe+jaeERGI2QiCwDEEuYPcSYJ/jDvxehOZdWgoxsb9J7vP7AgMBAAECggEAIf7fT2FyWe9QwxFIlKISl5nmox1/tyTGGoxaAZ5pWgnsBaMwg6+5TK9owqqWd/f+5bmZwIPQ+eZ5ZVDt8sjfVr8uYEEXlxS924gqkTdHjQHsD09Bk2ZbXw/eCsA7S2chO1I7IEucWVK/Zqc7e2PxdWqKLeDCrX3rCNJeSMS821LgI1e+6Sa3tIWFwGqNhgfLQLX31b0UEgLKYRYJO4ASiXIqNtVUiLll9b7cKTjNm851QxUpEFi3oST7HDCB6/4ZoyriEuBDHx81cVRUOH/wc1YFsgQ8FtfpDwcOqtuiwZ/HkX6daprzp1yTAXPiMD2yiUxglRLwnjGLHhAMiUIcgQKBgQDpot/ugyE0dn7rW6sqlpGsyp+ru+L2PfodZeDPwHVBL6ysTG4JgJasaoNvO4EEwcubHqFC13n3K0SERyPmJNQVf39jsrRPPGTLQw+dILReBblxO2m53SUZYtIngP+43bwens7e5LvPaV/yDpuAr73z/+fzXxHkDTjeunDAmdutGwKBgQDhVKFfIQJJn6V9aWoJgB5mouEnhXsZ0M6stt+PHavRAgkD1dhJcWoLSjXP/hyeMO/DJWwvEfykWOJMGL6N1yJepnZq3MBZSHWZBScgdi+e99GHxDUcPSwdrengOEUNaznyub2Pk62VUjLkmj6kXXCPFVHOmWHEVIVTvU+VaXSioQKBgD+wF40ED+QmPRjZZ0J3wwQwQ/Bjik4HvQuQfwUC+LOpVE+vkftjIy+i5WtH9DagwWjqo5j99hBrqgTJA78z4OBvXgGGcGJ9GxjRkgsKJEDRHKkCQiLZZsiRyKneH1d8klBiiA/4mD3FAtOQKdGdlpFR/B+6lbzt4cfNWPkXt+trAoGAQUuT44weLJV9kCTu3EfrB1Tlp90vOeDfMv9fMwqnEk7jq9/Y6BdcYl8jztzVECYgJE2A1vcAXeN/2AtHlLSlugXExNypRHYR1cC/gNGepRMs/Ymm1kMHuKX/4sCLigLrbOHUA3oIz/9czg/AXULSbjQAW7zorsrLQ+PU3vgLG2ECgYBFqMT0qfjwCOGyDqKCcyC4KbB3sFzpsVclaj29Ki3qyJK/pPBZPHYeD/qqJj1O/bl3dUCHEHXeY7APuSyPazfir2jjHrAXlzyHq/TCAUJ5BuMMF8cDQQ43F0PaWpmr25zhYYVHIrSlTYlm1UbIuLZxe/Rm+j/Rm6jVhPrmUWLGtA==";

    Translate translate = TranslateOptions.newBuilder().setApiKey(APIKEY).build().getService();
    LanguageListOption target = LanguageListOption.targetLanguage("en");
    List<Language> languages = translate.listSupportedLanguages(target);
=======
// Puposely left in a compiler error to remind us to set this before deployment.
// Change this before deploying, but don't check this into GitHub!
String APIKEY = YOUR_API_KEY_HERE;
Translate translate = TranslateOptions.newBuilder().setApiKey(APIKEY).build().getService();
LanguageListOption target = LanguageListOption.targetLanguage("en");
List<Language> listlanguages = translate.listSupportedLanguages(target);
ArrayList<Language> languages = new ArrayList<Language>(listlanguages);
Collections.sort(languages, new Comparator<Language>(){
  public int compare(Language languageOne, Language languageTwo){
    return languageOne.getCode().compareTo(languageTwo.getCode());
  }
});
>>>>>>> c0a88dd7346bc827872881a3d9f620565784914d
%>

<!DOCTYPE html>
<html>
<head>
  <title>Register</title>
  <link rel="stylesheet" href="/css/main.css">
  <link rel="stylesheet" href="/css/form.css">

  <style>
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
          <a href="/login">Log Out<</a>
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


    <form action="/register" method="POST" id="form">

      <div class="form-box">
        <h2>Register</h2>

        <div class="fb-item">
          <input type="text" name="username" id="username" placeholder="Username">
          <br/>
          <span>Username</span>
        </div>

        <div class="fb-item">
          <input type="password" name="password" id="password" placeholder="Password">
          <br/>
          <span>Password</span>
        </div>

        <div class="fb-item">

            <p>What language do you want to use?</p>
            <p>Select the <a href="https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes">language code</a>
               that corresponds to your language. For example, English is en, Spanish is es, and Portuguese
               is pt.</p>
            <p>Try registering with two users in different languages to see the translation in action!</p>

            <select id="mySelect" name="language" id="language">
              <%  for (int i = 0; i < languages.size(); i++) {
                Language language = languages.get(i); %>
                <option> <%= language.getCode() %></option>
              <% } %>
            </select>

          <input type="bio" name="bio" id="bio" placeholder="Biography">
          <br/>
          <span>Please enter your biography here:</span>
        </div>

        <button type="submit" class="form-button">Register</button>
      </div>

    </form>

  </div>

</body>
</html>
