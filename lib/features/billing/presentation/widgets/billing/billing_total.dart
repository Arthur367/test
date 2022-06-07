import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_pos/core/common/presentation/widget/loading_indicator.dart';
import 'package:mobile_pos/core/common/reducers/list_reducer.dart';
import 'package:mobile_pos/database/app_database.dart';
import 'package:mobile_pos/di/injection.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/common/data/models/stock/stock_model.dart';
import '../../../../../database/product_stock/product_with_stock.dart';
import '../../../domain/entities/billing_item_entity.dart';
import '../../bloc/blocs.dart';

class BillingTotal extends StatefulWidget {
  final bool isCheckout;
  const BillingTotal({Key? key, required this.isCheckout}) : super(key: key);

  @override
  _BillingTotalState createState() => _BillingTotalState();
}

class _BillingTotalState extends State<BillingTotal> {
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
        final result = getTotals(state.billingItems, state.billingItemsEntity);
        final billingItems = state.billingItemsEntity;

        return !widget.isCheckout
            ? _buildTotal(result, billingItems, state.billingItems,
                state.billingItemsEntity)
            : _buildCheckout(
                result, state.billingItems, state.billingItemsEntity);
      }
      return const LoadingIndicator();
    });
  }

//TODO: Refactor this
  Widget _buildCheckout(
      Map<String, double> result,
      List<ProductWithStock> productWithStock,
      List<BillingItemEntity> billingItems) {
    final List<StockModel> stockModel = productWithStock
        .asMap()
        .entries
        .map((e) => StockModel(
            id: e.value.stock.id,
            autoNumber_: e.value.stock.autoNumber,
            transactionDate_: e.value.stock.transactionDate,
            batchQuantity_: e.value.stock.batchQauntity,
            transactionQuantity_: e.value.stock.transactionQauntity -
                billingItems[e.key].quantity,
            cumulativeQuantity_: e.value.stock.cumulativeQauntity,
            createdAt_: e.value.stock.createdAt,
            updatedAt_: DateTime.now(),
            masterRate_: e.value.stock.masterRate,
            itemcode: e.value.stock.itemcode,
            itemname: e.value.stock.itemname,
            description: e.value.stock.description,
            batchnumber: e.value.stock.batchnumber,
            rate_: e.value.stock.rate,
            availableQuantity: e.value.stock.availableQuantity,
            totalprice_: e.value.stock.totalprice,
            closing_: e.value.stock.closing,
            locationCode: e.value.stock.locationCode,
            storecode: e.value.stock.storecode))
        .toList();
    return Material(
      elevation: 4.0,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      NumberFormat.currency(
                        locale: 'en',
                        name: '',
                        decimalDigits: 2,
                      ).format(result['subtotal']),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tax',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      NumberFormat.currency(
                        locale: 'en',
                        name: '',
                        decimalDigits: 2,
                      ).format(result['tax']),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      NumberFormat.currency(
                        locale: 'en',
                        name: '',
                        decimalDigits: 2,
                      ).format(result['total']),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotal(
    Map<String, double> result,
    List<BillingItemEntity> billingItems,
    List<ProductWithStock> items,
    List<BillingItemEntity> billingItemsEntity,
  ) {
    return Material(
      elevation: 6.0,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          NumberFormat.currency(
                            locale: 'en',
                            name: '',
                            decimalDigits: 2,
                          ).format(result['subtotal']),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tax',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          NumberFormat.currency(
                            locale: 'en',
                            name: '',
                            decimalDigits: 2,
                          ).format(result['tax']),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          NumberFormat.currency(
                            locale: 'en',
                            name: '',
                            decimalDigits: 2,
                          ).format(result['total']),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (result['total']! > 0) {
                    late double quantity;
                    late double availableQuantity;
                    for (int i = 0; i < billingItemsEntity.length; i++) {
                      double quant = billingItemsEntity[i].quantity;
                      quantity = quant;
                    }
                    for (int i = 0; i < items.length; i++) {
                      double availQty = items[i].stock.transactionQauntity;
                      availableQuantity = availQty;
                    }
                    if (quantity <= availableQuantity) {
                      Navigator.pushNamed(
                        context,
                        '/checkout',
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Quantity exceed max value')),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No Item Added')),
                    );
                  }
                },
                child: const Text(
                  'Checkout',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 16.0),
                  minimumSize: const Size(48.0, 8.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
