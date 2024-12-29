class UrlManager {
  static final UrlManager _urlManager = UrlManager._();
  UrlManager._();
  static UrlManager get instance => _urlManager;

  String _baseUrl = "https://www.example.com/";
  String _token = "";

  set setBaseUrl(String url) => _baseUrl = url;

  String get baseUrl => _baseUrl;

  set setToken(String token) => _token = token;

  String get token => _token;
}