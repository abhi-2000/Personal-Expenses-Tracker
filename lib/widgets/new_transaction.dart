import 'package:flutter/material.dart';

class Newtransaction extends StatefulWidget {
  final Function addTx;

  Newtransaction(this.addTx);

  @override
  _NewtransactionState createState() => _NewtransactionState();
}

class _NewtransactionState extends State<Newtransaction> {
  final titlecontroller = TextEditingController();

  final amountcontroller = TextEditingController();

  void submitdata() {
    final enteredTitle=titlecontroller.text;
    final enteredAmount=double.parse(amountcontroller.text);
    if(enteredTitle.isEmpty || enteredAmount<=0){
      return;
    }
    widget.addTx(enteredTitle,enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titlecontroller,
              onSubmitted: (_) => submitdata(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountcontroller,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitdata(),
            ),
            TextButton(
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Colors.purple),
              ),
              onPressed: () =>submitdata(),
            )
          ],
        ),
      ),
    );
    ;
  }
}
