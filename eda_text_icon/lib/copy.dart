import 'package:flutter/material.dart';

///! THIS IIS BROKEN !!

class TextIcon extends StatefulWidget {
  TextIcon({
    super.key,
    this.icon,
    this.action,
    this.text = '',
    this.iconSize,
    this.textStyle,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.actionAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.min,
    this.showBorder = false,
    this.horizontalMargin = 8,
    this.verticalMargin = 5,
    this.onPressed,
    this.textAlign,
    this.hoverColor,
    this.color,
    this.margin,
    this.actionDirection = Axis.horizontal,
    this.header = '',
  }) : label = Text(
          text,
          style: textStyle,
          textAlign: textAlign,
        );

  TextIcon.selectable(
      {super.key,
      this.icon,
      this.action,
      this.text = '',
      this.iconSize,
      this.textStyle,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.actionAlignment = MainAxisAlignment.start,
      this.mainAxisSize = MainAxisSize.min,
      this.showBorder = false,
      this.horizontalMargin = 8,
      this.verticalMargin = 5,
      this.onPressed,
      this.textAlign,
      this.hoverColor = const Color.fromARGB(255, 223, 223, 223),
      this.color,
      this.margin,
      this.actionDirection = Axis.horizontal,
      this.header = ''})
      : label = SelectableText(
          text,
          style: textStyle,
          textAlign: textAlign,
        );

  final Function()? onPressed;
  final List<Widget>? action;
  final MainAxisAlignment actionAlignment;
  final Axis actionDirection;
  final Color? color;
  final String header;
  final double horizontalMargin;
  final Color? hoverColor;
  final IconData? icon;
  final double? iconSize;
  final Widget label;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final EdgeInsetsGeometry? margin;
  final bool showBorder;
  final String text;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final double verticalMargin;

  @override
  State<TextIcon> createState() => _TextIconState();
}

class _TextIconState extends State<TextIcon> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    Color hoverColor() {
      return context.isDark
          ? widget.hoverColor ?? Colors.grey[140]
          : widget.hoverColor ?? Colors.grey[50];
    }

    Color? color() {
      if (context.isDark) {
        if (widget.onPressed != null) {
          return widget.color ?? Colors.grey[150];
        } else {
          return null;
        }
      } else {
        if (widget.onPressed != null) {
          return widget.color ?? Colors.grey[40];
        } else {
          return null;
        }
      }
    }

    return MouseRegion(
      onEnter: widget.onPressed == null
          ? null
          : (event) {
              setState(() {
                hovering = true;
              });
            },
      onExit: widget.onPressed == null
          ? null
          : (event) {
              setState(() {
                hovering = false;
              });
            },
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: context.theme.fastAnimationDuration,
          decoration: widget.showBorder
              ? context.boxDecoration.copyWith(
                  color: hovering ? hoverColor() : color(),
                )
              : BoxDecoration(
                  color: hovering ? hoverColor() : color(),
                  borderRadius: BorderRadius.circular(5),
                ),
          padding: EdgeInsets.symmetric(
            horizontal: widget.horizontalMargin,
            vertical: widget.verticalMargin,
          ),
          margin: widget.margin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.header.isNotEmpty) Text(widget.header),
              Row(
                mainAxisAlignment: widget.mainAxisAlignment,
                mainAxisSize: widget.mainAxisSize,
                children: [
                  if (widget.icon != null)
                    Icon(
                      widget.icon,
                      size: widget.iconSize,
                      color: widget.textStyle?.color,
                      semanticLabel: widget.text,
                    ),
                  if (widget.icon != null && widget.text.isNotEmpty)
                    const SizedBox(width: 10),
                  if (widget.actionDirection == Axis.horizontal)
                    Flexible(child: widget.label),
                  if (widget.action != null &&
                      widget.actionDirection == Axis.horizontal)
                    const SizedBox(width: 10),
                  if (widget.action != null &&
                      widget.actionDirection == Axis.vertical)
                    const SizedBox(height: 10),
                  if (widget.action != null &&
                      widget.actionDirection == Axis.vertical)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [widget.label, ...widget.action!],
                    ),
                  if (widget.action != null &&
                      widget.actionDirection == Axis.horizontal)
                    Row(
                      mainAxisAlignment: widget.actionAlignment,
                      children: widget.action!.toList(),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
