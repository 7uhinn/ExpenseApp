import '../models/transaction.dart';
import 'package:flutter/material.dart';

class NewTxn extends StatelessWidget {
  final List<Transaction> txn;

  NewTxn(this.txn);

  final tC = TextEditingController();
  final aC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: tC,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: aC,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
            ),
            FlatButton(
              child: Text(
                'Add transaction',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
