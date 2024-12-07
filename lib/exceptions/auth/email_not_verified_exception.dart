class EmailNotVerifiedException implements Exception {
  final String sessionId;

  const EmailNotVerifiedException({required this.sessionId});
}
