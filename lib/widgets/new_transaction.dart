import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  NewTransaction(this.addTx);
  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addTx(
      enteredTitle,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: "Title"),
            controller: titleController, onSubmitted: (_) => submitData(),
            // onChanged: (val) => inputTitle = val,
          ),
          TextField(
            decoration: InputDecoration(labelText: "Amount"),
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData(),
            // onChanged: (val) => inputAmount = val,
          ),
          TextButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.orange)),
            onPressed: () => submitData,
            // print(inputTitle);
            child: Text(
              'Add Transaction',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
