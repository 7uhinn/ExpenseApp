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
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: [
            Container(
              height: constraints.maxHeight*0.15,
              child: FittedBox(
                child: Text(
                  widget.weekday,
                  style: TextStyle(
                    color: Color.fromRGBO(100, 100, 100, 100),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight*0.05,
            ),
            Container(
              height: constraints.maxHeight*0.60,
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
              height: constraints.maxHeight*0.05,
            ),
            Container(
              height: constraints.maxHeight*0.15,
              child: FittedBox(
                child: Text(
                  widget.amount,
                  style: TextStyle(
                    color: Color.fromRGBO(100, 100, 100, 100),
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
