import 'dart:ffi';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_pos/core/common/presentation/widget/loading_indicator.dart';
import 'package:mobile_pos/core/utils/helpers.dart';
import 'package:mobile_pos/database/app_database.dart';
import 'package:mobile_pos/database/product_stock/product_with_stock.dart';
import 'package:mobile_pos/features/billing/domain/entities/billing_item_entity.dart';
import 'package:mobile_pos/features/billing/presentation/bloc/blocs.dart';
import 'package:mobile_pos/features/billing/presentation/pages/billing_screen.dart';
import 'package:mobile_pos/features/billing/presentation/widgets/billing/debouncer.dart';

class BillingItemsList extends StatefulWidget {
  const BillingItemsList({
    Key? key,
  }) : super(key: key);

  @override
  State<BillingItemsList> createState() => _BillingItemsListState();
}

class _BillingItemsListState extends State<BillingItemsList> {
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
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: items.isNotEmpty
                ? SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                      columnSpacing: 22.0,
                      dataRowHeight: 56.0,
                      showBottomBorder: true,
                      showCheckboxColumn: true,
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Name',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            semanticsLabel: 'Name',
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Qty',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            semanticsLabel: 'Quantity Buying',
                          ),
                          numeric: true,
                        ),
                        DataColumn(
                          label: Text(
                            'Avail.Qty',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            semanticsLabel: 'Available Quantity',
                          ),
                          numeric: true,
                        ),
                        DataColumn(
                          label: Text(
                            'Rate',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            semanticsLabel: 'Rate Price',
                          ),
                          numeric: true,
                        ),
                        DataColumn(
                            label: Text(
                          'Delete',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          semanticsLabel: 'Delete',
                        ))
                      ],
                      rows: items
                          .asMap()
                          .entries
                          .map(
                            (e) => DataRow(
                              cells: <DataCell>[
                                DataCell(
                                  Text(
                                    e.value.product.productName,
                                  ),
                                ),
                                DataCell(
                                  Row(
                                    children: [
                                      SizedBox(
                                          child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  context
                                                      .read<BillingItemsBloc>()
                                                      .add(UpdateBillingItemEvent(
                                                          billingItem: BillingItemEntity(
                                                              stockItemId: e
                                                                  .value
                                                                  .product
                                                                  .id,
                                                              unitPrice: e
                                                                  .value
                                                                  .product
                                                                  .costPrice,
                                                              taxRate: e.value
                                                                  .product.tax,
                                                              quantity: state
                                                                      .billingItemsEntity[
                                                                          e.key]
                                                                      .quantity +
                                                                  1,
                                                              stockItemCode: e
                                                                  .value
                                                                  .stock
                                                                  .itemcode,
                                                              availableQuantity: e
                                                                  .value
                                                                  .stock
                                                                  .availableQuantity,
                                                              selected: true)));
                                                });
                                              },
                                              icon: const Icon(Icons.add))),
                                      Expanded(
                                        child: TextFormField(
                                          initialValue: quantity.toString(),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                          keyboardType: TextInputType.number,
                                          onFieldSubmitted: (val) {
                                            e.value.stock.availableQuantity <
                                                    int.parse(val)
                                                ? ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                    const SnackBar(
                                                        content: Text(
                                                            'Quantity is not available')),
                                                  )
                                                : context
                                                    .read<BillingItemsBloc>()
                                                    .add(
                                                        UpdateBillingItemsEvent(
                                                      billingItem: BillingItemEntity(
                                                          stockItemId: e
                                                              .value.product.id,
                                                          unitPrice: e.value.product
                                                              .costPrice,
                                                          taxRate: e.value.product
                                                              .tax,
                                                          quantity:
                                                              StringToIntOrDouble
                                                                  .stringToDouble(
                                                                      val)!,
                                                          stockItemCode:
                                                              e.value.stock
                                                                  .itemcode,
                                                          availableQuantity: e
                                                              .value
                                                              .stock
                                                              .availableQuantity,
                                                          selected: true),
                                                    ));
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                if (state
                                                        .billingItemsEntity[
                                                            e.key]
                                                        .quantity >
                                                    1) {
                                                  context
                                                      .read<BillingItemsBloc>()
                                                      .add(UpdateBillingItemEvent(
                                                          billingItem: BillingItemEntity(
                                                              stockItemId: e
                                                                  .value
                                                                  .product
                                                                  .id,
                                                              unitPrice: e
                                                                  .value
                                                                  .product
                                                                  .costPrice,
                                                              taxRate: e.value
                                                                  .product.tax,
                                                              quantity: state
                                                                      .billingItemsEntity[
                                                                          e.key]
                                                                      .quantity -
                                                                  1,
                                                              stockItemCode: e
                                                                  .value
                                                                  .stock
                                                                  .itemcode,
                                                              availableQuantity: e
                                                                  .value
                                                                  .stock
                                                                  .availableQuantity,
                                                              selected: true)));
                                                } else {
                                                  context
                                                      .read<BillingItemsBloc>()
                                                      .add(UpdateBillingItemEvent(
                                                          billingItem: BillingItemEntity(
                                                              stockItemId: e
                                                                  .value
                                                                  .product
                                                                  .id,
                                                              unitPrice: e
                                                                  .value
                                                                  .product
                                                                  .costPrice,
                                                              taxRate: e.value
                                                                  .product.tax,
                                                              quantity: state
                                                                  .billingItemsEntity[
                                                                      e.key]
                                                                  .quantity,
                                                              stockItemCode: e
                                                                  .value
                                                                  .stock
                                                                  .itemcode,
                                                              availableQuantity: e
                                                                  .value
                                                                  .stock
                                                                  .availableQuantity,
                                                              selected: true)));
                                                }
                                              });
                                            },
                                            icon: const Icon(Icons.remove)),
                                      )
                                    ],
                                  ),
                                  showEditIcon: false,
                                ),
                                DataCell(Text(e.value.stock.availableQuantity
                                    .toString())),
                                DataCell(
                                  Text(
                                    NumberFormat.currency(
                                      locale: 'en',
                                      name: '',
                                      decimalDigits: 2,
                                    ).format(e.value.stock.masterRate),
                                  ),
                                ),
                                DataCell(const Icon(Icons.delete), onTap: () {
                                  context
                                      .read<BillingItemsBloc>()
                                      .add(ClearBillingItemEvent(
                                        billingItem: BillingItemEntity(
                                            stockItemId: e.value.product.id,
                                            unitPrice:
                                                e.value.product.costPrice,
                                            taxRate: e.value.product.tax,
                                            quantity: state
                                                .billingItemsEntity[e.key]
                                                .quantity,
                                            stockItemCode:
                                                e.value.stock.itemcode,
                                            availableQuantity:
                                                e.value.stock.availableQuantity,
                                            selected: true),
                                      ));
                                })
                              ],
                            ),
                          )
                          .toList(),
                    ),
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
}
