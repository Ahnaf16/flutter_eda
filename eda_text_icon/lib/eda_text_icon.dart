// ignore_for_file: public_member_api_docs, sort_constructors_first
library eda_text_icon;

import 'package:eda_text_icon/ex.dart';
import 'package:flutter/material.dart';

class EdaTextIcon extends StatefulWidget {
  EdaTextIcon({
    super.key,
    this.header = '',
    this.text = '',
    this.textAlign,
    this.textStyle,
    this.icon,
    this.iconSize,
    this.action,
    this.actionAlignment = MainAxisAlignment.start,
    this.actionDirection = Axis.horizontal,
    this.onPressed,
    this.showBorder = false,
    this.color,
    this.hoverColor,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.min,
    this.margin,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
    this.border,
  }) : label = Text(
          text,
          style: textStyle,
          textAlign: textAlign,
        );

  EdaTextIcon.selectable({
    super.key,
    this.header = '',
    this.text = '',
    this.textAlign,
    this.textStyle,
    this.icon,
    this.iconSize,
    this.action,
    this.actionAlignment = MainAxisAlignment.start,
    this.actionDirection = Axis.horizontal,
    this.onPressed,
    this.showBorder = false,
    this.color,
    this.hoverColor,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.min,
    this.margin,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
    this.border,
  }) : label = SelectableText(
          text,
          style: textStyle,
          textAlign: textAlign,
        );

  final String header;
  final Widget label;
  final String text;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final IconData? icon;
  final double? iconSize;
  final List<Widget>? action;
  final MainAxisAlignment actionAlignment;
  final Axis actionDirection;
  final Function()? onPressed;
  final bool showBorder;
  final Color? color;
  final Color? hoverColor;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BoxBorder? border;

  @override
  State<EdaTextIcon> createState() => EdaTextIconState();
}

class EdaTextIconState extends State<EdaTextIcon> {
  bool hovered = false;

  Color? get getColor {
    if (context.isDark && hovered) {
      return widget.hoverColor ?? const Color.fromARGB(255, 20, 20, 20);
    }
    if (context.isDark && !hovered) {
      return widget.hoverColor ?? const Color.fromARGB(255, 35, 35, 35);
    }
    if (!context.isDark && hovered) {
      return widget.hoverColor ?? const Color.fromARGB(255, 195, 195, 195);
    }
    if (!context.isDark && !hovered) {
      return widget.hoverColor ?? const Color.fromARGB(255, 175, 175, 175);
    }
    return null;
  }

  Color? get getWidgetColor {
    if (context.isDark) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  Color get getBorderColor {
    if (context.isDark && hovered) {
      return Colors.white60;
    }
    if (context.isDark && !hovered) {
      return Colors.white38;
    }
    if (!context.isDark && hovered) {
      return Colors.black26;
    }
    if (!context.isDark && !hovered) {
      return Colors.black54;
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: widget.onPressed == null
          ? null
          : (event) {
              setState(() {
                hovered = true;
              });
            },
      onExit: widget.onPressed == null
          ? null
          : (event) {
              setState(() {
                hovered = false;
              });
            },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.header.isNotEmpty) Text(widget.header),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: widget.padding,
            margin: widget.margin,
            decoration: BoxDecoration(
              color: widget.onPressed == null ? null : getColor,
              borderRadius: BorderRadius.circular(5),
              border: widget.border ??
                  Border.fromBorderSide(
                    widget.showBorder
                        ? BorderSide(color: getBorderColor)
                        : BorderSide.none,
                  ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: widget.mainAxisAlignment,
                  mainAxisSize: widget.mainAxisSize,
                  children: [
                    ///* icon
                    if (widget.icon != null)
                      Icon(
                        widget.icon,
                        size: widget.iconSize,
                        color: getWidgetColor,
                        semanticLabel: widget.text,
                      ),

                    ///* Space
                    if (widget.icon != null && widget.text.isNotEmpty)
                      const SizedBox(width: 10),

                    ///* Text horizontal
                    if (widget.actionDirection == Axis.horizontal)
                      Flexible(child: widget.label),

                    ///* Space horizontal
                    if (widget.action != null &&
                        widget.actionDirection == Axis.horizontal)
                      const SizedBox(width: 10),

                    ///*
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
        ],
      ),
    );
  }
}
