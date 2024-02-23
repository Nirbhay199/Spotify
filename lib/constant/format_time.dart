String twoDigits(int n) {
  if (n >= 10) return "$n";
  return "0$n";
}

String formatDuration(Duration duration) {
  String hours = twoDigits(duration.inHours);
  String minutes = twoDigits(duration.inMinutes.remainder(60));
  String seconds = twoDigits(duration.inSeconds.remainder(60));
  String time = "${duration.inHours > 0 ? "$hours:" : ""}$minutes:$seconds";
  return time;
}