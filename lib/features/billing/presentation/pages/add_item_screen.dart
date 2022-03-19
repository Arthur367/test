import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_pos/features/billing/presentation/widgets/stock/add_item_list.dart';

import '../../../../core/common/presentation/bloc/blocs.dart';
import '../../../../di/injection.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({Key? key}) : super(key: key);

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
        child: const AddItemList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/billing');
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
