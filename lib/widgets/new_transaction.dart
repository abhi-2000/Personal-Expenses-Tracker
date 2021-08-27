import 'package:flutter/material.dart';
class Newtransaction extends StatelessWidget {
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();
  final Function addTx;
   Newtransaction(this.addTx);
  @override
  Widget build(BuildContext context) {
    return             Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titlecontroller,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountcontroller,
            ),
            TextButton(
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Colors.purple),
              ),
              onPressed: () {
                addTx(titlecontroller.text,double.parse(amountcontroller.text));
              },
            )
          ],
        ),
      ),
    );
    ;
  }
}
