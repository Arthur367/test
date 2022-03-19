import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_pos/core/common/domain/entities/entities.dart';
import 'package:mobile_pos/core/common/presentation/bloc/blocs.dart';

class AddItemTrial extends StatefulWidget {
  const AddItemTrial({Key? key}) : super(key: key);

  @override
  _AddItemTrialState createState() => _AddItemTrialState();
}

class _AddItemTrialState extends State<AddItemTrial> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StockBloc, StockState>(builder: (context, state) {
      if (state is StockError) {
        return const Center(child: Text('Failed to Load'));
      }
      if (state is StockLoaded) {
        final stockItems = state.stock;

        return SingleChildScrollView(
          child: DataTable(
              columnSpacing: 30.0,
              dataRowHeight: 46.0,
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'Name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Avail. Qty',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Rate',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
              rows: stockItems
                  .map<DataRow>(
                    (e) => DataRow(cells: [
                      DataCell(
                        Text(e.itemname),
                      ),
                      DataCell(Text(e.availableQuantity.toString())),
                      DataCell(Text(e.rate.toString()))
                    ]),
                  )
                  .toList()),
        );
      }

      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
