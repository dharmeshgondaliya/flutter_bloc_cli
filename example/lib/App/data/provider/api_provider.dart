import 'dart:convert';
import 'dart:io';

import 'package:example/App/data/constants/url_manager.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static final ApiProvider _apiProvider = ApiProvider._internal();
  ApiProvider._internal();
  static ApiProvider get instance => _apiProvider;

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    String url = "${UrlManager.instance.baseUrl}$endPoint";
    try {
      var response = await http.get(Uri.parse(url));
      return jsonDecode(response.body);
    } on SocketException catch (e) {
      throw e.message;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint, required Map<String, dynamic> params}) async {
    String url = "${UrlManager.instance.baseUrl}$endPoint";
    try {
      var response = await http.post(Uri.parse(url), body: jsonEncode(params));
      return jsonDecode(response.body);
    } on SocketException catch (e) {
      throw e.message;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getRequest({required String endPoint}) async {
    String url = "${UrlManager.instance.baseUrl}$endPoint";
    Map<String, String> headers = {
      // 'authorization': UrlManager.instance.token
    };
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      return jsonDecode(response.body);
    } on SocketException catch (e) {
      throw e.message;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> postRequest(
      {required String endPoint, required Map<String, dynamic> params}) async {
    String url = "${UrlManager.instance.baseUrl}$endPoint";
    Map<String, String> headers = {
      // 'authorization': UrlManager.instance.token
    };
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(params),
      );
      return jsonDecode(response.body);
    } on SocketException catch (e) {
      throw e.message;
    } catch (e) {
      rethrow;
    }
  }
}