import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/presentation/bloc/blocs.dart';

class StockList extends StatefulWidget {
  const StockList({Key? key}) : super(key: key);

  @override
  _StockListState createState() => _StockListState();
}

class _StockListState extends State<StockList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StockBloc, StockState>(
      builder: (context, state) {
        if (state is StockError) {
          return const Center(child: Text('Failed to load.'));
        }
        if (state is StockLoaded) {
          return SingleChildScrollView(
            padding: const EdgeInsets.only(top: 8.0),
            child: DataTable(
                columnSpacing: 24.0,
                dataRowHeight: 56.0,
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                      semanticsLabel: 'Name',
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Batch Qty.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                      semanticsLabel: 'Batch Quantity',
                    ),
                    numeric: true,
                  ),
                  DataColumn(
                    label: Text(
                      'Avail. Qty',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                      semanticsLabel: 'Available Quantity',
                    ),
                    numeric: true,
                  ),
                ],
                rows: state.stock
                    .map<DataRow>(
                      (e) => DataRow(
                        cells: <DataCell>[
                          DataCell(
                            Text(
                              e.itemname,
                              style: const TextStyle(
                                fontSize: 10.0,
                              ),
                              maxLines: 3,
                            ),
                          ),
                          DataCell(Text(e.batchQuantity.toString())),
                          DataCell(Text(e.transactionQuantity.toString()))
                        ],
                      ),
                    )
                    .toList()),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
