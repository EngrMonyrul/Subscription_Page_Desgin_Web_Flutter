import 'package:flutter/material.dart';
import 'package:subscription/common/extension/context_ext.dart';

class CustomElevatedButton extends StatefulWidget {
  const CustomElevatedButton(
      {super.key, this.width, this.padding, this.label, this.onPressed});

  final double? width;
  final EdgeInsetsGeometry? padding;
  final String? label;
  final VoidCallback? onPressed;

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: widget.width ?? 150,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _isHovered
                ? theme.colorScheme.secondary
                : theme.colorScheme.secondary.withOpacity(0.3),
            border: Border.all(color: theme.colorScheme.secondary)),
        child: GestureDetector(
          onTap: widget.onPressed,
          child: Padding(
            padding: widget.padding ??
                const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
            child: Text(
              widget.label ?? "Button",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: _isHovered ? Colors.white : Colors.black,
                fontWeight: _isHovered ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
