class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final Map<String, dynamic>? responseJson;

  NetworkResponse(this.isSuccess, this.statusCode, this.responseJson);
}
