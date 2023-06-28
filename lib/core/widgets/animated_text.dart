import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText(
    this.text, {
    super.key,
    this.fontSize=12,
    this.seconds=2,
    this.color=Colors.black,
    this.fontWeight=FontWeight.normal,
  });

  final String text;
   final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final int seconds;

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration:  Duration(seconds: widget.seconds),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _animation,
      axis: Axis.horizontal,
      axisAlignment: -1,
      child: Text(
        widget.text,
        style: TextStyle(
          color: widget.color,
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,

        ),
      ),
    );
  }
}
