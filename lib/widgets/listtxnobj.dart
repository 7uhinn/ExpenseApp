import 'package:flutter/material.dart';

import './listtxnui.dart';
import './newtxnui.dart';
import '../models/transaction.dart';

class UserTxn extends StatefulWidget {
  @override
  _UserTxnState createState() => _UserTxnState();
}

class _UserTxnState extends State<UserTxn> {
  final List<Transaction> txn = [
    Transaction(
      txnid: '1',
      title: 'Food',
      amt: 120,
      date: DateTime.now(),
    ),
    Transaction(
      txnid: '2',
      title: 'Shoes',
      amt: 100,
      date: DateTime.now(),
    ),
  ];

  void addtxn(String t,int a){
    Transaction tx = Transaction(
      txnid: DateTime.now().toString(),
      title: t,
      amt: a,
      date: DateTime.now(),
    );

    setState((){
      txn.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTxn(txn,addtxn),
        TxnList(txn),
      ],
    );
  }
}
