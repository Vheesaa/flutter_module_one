import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: transactions.isEmpty
            ? Column(
                children: [Text("No transactions added yet")],
              )
            : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: Row(children: <Widget>[
                    Container(
                      width: 100,
                      height: 50,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).hintColor, width: 2)),
                      child: Text(
                        "Rs.${transactions[index].amount}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Theme.of(context).primaryColor),
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                    Container(
                      width: 270,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).hintColor, width: 2)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(transactions[index].title,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Text(
                              DateFormat.yMMMMd()
                                  .format(transactions[index].date),
                              style: TextStyle(color: Colors.grey))
                        ],
                      ),
                    ),
                  ]));
                },
              ));
  }
}
