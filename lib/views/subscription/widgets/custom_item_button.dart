import 'package:flutter/material.dart';
import 'package:subscription/common/extension/context_ext.dart';

class CustomItemButton extends StatefulWidget {
  const CustomItemButton({super.key, this.label, this.onPressed, this.margin});

  final String? label;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? margin;

  @override
  State<CustomItemButton> createState() => _CustomItemButtonState();
}

class _CustomItemButtonState extends State<CustomItemButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: AnimatedContainer(
        margin: widget.margin,
        transformAlignment: Alignment.topLeft,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          // color: _isHovered ? Colors.green : Colors.transparent,
          // borderRadius: BorderRadius.circular(10),
          border: Border(
            bottom: BorderSide(
              color:
                  _isHovered ? theme.colorScheme.secondary : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        child: GestureDetector(
          onTap: widget.onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              widget.label ?? "Button",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: _isHovered ? theme.colorScheme.secondary : Colors.black,
                fontWeight: _isHovered ? FontWeight.bold : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
