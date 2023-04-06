import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: FittedBox(child: Text('\$${transaction.amount}')),
            )),
        title: Text(transaction.title,
            style: Theme.of(context).textTheme.titleMedium),
        subtitle: Text(DateFormat.yMMMd().format(transaction.date)),
        trailing: MediaQuery.of(context).size.width > 360
            ? TextButton.icon(
                onPressed: () => deleteTx(transaction.id),
                icon: Icon(Icons.delete),
                label: const Text('Delete'),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () => deleteTx(transaction.id),
              ),
      ),
    );
  }
}
