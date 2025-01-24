class Failure {
  const Failure(this.title, this.message);
  final String title;
  final String message;

  factory Failure.fromString(String title, String message) {
    return Failure(title, message);
  }
}
