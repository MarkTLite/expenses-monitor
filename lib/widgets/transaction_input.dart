import 'package:flutter/material.dart';

class TransactionInput extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  TransactionInput({Key? key, required this.addTx}) : super(key: key);

  void onSubmitTx() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);

    if (title.isEmpty || amount < 0) {
      return;
    }

    addTx(
      title,
      amount, // needs error handling
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: 'Name of Expense'),
            controller: titleController,
            keyboardType: TextInputType.name,
            onSubmitted: (_) => onSubmitTx(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => onSubmitTx(),
          ),
          TextButton(
            child: Text(
              'Add Transaction',
              style: TextStyle(color: Colors.purple),
            ),
            onPressed: onSubmitTx,
          ),
        ]),
      ),
    );
  }
}
