import 'package:expense_app/widgets/chartbarui.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> txn;

  Chart(this.txn);

  List<Map<String, Object>> get rectxn {
    return List.generate(7, (idx) {
      var weekday = DateTime.now().subtract(Duration(days: idx));
      int total = 0;

      for (int i = 0; i < txn.length; i++) {
        if (txn[i].date.day == weekday.day &&
            txn[i].date.month == weekday.month &&
            txn[i].date.year == weekday.year) {
          total += txn[i].amt;
        }
      }

      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': total
      };
    }).reversed.toList();
  }

  int get totalWeek {
    return rectxn.fold(0, (sum, t) {
      return sum + t['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(totalWeek);
    return Padding(
      padding: EdgeInsets.all(20),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: rectxn.map((t) {
              int x = t['amount'];
              print(x);
              return totalWeek != 0
                  ? Flexible(
                      child: Bar(
                        t['day'],
                        '₹${t['amount']}',
                        x / totalWeek,
                      ),
                      fit: FlexFit.tight,
                    )
                  : Bar(
                      t['day'],
                      '₹${t['amount']}',
                      0,
                    );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
