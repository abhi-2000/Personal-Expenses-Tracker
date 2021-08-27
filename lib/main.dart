import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';
import 'package:personal_expenses/widgets/user_transaction.dart';
import 'modules/transaction.dart';
import 'package:intl/intl.dart';
import 'widgets/new_transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // late String titleInput, amountInput;
  // final titlecontroller = TextEditingController();
  // final amountcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses Tracker'),
      ),
      body: Column(
        children: <Widget>[
      Container(
      width: double.infinity,
        child: Card(
          child: Text(
            'Chart',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blue,
        ),
      ),
      UserTransaction(),
      ],
    ));
  }
}
