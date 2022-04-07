// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionView extends StatelessWidget {
  final List<Transaction> transactions;
  final Function delteTransaction;

  TransactionView(this.transactions, this.delteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 500,
      child: transactions.isEmpty
          ? Column(
              children: [
                SizedBox(height: 20),
                Text("No transaction to show!"),
                Container(
                  height: 200,
                  child: Image.asset(
                    "assets/images/loading2.gif",
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 6, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: FittedBox(
                          child: Text(
                            transactions[index].amount.toStringAsFixed(2),
                          ),
                        ),
                      ),
                    ),
                    title: Title(
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        transactions[index].title,
                        // style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat("E MMM dd, yy")
                          .format(transactions[index].date),
                    ),
                    trailing: MediaQuery.of(context).size.width > 460
                        ? TextButton.icon(
                            onPressed: () =>
                                delteTransaction(transactions[index].id),
                            icon: Icon(Icons.delete),
                            label: Text("Delete"),
                            style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.red),
                            ),
                          )
                        : IconButton(
                            color: Theme.of(context).errorColor,
                            icon: Icon(Icons.delete),
                            onPressed: () =>
                                delteTransaction(transactions[index].id),
                          ),
                  ),
                );

                // return Card(
                //   child: Row(
                //     children: <Widget>[
                //       Container(
                //         margin: EdgeInsets.symmetric(
                //           vertical: 10,
                //           horizontal: 15,
                //         ),
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             color: Theme.of(context).primaryColor,
                //             width: 1,
                //           ),
                //         ),
                //         padding: EdgeInsets.all(10),
                //         child: Text(
                //           "${transactions[index].amount.toStringAsFixed(2)} ETB",
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 16,
                //             color: Theme.of(context).primaryColor,
                //           ),
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[
                //           Text(
                //             transactions[index].title,
                //             style: Theme.of(context).textTheme.headline6,
                //           ),
                //           Text(
                //             DateFormat("EEE MMM dd, yy")
                //                 .format(transactions[index].date),
                //             style: TextStyle(color: Colors.grey, fontSize: 13),
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
