import 'package:flutter/material.dart';
import '../models/transaction.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactionList;

  TransactionList(this._transactionList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        //ListView.builder is more performant since it doesn't load all the elements of the children, but only the ones that can be visualized in the screen
        itemBuilder: (ctx, idx) {
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width:
                              2), //Border.all allows to specify a border in all directions
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '\$${_transactionList[idx].amount.toStringAsFixed(2)}', //This is similar to Javascript string litereals - String interpolation in dart
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )),
                Container(
                  padding: EdgeInsets.all(7),
                  margin: EdgeInsets.all(7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _transactionList[idx].text,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMEd()
                            .add_Hm()
                            .format(_transactionList[idx].date),
                        style: TextStyle(
                          color: Colors.blueGrey[200],
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
        itemCount: _transactionList.length,
      ),
    );
  }
}
