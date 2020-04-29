import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class Bar extends StatefulWidget {
  final String weekday;
  final String amount;
  final int percent;

  Bar(this.weekday,this.amount,this.percent);

  @override
  _BarState createState() => _BarState();
}

class _BarState extends State<Bar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.weekday,
        ),
        Container(
          height: 40,
          child: FAProgressBar(
            currentValue: widget.percent*100,
            direction: Axis.vertical,
            progressColor: Theme.of(context).primaryColor,
            size: 10,
            verticalDirection: VerticalDirection.up,
          ),
        ),
        Text(widget.amount),
      ],
    );
  }
}
