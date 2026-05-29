import 'package:flutter/material.dart';

class ScrollProgressIndicator extends StatefulWidget {
  const ScrollProgressIndicator({
    super.key,
    required this.controller,
  });

  final ScrollController controller;

  @override
  State<ScrollProgressIndicator> createState() =>
      _ScrollProgressIndicatorState();
}

class _ScrollProgressIndicatorState extends State<ScrollProgressIndicator> {
  double _progress = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) => _onScroll());
  }

  @override
  void didUpdateWidget(covariant ScrollProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_onScroll);
      widget.controller.addListener(_onScroll);
      _onScroll();
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (!widget.controller.hasClients) return;

    final position = widget.controller.position;
    final max = position.maxScrollExtent;
    final next = max <= 0 ? 0.0 : (position.pixels / max).clamp(0.0, 1.0);

    if (next == _progress) return;
    setState(() => _progress = next);
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final width = MediaQuery.sizeOf(context).width;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: IgnorePointer(
        child: SizedBox(
          height: 2,
          width: width,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ColoredBox(color: primary.withValues(alpha: 0.15)),
              AnimatedContainer(
                duration: const Duration(milliseconds: 120),
                curve: Curves.easeOutCubic,
                width: width * _progress,
                color: primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
