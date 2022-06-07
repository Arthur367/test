import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_pos/core/common/presentation/widget/loading_indicator.dart';
import 'package:mobile_pos/database/app_database.dart';
import 'package:mobile_pos/database/transaction/transaction_dao.dart';
import 'package:mobile_pos/di/injection.dart';
import 'package:mobile_pos/features/billing/presentation/bloc/invoice/invoice_bloc.dart';
import 'package:mobile_pos/features/billing/presentation/widgets/invoice/invoice_items.dart';
import 'package:provider/provider.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  _ReportsScreenState createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Reports'),
          centerTitle: true,
        ),
        body: Column(
          children: [Expanded(child: _buildContent(context))],
        )
        // body: ListView.builder(
        //   itemCount: 18,
        //   itemBuilder: (BuildContext context, int index) {
        //     return ListTile(
        //       leading: const Icon(
        //         Icons.summarize_outlined,
        //       ),
        //       title: Text('Report $index'),
        //       trailing: const Icon(
        //         Icons.arrow_forward_outlined,
        //       ),
        //       onTap: () {},
        //     );
        //   },
        // ),
        );
  }

  StreamBuilder<List<TransactionDataClass>> _buildContent(
      BuildContext context) {
    final database = Provider.of<TransactionDao>(context);
    return StreamBuilder(
        stream: database.watchTransactions(),
        builder: (context, AsyncSnapshot<List<TransactionDataClass>> snapshot) {
          final transactions = snapshot.data ?? [];
          return ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (_, index) {
                return Card(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) =>
                              InvoiceItems(transactions: transactions[index])));
                    },
                    child: ListTile(
                      title: Text(transactions[index].customerName),
                      subtitle: Text(transactions[index].customerEmail),
                    ),
                  ),
                );
              });
        });
  }
}
