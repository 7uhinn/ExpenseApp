import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTxn extends StatefulWidget {
  final Function addtxn;

  NewTxn(this.addtxn);

  @override
  _NewTxnState createState() => _NewTxnState();
}

class _NewTxnState extends State<NewTxn> {
  final tC = TextEditingController();
  final aC = TextEditingController();
  DateTime inpdate;

  void submitData() {
    final title = tC.text;
    final amount = int.parse(aC.text);

    if (title.isEmpty || amount <= 0 || inpdate == null) {
      return;
    }

    widget.addtxn(title, amount, inpdate);

    Navigator.of(context).pop();
  }

  void pickDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((d) {
      if (d == null) {
        return;
      }
      setState(() {
        inpdate = d;
      });
    });
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
              style: Theme.of(context).textTheme.title,
              controller: tC,
              onSubmitted: (_) => submitData(),
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              style: Theme.of(context).textTheme.title,
              controller: aC,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 16,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      inpdate == null
                          ? 'No Date Chosen!'
                          : 'Date Chosen: ${DateFormat.yMMMd().format(inpdate)}',
                    ),
                  ),
                  FlatButton(
                    onPressed: pickDate,
                    child: Text(
                      'Choose date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                'Add transaction',
                style: Theme.of(context).textTheme.button,
              ),
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
