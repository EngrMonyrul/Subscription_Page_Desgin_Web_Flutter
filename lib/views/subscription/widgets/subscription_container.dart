import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscription/common/extension/context_ext.dart';
import 'package:subscription/views/subscription/widgets/custom_elevated_button.dart';

class SubscriptionContainer extends StatefulWidget {
  const SubscriptionContainer(
      {super.key, this.onPressed, this.month, this.dollar});

  final VoidCallback? onPressed;
  final String? month;
  final String? dollar;

  @override
  State<SubscriptionContainer> createState() => _SubscriptionContainerState();
}

class _SubscriptionContainerState extends State<SubscriptionContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return MouseRegion(
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
        width: 300,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _isHovered
              ? theme.colorScheme.primary
              : CupertinoColors.systemGrey5,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.month ?? "",
              style: theme.textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w900,
                color: _isHovered ? Colors.black54 : theme.colorScheme.tertiary,
              ),
            ),
            Text(
              "months",
              style: theme.textTheme.labelSmall?.copyWith(
                color: _isHovered ? Colors.black54 : theme.colorScheme.tertiary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "\$${widget.dollar}",
              style: theme.textTheme.displayLarge?.copyWith(
                color: _isHovered ? theme.colorScheme.secondary : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Subscribe now for ${widget.month} months and unlock exclusive benefits and content! Enjoy premium articles, special discounts, and early access to new features. Don't miss out – join our community today!",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: _isHovered ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (_isHovered)
              const Center(
                child: CustomElevatedButton(
                  label: "Subscribe Now!",
                ),
              ),
          ],
        ),
      ),
    );
  }
}
