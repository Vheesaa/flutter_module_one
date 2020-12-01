import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final amountController = TextEditingController();
  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: "amount"),
            controller: amountController,
            keyboardType: TextInputType.number,
          ),
          TextField(
            decoration: InputDecoration(labelText: "category"),
            controller: titleController,
          ),
          FlatButton(
            onPressed: () {
              widget.addTx(
                  titleController.text, double.parse(amountController.text));
            },
            child:
                Text('Add Transaction', style: TextStyle(color: Colors.purple)),
          )
        ],
      ),
    ));
  }
}
