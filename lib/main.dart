import 'package:flutter/material.dart';
import 'package:flutter_module_one/models/pinyin.dart';
import 'package:flutter_module_one/widgets/chart.dart';

import 'package:flutter_module_one/widgets/new_transactions.dart';
import 'package:flutter_module_one/widgets/transaction_list.dart';
import 'package:flutter_module_one/models/transaction.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Personal Expenses",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.yellow,
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
  final List<Transaction> _userTransactions = [];

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  void _addNewTransaction(String txtitle, double txamount) {
    final newTX = Transaction(
        title: txtitle, amount: txamount, date: DateTime.now(), id: "123");

    setState(() {
      _userTransactions.add(newTX);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses - Changed"),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                startAddNewTransaction(context);
              })
        ],
      ),
      body: Column(
        children: <Widget>[
          Chart(),
          TransactionList(_userTransactions),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          hanziToPinyin();
        },
      ),
    );
  }
}

// Transaction(id: "123", title: "shoes", amount: 70, date: DateTime.now()),
//   Transaction(
//        id: "124", title: "groceries", amount: 50, date: DateTime.now()),
