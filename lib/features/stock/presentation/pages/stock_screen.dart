import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/presentation/bloc/blocs.dart';
import '../../../../di/injection.dart';
import '../widgets/stock_list.dart';

class StockScreen extends StatefulWidget {
  const StockScreen({Key? key}) : super(key: key);

  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: const [
            Text(
              'Stock',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.white70,
              ),
            ),
            Text('Stock At Hand'),
          ],
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => getIt<StockBloc>()..add(GetStockAtHandEvent()),
        child: const StockList(),
      ),
    );
  }

  // Widget _buildItemsDataTable(List<Map<String, dynamic>> _products) {
  //   final columns = ['S.No. / Name', 'Item', 'Qty', 'Rate', 'Amount'];
  //   return DataTable(
  //     columnSpacing: 24.0,
  //     dataRowHeight: 56.0,
  //     columns: _getColumns(columns),
  //     rows: _getRows(_products),
  //   );
  // }

  // List<DataColumn> _getColumns(List<String> columns) => columns
  //     .map(
  //       (String column) => DataColumn(
  //         label: Text(
  //           column,
  //           style: const TextStyle(fontWeight: FontWeight.bold),
  //         ),
  //       ),
  //     )
  //     .toList();

  // List<DataRow> _getRows(List<Map<String, dynamic>> _products) => _products
  //     .map((product) => DataRow(cells: _getProductCells(product)))
  //     .toList();

  // List<DataCell> _getProductCells(Map<String, dynamic> product) {}
}
