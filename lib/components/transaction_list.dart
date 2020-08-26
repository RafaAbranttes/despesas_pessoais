import 'package:expenses/components/tansaction_Item.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    print('build() transactionList');
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  Text(
                    'Nenhuma Transação Cadastrada!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets\\images\\waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )

          // :
          // ListView(children: transactions.map((tr) {
          //   return TransactionItem(
          //     key:  ValueKey(tr.id),
          //     tr: tr,
          //     onRemove: onRemove,
          //   );
          // }).toList());
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return TransactionItem(
                key: GlobalObjectKey(tr),
                tr: tr,
                onRemove: onRemove,
              );
            },
          );
  }
}
