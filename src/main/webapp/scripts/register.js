let url = "https://translation.googleapis.com/language/translate/v2/languages"

console.log(url);

fetch('https://curl.haxx.se/docs/manpage.html')
  .then(function(response) {
    console.log(resoonse.json());
    return response.json();
  })
// fetch(url, {
//         method: "GET", // *GET, POST, PUT, DELETE, etc.
//         mode: "cors", // no-cors, cors, *same-origin
//         cache: "no-cache", // *default, no-cache, reload, force-cache, only-if-cached
//         credentials: "same-origin", // include, same-origin, *omit
//         headers: {
//             "Authorization: Bearer ": {
//   "type": "service_account",
//   "project_id": "codeu-1531458152520",
//   "private_key_id": "26c84873bc11d9862b197a7f81f95c370da74b49",
//   "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDSeyVO/ump6sdd\nPaoTHa8CVvyvnQ8G1AKxjSHZ7mZ1Uvb7AvtlGeG2do/rjIwhTpQ2xk9drOvEuP/w\nEve86j9BSZRUIIK6JtadvdWs+hFKhYhsdvVdtLMsDQDHtjGwHL5EBQBljelmRqHl\n+GhsimiSa/6hGSoRK6CgvWgGy2/sEJChSx19BfNwCJX/zAXq46TVoCyqL1zULTOP\n2PItAsRohJpZT2mujz512J3KYR4F3J4ns+h/735dKsbVxPmVYeC48/p6wvIjkWm1\nvCxLBYMSO+021Ezul9g9KlybJqNRnjkGTa8PVmacLHlhbAdNJAhomkC8Cx+HX4DY\nCyOoz559AgMBAAECggEABEYdXhMFhh5/EVje8vfrlZHUHDHFfBdCfb32pcD2QiQe\n4T5wgd9KasTSC8+lCckZb9pLgsSv3eT+x25vKt4bzjTTBvlJBkQjH/1akSJbxwZa\nnI820MIKUFbsQOHldOTEhUePuEAvMNU21N9cKXYPBQgd2cITzVj0MEdgTSEE4wdy\nopPBsvHh03GEjDRHyy61LvwHKTliArho/zU9c6nBsrhMNNEGN6gcDAdOax8GmVhl\n8x43WyMVtOlJmwZuVtDIm9VZYmkJ6S9vojWWDPEDo1VdGMochOQlBV2zhfRIyS9y\nJWWv8IpagX89WzPgutzHiAd6O6lUM4g9ZpnpuXuG0QKBgQD2uNsJ+Wt4oq7xRuAX\nnb/lXb1hM9/OuYv5+JxNa9jidvrPSfvdB3uI5dfEmvEELvulgFFxbIZo4xdldK+J\nxgM/PpJYsUmhZ97P8pn10aMn6jVCIixbenD6Eqv8GUJMfskx1Nmciu3RoSTH18IO\nSYRtqozgOTJe+PtHnyBtYON+UQKBgQDaZWebVqs2TYxueoeb4HLjEYDAvKmi9ORS\nPWa+EffYIxM1qRWAsNM5pd2nhNyzeUo9FloNx6zUQ2UWY9FpONB7XaE3pL7YKyi0\nSB36i3Rsf8u4Lj/oBuaVixHyupUt/4/zXGJ0GkIx11iErYtl/sOljVUIke+fcl1P\nncGHmkH2bQKBgQCd27DqNNf6m7xrS/ndomVBkDS3mMU+M6HIErWPI83lOFNJhgDM\nbxkvgkAH30sObjE8t1lkxRdKzOIPXBVkhXlWYeapMOX3i8oYKxUvHy7RPx1MbykK\nbtEScBfyeQbegtCgPZvueUWotv4dj4LuOUOuF02DuZTtB0lfjgTldvSXwQKBgQDI\nQ7R9/TuC0Bm2NSWlCmxPS/2Ev3vOskGsKCHOqStcRs2WpzXQjFUkx7Q5qNu4t8Ab\nxCNP/4m8GxDXNzEQC8khVvo+zBM0pl7s8jSLStW3qHhmrAJuAeXvu1b5/Z5OT8rw\nngap8GpCyfWhtIHfRX6ikLco5KmWzIhEOaT9c7aJAQKBgQDzmlNpdSTiYOWpSkup\nXb5u/zQjfPuyXuzjbVecVlWCgR25hDjAV4pub+SvV4HslhFFqMdsAlVC0SvMYDnN\nA+9vJVIBzytuFxSGBjQBW1F1SgSb35HSLJTlikZhlcEiVXFocpoQotil/ajKiRTY\n0o5CrTs2emqyFO3Dbnx+P9Y0TQ==\n-----END PRIVATE KEY-----\n",
//   "client_email": "starting-account-bou4ls8257os@codeu-1531458152520.iam.gserviceaccount.com",
//   "client_id": "113852379202245321439",
//   "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//   "token_uri": "https://accounts.google.com/o/oauth2/token",
//   "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
//   "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/starting-account-bou4ls8257os%40codeu-1531458152520.iam.gserviceaccount.com"
// }
// ,
//         },
//         redirect: "follow", // manual, *follow, error
//         referrer: "no-referrer", // no-referrer, *client
//     })
//     .then(response => 
//         console.log(response.json()));