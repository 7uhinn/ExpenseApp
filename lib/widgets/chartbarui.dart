import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class Bar extends StatefulWidget {
  final String weekday;
  final String amount;
  final double percent;

  Bar(this.weekday, this.amount, this.percent);

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
        SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          child: FAProgressBar(
            currentValue: (widget.percent * 100).toInt(),
            direction: Axis.vertical,
            progressColor: Theme.of(context).primaryColor,
            size: 10,
            verticalDirection: VerticalDirection.up,
            backgroundColor: Theme.of(context).accentColor,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          widget.amount,
          style: TextStyle(
            fontSize: 13,
            color: Color.fromRGBO(100, 100, 100, 100),
          ),
        ),
      ],
    );
  }
}
