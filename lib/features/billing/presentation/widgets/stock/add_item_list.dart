import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_pos/core/common/presentation/bloc/blocs.dart';
import 'package:mobile_pos/di/injection.dart';
import 'package:mobile_pos/features/billing/presentation/bloc/blocs.dart';

import 'stock_item.dart';

class AddItemList extends StatefulWidget {
  const AddItemList({Key? key}) : super(key: key);

  @override
  _AddItemListState createState() => _AddItemListState();
}

class _AddItemListState extends State<AddItemList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StockBloc, StockState>(
      builder: (context, state) {
        if (state is StockError) {
          return const Center(child: Text('Failed to load.'));
        }
        if (state is StockLoaded) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                Row(
                  children: const [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Avail. Qty.',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Rate',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.stock.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return BlocProvider(
                        create: (context) => getIt<StockItemBloc>()
                          ..add(
                            StockItemLoadedEvent(
                                stockItemId: state.stock[index].id!),
                          ),
                        child: StockItem(item: state.stock[index]),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
