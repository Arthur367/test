import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_pos/database/app_database.dart';
import 'package:mobile_pos/database/stock/stock_dao.dart';
import 'package:mobile_pos/features/billing/presentation/pages/billing_screen.dart';
import 'package:mobile_pos/features/billing/presentation/pages/customer_class.dart';
import 'package:mobile_pos/features/billing/presentation/widgets/stock/add_item_list.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/presentation/bloc/blocs.dart';
import '../../../../di/injection.dart';

class AddItemScreen extends StatefulWidget {
  final CustomerClass customer;
  const AddItemScreen({Key? key, required this.customer}) : super(key: key);

  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Item(s)',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // TODO: build a search delegate
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: BlocProvider(
        create: (context) => getIt<StockBloc>()..add(GetStockAtHandEvent()),
        child: AddItemList(
          customer: widget.customer,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final db = Provider.of<StockDao>(context, listen: false);
          final stock = db.showAllStock();
          List<StockDataClass> stocks = await stock;
          int quantity = 0;
          for (int i = 0; i < stocks.length; i++) {
            int available = stocks[i].transactionQauntity.toInt();
            quantity = available;
          }
          if (quantity >= 1) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (_) => BillingScreen(customer: widget.customer)));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('No item for sale')),
            );
          }
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
