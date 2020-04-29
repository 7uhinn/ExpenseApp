import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/transaction.dart';

class TxnList extends StatelessWidget {
  final List<Transaction> txn;
  final Function deltxn;

  TxnList(this.txn,this.deltxn);

  @override
  Widget build(BuildContext context) {
    return txn.length != 0
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
                        backgroundColor: Theme.of(context).accentColor,
                        radius: 30,
                        child: Text(
                          '₹${txn[idx].amt}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
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
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Theme.of(context).errorColor,
                        ),
                        onPressed: () => deltxn(txn[idx].txnid),
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
                height: 70,
                child: Image.asset(
                  'images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          );
  }
}
