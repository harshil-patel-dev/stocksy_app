class ApiHeaders {
  static Future<Map<dynamic, dynamic>> getBody() async {
    Map<dynamic, dynamic> headers = {
      'header': "somedata",
    };
    return headers;
  }
}
