import 'package:flutter/material.dart';

class FadeInUp extends StatefulWidget {
  const FadeInUp({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 520),
  });

  final Widget child;
  final Duration delay;
  final Duration duration;

  @override
  State<FadeInUp> createState() => _FadeInUpState();
}

class _FadeInUpState extends State<FadeInUp> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      if (!mounted) return;
      setState(() => _visible = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 1 : 0,
      duration: widget.duration,
      curve: Curves.easeOut,
      child: AnimatedContainer(
        duration: widget.duration,
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, _visible ? 0 : 14, 0),
        child: widget.child,
      ),
    );
  }
}

