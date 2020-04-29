import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/transaction.dart';

class TxnList extends StatelessWidget {
  final List<Transaction> txn;

  TxnList(this.txn);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      child: txn.length != 0
          ? ListView.builder(
              itemBuilder: (ctx, idx) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 3,
                    horizontal: 8,
                  ),
                  child: Card(
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: Text(
                            '₹${txn[idx].amt}',
                          ),
                        ),
                        title: Text(
                          txn[idx].title,
                          style: Theme.of(context).textTheme.title,
                        ),
                        subtitle: Text(
                          DateFormat.yMMMEd().format(txn[idx].date) +
                              ', ' +
                              DateFormat.Hm().format(txn[idx].date),
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: txn.length,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No transactions recorded yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
    );
  }
}
