String displayStatus(String statusResult) {
  if (statusResult == null) {
    return 'assets/icons/transparent.png';
  } else if (statusResult == "OK") {
    return 'assets/icons/flutter_green_dot.png';
  } else if (statusResult == "ERROR") {
    return 'assets/icons/flutter_red_dot.png';
  }
}
