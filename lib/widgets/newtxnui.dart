import 'package:flutter/material.dart';

class NewTxn extends StatefulWidget {
  final Function addtxn;

  NewTxn(this.addtxn);

  @override
  _NewTxnState createState() => _NewTxnState();
}

class _NewTxnState extends State<NewTxn> {
  final tC = TextEditingController();

  final aC = TextEditingController();

  void submitData(){
    final title =  tC.text;
    final amount = int.parse(aC.text);
    
    if(title.isEmpty || amount <= 0){
      return;
    }

    widget.addtxn(title,amount);
  }

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
              onSubmitted: (_) => submitData(),
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: aC,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
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
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
