import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_pos/features/billing/presentation/widgets/billing_items_trial.dart';
import 'package:mobile_pos/features/billing/presentation/widgets/billing/billing_total.dart';

import '../../../../di/injection.dart';
import '../bloc/blocs.dart';
import '../widgets/billing/billing_items_list.dart';
import 'add_item_screen.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen({Key? key}) : super(key: key);

  @override
  _BillingScreenState createState() => _BillingScreenState();
}

void initialize() {}

class _BillingScreenState extends State<BillingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            getIt<BillingItemsBloc>()..add(GetBillingItemsEvent()),
        child: Scaffold(
            appBar: AppBar(
              title: Column(
                children: const [
                  Text(
                    'Billing',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white70,
                    ),
                  ),
                  Text('New Bill'),
                ],
              ),
              centerTitle: true,
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () => Navigator.pushReplacementNamed(
                      context, '/add-billing-item'),
                  icon: const Icon(Icons.add),
                ),
                _deleteButton()
              ],
            ),
            body: const BillingTrial(),
            bottomSheet: const BillingTotal(
              isCheckout: false,
            )));
  }

  Widget _deleteButton() {
    return BlocBuilder<BillingItemsBloc, BillingItemsState>(
        builder: (context, state) {
      if (state is BillingItemsLoaded) {
        return IconButton(
            onPressed: () {
              context.read<BillingItemsBloc>().add(RemoveBillingItemsEvent());
            },
            icon: const Icon(Icons.delete));
      }
      return const Icon(Icons.delete);
    });
  }

  // // TODO: Uncomment when we have real products.

  // Widget _buildItemsDataTable() {
  //   final columns = ['S.No. / Name', 'Item', 'Qty', 'Rate', 'Amount'];
  //   return DataTable(
  //     columns: _getColumns(columns),
  //     rows: _getRows(products),
  //   );
  // }

  // List<DataColumn> _getColumns(List<String> columns) => columns
  //     .map(
  //       (String column) => DataColumn(
  //         label: Text(
  //           column,
  //           style: const TextStyle(fontStyle: FontStyle.italic),
  //         ),
  //       ),
  //     )
  //     .toList();

  // List<DataRow> _getRows(List<Product> products) =>
  //     products.map((Product product) {
  //       final List<dynamic> productDetails = [
  //         product.serialNumber,
  //         product.name,
  //         product.quantity,
  //         product.rate,
  //         product.amount
  //       ];
  //       return DataRow(cells: _getProductCells(productDetails));
  //     }).toList();

  // List<DataCell> _getProductCells(List<dynamic> product) => product
  //     .map((productDetail) => DataCell(Text(productDetail.toString())))
  //     .toList();

}
