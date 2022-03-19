import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:mobile_pos/core/common/presentation/widget/loading_indicator.dart';
import 'package:mobile_pos/core/utils/helpers.dart';
import 'package:mobile_pos/features/billing/domain/entities/billing_item_entity.dart';

import 'package:mobile_pos/features/billing/presentation/bloc/blocs.dart';

import 'package:mobile_pos/features/billing/presentation/widgets/billing/debouncer.dart';

class BillingTrial extends StatefulWidget {
  const BillingTrial({
    Key? key,
  }) : super(key: key);

  @override
  State<BillingTrial> createState() => _BillingTrialState();
}

class _BillingTrialState extends State<BillingTrial> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    late final _debouncer = Debouncer(milliseconds: 500);
    return BlocBuilder<BillingItemsBloc, BillingItemsState>(
      builder: (context, state) {
        if (state is BillingItemsError) {
          return const Center(
            child: Text('Failed to load.'),
          );
        }
        if (state is BillingItemsLoaded) {
          final items = state.billingItems;
          int quantity = 1;
          return Container(
            padding: EdgeInsets.all(8),
            child: items.isNotEmpty
                ? ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: Text(items[index].stock.itemname),
                              trailing: IconButton(
                                  onPressed: () {
                                    context
                                        .read<BillingItemsBloc>()
                                        .add(ClearBillingItemEvent(
                                          billingItem: BillingItemEntity(
                                              stockItemId:
                                                  items[index].product.id,
                                              unitPrice: items[index]
                                                  .product
                                                  .costPrice,
                                              taxRate: items[index].product.tax,
                                              quantity: quantity.toDouble(),
                                              stockItemCode:
                                                  items[index].stock.itemcode,
                                              availableQuantity: items[index]
                                                  .stock
                                                  .availableQuantity,
                                              selected: true),
                                        ));
                                  },
                                  icon: const Icon(Icons.delete)),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Available Qty: ',
                                    ),
                                    Text(
                                      items[index]
                                          .stock
                                          .availableQuantity
                                          .toString(),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'Rate:  Ksh ',
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                        locale: 'en',
                                        name: '',
                                        decimalDigits: 2,
                                      ).format(items[index].stock.masterRate),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: TextField(
                                          controller: _controller,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                          keyboardType: TextInputType.number,
                                          onSubmitted: (value) {
                                            items[index]
                                                        .stock
                                                        .availableQuantity <
                                                    int.parse(value)
                                                ? ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                    const SnackBar(
                                                        content: Text(
                                                            'Quantity is not available')),
                                                  )
                                                : context
                                                    .read<BillingItemsBloc>()
                                                    .add(UpdateBillingItemEvent(
                                                      billingItem: BillingItemEntity(
                                                          stockItemId: items[
                                                                  index]
                                                              .product
                                                              .id,
                                                          unitPrice: items[
                                                                  index]
                                                              .product
                                                              .costPrice,
                                                          taxRate: items[index]
                                                              .product
                                                              .tax,
                                                          quantity:
                                                              StringToIntOrDouble
                                                                  .stringToDouble(
                                                                      value)!,
                                                          stockItemCode:
                                                              items[index]
                                                                  .stock
                                                                  .itemcode,
                                                          availableQuantity: items[
                                                                  index]
                                                              .stock
                                                              .availableQuantity,
                                                          selected: true),
                                                    ));
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    })
                : const Center(
                    child: Text('No items added.'),
                  ),
          );
        }
        return const LoadingIndicator();
      },
    );
  }
}
