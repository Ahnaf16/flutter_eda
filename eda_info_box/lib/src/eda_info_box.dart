part of '../eda_info_box.dart';

class EdaInfoBox extends StatelessWidget {
  const EdaInfoBox({
    super.key,
    required this.isVisible,
    required this.info,
    this.subInfo,
    this.position = LoadingPosition.bottom,
    this.severity = InfoSeverity.loading,
    this.actionIcon = Icons.close,
    this.actionText = 'Close',
    this.onActionTap,
  }) : showLoading = severity == InfoSeverity.loading;

  final String info;
  final String? subInfo;
  final bool isVisible;
  final LoadingPosition position;
  final InfoSeverity severity;
  final IconData actionIcon;
  final String actionText;
  final Function()? onActionTap;
  final bool showLoading;

  @override
  Widget build(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    final theme = Theme.of(context);

    return Visibility(
      visible: isVisible,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showLoading && position == LoadingPosition.above)
            LinearProgressIndicator(
              color: foregroundColor,
              backgroundColor: severity.color,
            ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  severity.color.withOpacity(.1),
                  severity.color.withOpacity(.3),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// TO separate the info, subInfo and leading icon with action.
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        severity.icon,
                        color: isLight ? foregroundColor : severity.color,
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: DefaultTextStyle(
                          style: TextStyle(
                            color: isLight ? Colors.black : Colors.white,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                info,
                                style: theme.textTheme.titleMedium,
                              ),
                              if (subInfo != null)
                                Text(
                                  subInfo!,
                                  style: theme.textTheme.labelLarge,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (onActionTap != null)
                    TextButton.icon(
                      onPressed: onActionTap,
                      icon: Icon(actionIcon),
                      label: Text(actionText),
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(foregroundColor),
                        backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => states.contains(MaterialState.hovered)
                              ? foregroundColor.withOpacity(.2)
                              : foregroundColor.withOpacity(.1),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (showLoading && position == LoadingPosition.bottom)
            LinearProgressIndicator(
              color: foregroundColor,
              backgroundColor: severity.color,
            ),
        ],
      ),
    );
  }

  Color get foregroundColor {
    switch (severity) {
      case InfoSeverity.loading:
        return Colors.cyan.shade900;
      case InfoSeverity.info:
        return Colors.blue.shade900;
      case InfoSeverity.successes:
        return Colors.green.shade900;
      case InfoSeverity.warning:
        return Colors.orange.shade900;
      case InfoSeverity.error:
        return Colors.red.shade900;

      default:
        return severity.color;
    }
  }
}
