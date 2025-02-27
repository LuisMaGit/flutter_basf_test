class NetworkServiceResponse {
  final bool success;
  final String body;
  const NetworkServiceResponse({
    required this.success,
    this.body = '',
  });
}
