import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function newTxnHandler;

  NewTransaction(this.newTxnHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void addTxn() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredAmount > 0 && enteredTitle.isNotEmpty) {
      widget.newTxnHandler(enteredTitle, enteredAmount);
    }

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
              controller: titleController,
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) =>
                  addTxn(), //When having an argument which is not intended to be used, by convention is named as an underscore
              // onChanged: (val) => amountInput = val,
            ),
            TextButton(
              onPressed: addTxn,
              child: Text('Add Transaction'),
              style: TextButton.styleFrom(
                primary: Colors.purple,
              ),
            )
          ],
        ),
      ),
      elevation: 5,
    );
  }
}
