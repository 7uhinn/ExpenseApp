import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TxnList extends StatelessWidget {
  final List<Transaction> txn;

  TxnList(this.txn);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      child: ListView.builder(
        itemBuilder: (ctx, idx) {
          return Card(
            child: Row(
              children: [
                Container(
                  width: 72,
                  margin: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '₹ ${txn[idx].amt}',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      txn[idx].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      DateFormat.MMMd().format(txn[idx].date)+','+DateFormat.Hm().format(txn[idx].date),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: txn.length,
      ),
    );
  }
}
