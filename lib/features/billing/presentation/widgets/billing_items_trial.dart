import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:mobile_pos/core/common/presentation/widget/loading_indicator.dart';
import 'package:mobile_pos/core/utils/helpers.dart';
import 'package:mobile_pos/database/app_database.dart';
import 'package:mobile_pos/database/product_stock/product_with_stock.dart';
import 'package:mobile_pos/features/billing/domain/entities/billing_item_entity.dart';

import 'package:mobile_pos/features/billing/presentation/bloc/blocs.dart';

import 'package:mobile_pos/features/billing/presentation/widgets/billing/debouncer.dart';

class BillingTrial extends StatefulWidget {
  final CustomerClass customer;
  const BillingTrial({Key? key, required this.customer}) : super(key: key);

  @override
  State<BillingTrial> createState() => _BillingTrialState();
}

class _BillingTrialState extends State<BillingTrial> {
  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    for (TextEditingController c in _controllers) {
      c.addListener(() {
        _printLatestValue();
      });
    }
  }

  void _printLatestValue() {
    for (TextEditingController c in _controllers) {
      print(c.text);
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    for (TextEditingController c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  final List<TextEditingController> _controllers = [];
  final quantKey = GlobalKey<FormState>();
  bool quantAval = false;

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
          final items = state.billingItems;
          double quantity = 1.0;

          return Container(
            height: 600,
            padding: const EdgeInsets.all(8),
            child: items.isNotEmpty
                ? Form(
                    key: quantKey,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          _controllers.add(TextEditingController());

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
                                                taxRate:
                                                    items[index].product.tax,
                                                quantity: quantity.toDouble(),
                                                stockItemCode:
                                                    items[index].stock.itemcode,
                                                transactionQuantity:
                                                    items[index]
                                                        .stock
                                                        .transactionQauntity,
                                                selected: true,
                                                locationCode: items[index]
                                                    .stock
                                                    .locationCode,
                                                storecode: items[index]
                                                    .stock
                                                    .storecode,
                                                customerId:
                                                    widget.customer.customerId,
                                              ),
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
                                              .transactionQauntity
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
                                          ).format(items[index].stock.rate),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                height: 50.0,
                                                width: 50.0,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: Colors.blueAccent),
                                                child: IconButton(
                                                  icon:
                                                      const Icon(Icons.remove),
                                                  onPressed: () {
                                                    setState(() {
                                                      int dc = state
                                                          .billingItemsEntity[
                                                              index]
                                                          .quantity
                                                          .toInt();
                                                      if (dc > 1) {
                                                        _controllers[index]
                                                                .text =
                                                            state
                                                                .billingItemsEntity[
                                                                    index]
                                                                .quantity
                                                                .toString();
                                                        context
                                                            .read<
                                                                BillingItemsBloc>()
                                                            .add(
                                                                UpdateBillingItemEvent(
                                                              billingItem: BillingItemEntity(
                                                                  stockItemId:
                                                                      items[index]
                                                                          .product
                                                                          .id,
                                                                  unitPrice:
                                                                      items[index]
                                                                          .product
                                                                          .costPrice,
                                                                  taxRate: items[
                                                                          index]
                                                                      .product
                                                                      .tax,
                                                                  quantity:
                                                                      double.parse(_controllers[index].text) -
                                                                          1,
                                                                  stockItemCode:
                                                                      items[index]
                                                                          .stock
                                                                          .itemcode,
                                                                  transactionQuantity:
                                                                      items[index]
                                                                          .stock
                                                                          .transactionQauntity,
                                                                  selected:
                                                                      true,
                                                                  locationCode:
                                                                      items[index]
                                                                          .stock
                                                                          .locationCode,
                                                                  storecode:
                                                                      items[index]
                                                                          .stock
                                                                          .storecode,
                                                                  customerId: widget
                                                                      .customer
                                                                      .customerId),
                                                            ));
                                                      } else {
                                                        _controllers[index]
                                                                .text =
                                                            state
                                                                .billingItemsEntity[
                                                                    index]
                                                                .quantity
                                                                .toString();
                                                        context
                                                            .read<
                                                                BillingItemsBloc>()
                                                            .add(
                                                                UpdateBillingItemEvent(
                                                              billingItem: BillingItemEntity(
                                                                  stockItemId:
                                                                      items[index]
                                                                          .product
                                                                          .id,
                                                                  unitPrice: items[index]
                                                                      .product
                                                                      .costPrice,
                                                                  taxRate: items[index]
                                                                      .product
                                                                      .tax,
                                                                  quantity: double.parse(
                                                                      _controllers[index]
                                                                          .text),
                                                                  stockItemCode:
                                                                      items[index]
                                                                          .stock
                                                                          .itemcode,
                                                                  transactionQuantity:
                                                                      items[index]
                                                                          .stock
                                                                          .transactionQauntity,
                                                                  selected:
                                                                      true,
                                                                  locationCode:
                                                                      items[index]
                                                                          .stock
                                                                          .locationCode,
                                                                  storecode: items[
                                                                          index]
                                                                      .stock
                                                                      .storecode,
                                                                  customerId: widget
                                                                      .customer
                                                                      .customerId),
                                                            ));
                                                      }
                                                    });
                                                  },
                                                ),
                                              ),
                                              Container(
                                                height: 50.0,
                                                width: 50.0,
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: Colors.grey[100]),
                                                child: _buildOnSubmitt(
                                                    items, index, context),
                                              ),
                                              Container(
                                                height: 50.0,
                                                width: 50.0,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: Colors.grey[200]),
                                                child: IconButton(
                                                  icon: const Icon(Icons.add),
                                                  onPressed: () {
                                                    setState(() {
                                                      _controllers[index].text =
                                                          state
                                                              .billingItemsEntity[
                                                                  index]
                                                              .quantity
                                                              .toString();
                                                      context
                                                          .read<
                                                              BillingItemsBloc>()
                                                          .add(
                                                              UpdateBillingItemEvent(
                                                            billingItem:
                                                                BillingItemEntity(
                                                              stockItemId:
                                                                  items[index]
                                                                      .product
                                                                      .id,
                                                              unitPrice: items[
                                                                      index]
                                                                  .product
                                                                  .costPrice,
                                                              taxRate:
                                                                  items[index]
                                                                      .product
                                                                      .tax,
                                                              quantity: double.parse(
                                                                      _controllers[
                                                                              index]
                                                                          .text) +
                                                                  1,
                                                              stockItemCode:
                                                                  items[index]
                                                                      .stock
                                                                      .itemcode,
                                                              transactionQuantity:
                                                                  items[index]
                                                                      .stock
                                                                      .transactionQauntity,
                                                              selected: true,
                                                              locationCode: items[
                                                                      index]
                                                                  .stock
                                                                  .locationCode,
                                                              storecode: items[
                                                                      index]
                                                                  .stock
                                                                  .storecode,
                                                              customerId: widget
                                                                  .customer
                                                                  .customerId,
                                                            ),
                                                          ));
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  )
                : const Center(
                    child: Text('No items added.'),
                  ),
          );
        }
        return const LoadingIndicator();
      },
    );
  }

  TextFormField _buildOnSubmitt(
      List<ProductWithStock> items, int index, BuildContext context) {
    return TextFormField(
      key: ObjectKey(items[index]),
      controller: _controllers[index],
      autofocus: false,
      decoration: const InputDecoration(
        border: InputBorder.none,
        errorText: '',
      ),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      onFieldSubmitted: (value) {
        value = _controllers[index].text;
        if (double.parse(value) <= items[index].stock.transactionQauntity) {
          context.read<BillingItemsBloc>().add(UpdateBillingItemsEvent(
                billingItem: BillingItemEntity(
                    stockItemId: items[index].product.id,
                    unitPrice: items[index].product.costPrice,
                    taxRate: items[index].product.tax,
                    quantity: StringToIntOrDouble.stringToDouble(value)!,
                    stockItemCode: items[index].stock.itemcode,
                    transactionQuantity: items[index].stock.transactionQauntity,
                    selected: true,
                    locationCode: items[index].stock.locationCode,
                    storecode: items[index].stock.storecode,
                    customerId: widget.customer.customerId),
              ));
        } else {
          context.read<BillingItemsBloc>().add(UpdateBillingItemsEvent(
                billingItem: BillingItemEntity(
                    stockItemId: items[index].product.id,
                    unitPrice: items[index].product.costPrice,
                    taxRate: items[index].product.tax,
                    quantity: 0.00,
                    stockItemCode: items[index].stock.itemcode,
                    transactionQuantity: items[index].stock.transactionQauntity,
                    selected: true,
                    locationCode: items[index].stock.locationCode,
                    storecode: items[index].stock.storecode,
                    customerId: widget.customer.customerId),
              ));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Quantity exceed max value')),
          );
        }
      },
    );
  }
}
