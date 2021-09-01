import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../modules/transaction.dart';

class Transaction_list extends StatelessWidget {
  final List<Transaction> transaction;

  final Function deleteTx;

  Transaction_list(this.transaction, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: [
          Text(
            'No transactions added yet!',
            style: Theme
                .of(context)
                .textTheme
                .title,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              height: constraints.maxHeight * 0.6,
              child: Image.asset(
                'assets/images/waiting.png',
                fit: BoxFit.cover,
              )),
        ],
      );
    })
        : ListView.builder(
      itemBuilder: (ctx, index) {
        return Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
            child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                          child: Text('₹ ${transaction[index].amount}'))),
                ),
                title: Text(
                  transaction[index].title,
                  style: Theme
                      .of(context)
                      .appBarTheme
                      .textTheme!
                      .title,
                ),
                subtitle:
                Text(DateFormat.yMMMd().format(transaction[index].date)),
                trailing: MediaQuery
                    .of(context)
                    .size
                    .width > 460
                    ? FlatButton.icon(
                  icon: Icon(Icons.delete),
                  textColor: Theme
                      .of(context)
                      .errorColor,
                  onPressed: () => deleteTx(transaction[index].id),
                    label: Text(
                  'Delete',
                ))
                : IconButton(
            icon: Icon(Icons.delete),
        color: Theme.of(context).errorColor,
        onPressed: () => deleteTx(transaction[index].id),
        ),
        ),
        );
      },
      itemCount: transaction.length,
      // children: transaction.map((tx) {}).toList(),
    );
  }
}
