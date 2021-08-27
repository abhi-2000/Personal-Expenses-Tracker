import 'package:flutter/material.dart';

class Newtransaction extends StatelessWidget {
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();
  final Function addTx;

  Newtransaction(this.addTx);

  void submitdata() {
    final enteredTitle=titlecontroller.text;
    final enteredAmount=double.parse(amountcontroller.text);
    if(enteredTitle.isEmpty || enteredAmount<=0){
      return;
    }
    addTx(enteredTitle,enteredAmount);
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
