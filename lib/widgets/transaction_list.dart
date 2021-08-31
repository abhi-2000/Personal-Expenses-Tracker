import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../modules/transaction.dart';

class Transaction_list extends StatelessWidget {
  final List<Transaction> transaction;

  final Function deleteTx;

  Transaction_list(this.transaction,this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      child: transaction.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 80,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
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
                      style: Theme.of(context).appBarTheme.textTheme!.title,
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transaction[index].date)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTx(transaction[index].id),
                    ),
                  ),
                );
              },
              itemCount: transaction.length,
              // children: transaction.map((tx) {}).toList(),
            ),
    );
  }
}
