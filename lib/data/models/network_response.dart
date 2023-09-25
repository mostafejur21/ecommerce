class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final Map<String, dynamic>? response;

  NetworkResponse(this.isSuccess, this.statusCode, this.response);
}
