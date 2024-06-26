import 'package:flutter/material.dart';

import 'shadows.dart';

class StockholmRadioButton<T> extends StatefulWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T>? onChanged;
  final String? label;
  final double size;
  final bool enabled;

  const StockholmRadioButton({
    required this.value,
    required this.groupValue,
    this.onChanged,
    this.label,
    this.size = 16.0,
    this.enabled = true,
    Key? key,
  }) : super(key: key);

  @override
  _StockholmRadioButtonState<T> createState() =>
      _StockholmRadioButtonState<T>();
}

class _StockholmRadioButtonState<T> extends State<StockholmRadioButton<T>> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    var enabled = widget.onChanged != null && widget.enabled;

    Widget visual;
    if (widget.value == widget.groupValue) {
      Color color;

      if (enabled) {
        color = Theme.of(context).indicatorColor;
        if (_pressed) color = Color.lerp(color, Colors.black, 0.2)!;
      } else {
        color = Theme.of(context).disabledColor;
      }

      visual = Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // borderRadius: BorderRadius.all(Radius.circular(widget.cornerRadius)),
          color: color,
          boxShadow: enabled ? stockholmBoxShadow(context) : null,
        ),
        child: Icon(
          Icons.circle,
          size: widget.size / 2,
          color: Theme.of(context).cardColor,
        ),
      );
    } else {
      var color = Theme.of(context).cardColor;
      if (_pressed) color = Color.lerp(color, Colors.black, 0.2)!;

      visual = Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // borderRadius: BorderRadius.all(Radius.circular(widget.cornerRadius)),
          color: color,
          border: Border.all(color: Theme.of(context).dividerColor, width: 1.0),
          boxShadow: stockholmBoxShadow(context),
        ),
      );
    }

    if (widget.label != null) {
      var textStyle = Theme.of(context).textTheme.bodyMedium!;
      if (!enabled) {
        textStyle = textStyle.copyWith(
            color: Theme.of(context).textTheme.bodySmall!.color);
      }

      visual = Row(
        children: [
          visual,
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              widget.label!,
              style: textStyle,
            ),
          ),
        ],
      );
    }

    if (!enabled) return visual;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        widget.onChanged!(widget.value);
      },
      onTapDown: (_) {
        setState(() {
          _pressed = true;
        });
      },
      onTapCancel: () {
        setState(() {
          _pressed = false;
        });
      },
      onTapUp: (_) {
        setState(() {
          _pressed = false;
        });
      },
      child: visual,
    );
  }
}
