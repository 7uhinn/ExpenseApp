import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './widgets/listtxnui.dart';
import './widgets/newtxnui.dart';

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
            ),
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepOrange,
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

  final List<Transaction> txn = [
    // Transaction(
    //   txnid: '1',
    //   title: 'Food',
    //   amt: 120,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   txnid: '2',
    //   title: 'Shoes',
    //   amt: 100,
    //   date: DateTime.now(),
    // ),
  ];

  void addtxn(String t, int a) {
    Transaction tx = Transaction(
      txnid: DateTime.now().toString(),
      title: t,
      amt: a,
      date: DateTime.now(),
    );

    setState(() {
      txn.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Here goes the charts!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            TxnList(txn),
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
