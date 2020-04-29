import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './widgets/listtxnui.dart';
import './widgets/newtxnui.dart';
import './widgets/chartui.dart';

import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExpenseApp',
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.copyWith(
              title: GoogleFonts.montserrat(
                fontSize: 18,
              ),
              button: GoogleFonts.montserrat(
                fontSize: 17,
                color: Colors.white,
              ),
            ),
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.orange[100],
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: GoogleFonts.robotoSlab(
                  fontSize: 20,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  openSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTxn(addtxn);
        });
  }

  final List<Transaction> txn = [];

  List<Transaction> get rectxn {
    return txn.where((t) {
      return t.date.isAfter(
        DateTime.now().subtract(
          Duration(
            days: 7,
          ),
        ),
      );
    }).toList();
  }

  void addtxn(String t, int a, DateTime d) {
    Transaction tx = Transaction(
      txnid: DateTime.now().toString(),
      title: t,
      amt: a,
      date: d,
    );

    setState(() {
      txn.add(tx);
    });
  }

  void deltxn(String id) {
    setState(() {
      txn.removeWhere((txn) {
        return txn.txnid == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(
        'ExpenseApp',
      ),
      actions: <Widget>[
        IconButton(
          iconSize: 32,
          icon: Icon(Icons.add),
          onPressed: () => openSheet(context),
        )
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.224,
              child: Chart(rectxn),
            ),
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.776,
              child: TxnList(txn, deltxn),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 35,
        ),
        onPressed: () => openSheet(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
