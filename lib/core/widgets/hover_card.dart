import 'package:flutter/material.dart';

class HoverCard extends StatefulWidget {
  const HoverCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding,
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final base = theme.colorScheme.surface;
    final outline = theme.colorScheme.outline;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        transform:
            _hovering ? (Matrix4.identity()..scale(1.01)) : Matrix4.identity(),
        padding: widget.padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: _hovering
              ? base.withValues(alpha: 0.9)
              : base.withValues(alpha: 0.65),
          border: Border.all(
            color: outline.withValues(alpha: _hovering ? 0.22 : 0.12),
          ),
          boxShadow: _hovering
              ? [
                  BoxShadow(
                    blurRadius: 26,
                    spreadRadius: 0,
                    offset: const Offset(0, 14),
                    color: theme.colorScheme.primary.withValues(alpha: 0.12),
                  )
                ]
              : const [],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: widget.onTap,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
