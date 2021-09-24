import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';

import './widgets/new_transaction.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
            onTap: () {},
          );
        });
  }

  final List<Transaction> _transactionList = [
    Transaction(
      id: '001',
      text: 'Went to the car wash',
      amount: 36.57,
      date: new DateTime.now(),
    ),
    Transaction(
      id: '002',
      text: 'Went to the ATM',
      amount: 25.46,
      date: new DateTime.now(),
    ),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
      text: title,
      amount: amount,
      id: DateTime.now().toString(),
      date: DateTime.now(),
    );

    setState(() {
      _transactionList.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _startAddNewTransaction(context);
            },
            icon: Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              //wrapping a Card inside a Container will make the Card to take the full available width of it's parent widget
              width: double.infinity,
              child: Card(
                //If Card does not have a parent widget that clearly defines the width, it will take the width required of its child widgets
                child: Text('CHART'),
                color: Colors.blue,
                elevation: 5,
              ),
            ),
            NewTransaction(_addNewTransaction),
            TransactionList(_transactionList),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          _startAddNewTransaction(context);
        },
      ),
    );
  }
}
