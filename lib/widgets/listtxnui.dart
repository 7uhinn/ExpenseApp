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
                return Card(
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        margin: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '₹ ${txn[idx].amt}',
                          style: GoogleFonts.montserrat(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            txn[idx].title,
                            style: Theme.of(context).textTheme.title,
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            DateFormat.MMMd().format(txn[idx].date) +
                                ', ' +
                                DateFormat.Hm().format(txn[idx].date),
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
