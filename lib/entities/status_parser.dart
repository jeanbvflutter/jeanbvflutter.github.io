class StatusParser {
  String status;
  StatusParser(status) {this.status = (status.runtimeType == bool) ? status ? "OK":"error": status;}
}