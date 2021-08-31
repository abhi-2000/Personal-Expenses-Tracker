import 'package:flutter/material.dart';
import 'package:personal_expenses/modules/transaction.dart';
import 'package:personal_expenses/widgets/chart.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';
import 'modules/transaction.dart';

import 'modules/transaction.dart';
import 'modules/transaction.dart';
import 'modules/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: 'Quicksand',
          textTheme: ThemeData
              .light()
              .textTheme
              .copyWith(
              title: TextStyle(fontFamily: 'OpenSans', fontSize: 18)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData
                  .light()
                  .textTheme
                  .copyWith(
                  title: TextStyle(fontFamily: 'OpenSans', fontSize: 20,
                      fontWeight: FontWeight.bold)))), home
        :
    MyHomePage
      (
    )
      ,
    );
  }
}

class MyHomePage extends StatefulWidget {
  // late String titleInput, amountInput;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _userTransaction = [];
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Grocessories',
    //   amount: 16.53,
    //   date: DateTime.now(),
    // )
List<Transaction> get _recentTransactions {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
}

  void _addNewTransaction(String txTitle, double txAmount,DateTime choosenDate) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: choosenDate,
        id: DateTime.now().toString());
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _deleteTransaction(String id){
  setState(() {
    _userTransaction.removeWhere((tx){
      return tx.id==id;
    });
  });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: Newtransaction(_addNewTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses Tracker'),
        actions: [
          IconButton(
              onPressed: () {
                _startAddNewTransaction(context);
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
              children: <Widget>[
              Chart(_recentTransactions),
          Transaction_list(_userTransaction,_deleteTransaction),
      ],
    ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: FloatingActionButton(
    child: Icon(Icons.add),
    onPressed: () => {_startAddNewTransaction(context)},
    )
    ,
    );
  }
}
