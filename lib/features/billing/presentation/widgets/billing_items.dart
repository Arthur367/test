import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_pos/core/common/presentation/widget/loading_indicator.dart';
import 'package:mobile_pos/database/app_database.dart';
import 'package:mobile_pos/features/billing/domain/entities/billing_item_entity.dart';

import '../../../../core/common/domain/entities/entities.dart';
import '../bloc/blocs.dart';

class BillingItem extends StatelessWidget {
  final BillingItemEntity items;
  final StockDataClass stock;

  const BillingItem({
    Key? key,
    required this.items,
    required this.stock,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillingItemsBloc, BillingItemsState>(
        builder: (context, state) {
      if (state is BillingItemsError) {
        return const Center(
          child: Text('Failed to load.'),
        );
      }
      if (state is BillingItemsLoaded) {
        return Row(
          children: [
            Expanded(
              flex: 1,
              child: _buildCheckbox(),
            ),
            Expanded(
              flex: 1,
              child: Text(
                stock.itemname,
                style: const TextStyle(
                  fontSize: 10.0,
                ),
                maxLines: 3,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(stock.availableQuantity.toString()),
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
                  ).format(items.unitPrice),
                ),
              ),
            ),
          ],
        );
      }
      return const LoadingIndicator();
    });
    //
  }

  Widget _buildCheckbox() {
    bool selected = false;
    return BlocBuilder<BillingItemsBloc, BillingItemsState>(
      builder: (context, state) {
        if (state is BillingItemsLoaded) {
          return Checkbox(
            value: selected,
            onChanged: (bool? value) {
              context.read<BillingItemsBloc>().add(
                    GetBillingItemsEvent(),
                  );
            },
          );
        }
        return const LoadingIndicator();
      },
    );
  }
}
