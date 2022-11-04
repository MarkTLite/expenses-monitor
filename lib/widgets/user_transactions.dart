import 'package:flutter/cupertino.dart';

import '../models/transaction.dart';
import './transaction_input.dart';
import './transactions_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  //the two widgets below are there because they make use of this state variable
  final List<Transaction> _transactions = [
    Transaction(
      id: 't1',
      title: "New Shoes",
      price: 69.99,
      time: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      price: 16.99,
      time: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      price: txAmount,
      time: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionInput(addTx: _addNewTransaction),
        TransactionsList(transactions: _transactions),
      ],
    );
  }
}
