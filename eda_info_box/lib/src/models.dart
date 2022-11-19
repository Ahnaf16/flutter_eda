part of '../eda_info_box.dart';

enum LoadingPosition {
  above,
  bottom;
}

enum InfoSeverity {
  loading(Icons.hourglass_empty_rounded, Colors.cyan),
  info(Icons.info, Colors.blue),
  successes(Icons.check_circle, Colors.green),
  warning(Icons.warning, Colors.orange),
  error(Icons.cancel, Colors.red);

  final IconData icon;
  final Color color;
  const InfoSeverity(this.icon, this.color);
}
