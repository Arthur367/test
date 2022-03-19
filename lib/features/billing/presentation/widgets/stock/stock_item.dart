import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_pos/core/common/domain/entities/stock/stock_entity.dart';
import 'package:mobile_pos/core/common/presentation/widget/loading_indicator.dart';
import 'package:mobile_pos/features/billing/presentation/bloc/blocs.dart';

class StockItem extends StatelessWidget {
  final StockEntity item;

  const StockItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: _buildCheckbox(),
        ),
        Expanded(
          flex: 2,
          child: Text(
            item.itemname,
            style: const TextStyle(
              fontSize: 10.0,
            ),
            maxLines: 3,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(item.availableQuantity.toString()),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              NumberFormat.currency(
                locale: 'en',
                name: '',
                decimalDigits: 2,
              ).format(item.masterRate),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCheckbox() {
    return BlocBuilder<StockItemBloc, StockItemState>(
      builder: (context, state) {
        if (state is StockItemLoaded) {
          return Checkbox(
            value: state.selected,
            onChanged: (bool? value) {
              context.read<StockItemBloc>().add(
                    StockItemCheckBoxTappedEvent(
                      stockItemId: item.id!,
                      stockItemPrice: item.masterRate,
                      taxRate: item.rate,
                      selected: !value!,
                      stockItemCode: item.itemcode,
                      availableQuantity: item.availableQuantity!,
                    ),
                  );
            },
          );
        }
        return const LoadingIndicator();
      },
    );
  }
}
