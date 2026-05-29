import 'package:flutter/material.dart';

class TypewriterText extends StatefulWidget {
  const TypewriterText({
    super.key,
    required this.text,
    this.style,
    this.duration = const Duration(milliseconds: 2200),
    this.cursorWidth = 2,
  });

  final String text;
  final TextStyle? style;
  final Duration duration;
  final double cursorWidth;

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _progress;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _progress = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _progress,
      builder: (context, _) {
        final count = (_progress.value * widget.text.length).floor().clamp(0, widget.text.length);
        final shown = widget.text.substring(0, count);
        final showCursor = count < widget.text.length;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(shown, style: widget.style),
            if (showCursor)
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: AnimatedOpacity(
                  opacity: 0.75,
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                    width: widget.cursorWidth,
                    height: (widget.style?.fontSize ?? 14) * 1.1,
                    decoration: BoxDecoration(
                      color: widget.style?.color ?? Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

