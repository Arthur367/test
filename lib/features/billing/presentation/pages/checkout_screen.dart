import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_pos/core/common/data/models/models.dart';
import 'package:mobile_pos/core/common/presentation/widget/loading_indicator.dart';
import 'package:mobile_pos/core/common/reducers/list_reducer.dart';
import 'package:mobile_pos/database/app_database.dart';
import 'package:mobile_pos/database/product_stock/product_with_stock.dart';
import 'package:mobile_pos/features/billing/domain/entities/billing_item_entity.dart';

import 'package:mobile_pos/features/billing/presentation/widgets/billing/billing_total.dart';
import 'package:uuid/uuid.dart';

import '../../../../di/injection.dart';
import '../bloc/blocs.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({
    Key? key,
  }) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  List<String> selectedItem = [];

  int? _selectedPaymentMethodIndex = 0;

  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _customerEmailController =
      TextEditingController();
  final TextEditingController _customerPhoneController =
      TextEditingController();
  final TextEditingController _customerPaymentMethod = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<BillingItemsBloc>()..add(GetBillingItemsEvent()),
      child: BlocBuilder<BillingItemsBloc, BillingItemsState>(
          builder: (context, state) {
        if (state is BillingItemsError) {
          return const Center(
            child: Text('Failed to load.'),
          );
        }
        if (state is BillingItemsLoaded) {
          final result =
              getTotals(state.billingItems, state.billingItemsEntity);
          return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: const Text(
                  'Checkout',
                ),
                centerTitle: true,
                elevation: 0,
              ),
              body: _buildCheckoutScreen(
                  result, state.billingItems, state.billingItemsEntity),
              bottomSheet: const BillingTotal(
                isCheckout: true,
              ));
        }
        return const LoadingIndicator();
      }),
    );
  }

  Widget _buildCheckoutScreen(
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
            transactionQuantity_: e.value.stock.transactionQauntity,
            cumulativeQuantity_: e.value.stock.cumulativeQauntity,
            createdAt_: e.value.stock.createdAt,
            updatedAt_: DateTime.now(),
            masterRate_: e.value.stock.masterRate,
            itemcode: e.value.stock.itemcode,
            itemname: e.value.stock.itemname,
            description: e.value.stock.description,
            batchnumber: e.value.stock.batchnumber,
            rate_: e.value.stock.rate,
            availableQuantity:
                e.value.stock.availableQuantity - billingItems[e.key].quantity,
            totalprice_: e.value.stock.totalprice,
            closing_: e.value.stock.closing))
        .toList();
    {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Customer Details',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(children: [
                TextFormField(
                  controller: _customerNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Customer Name'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter customer';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12.0),
                TextFormField(
                  controller: _customerEmailController,
                  keyboardType: TextInputType.streetAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Customer Email'),
                  ),
                  onFieldSubmitted: (value) {},
                ),
                const SizedBox(height: 12.0),
                TextFormField(
                  controller: _customerPhoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Phone'),
                  ),
                ),
                const SizedBox(height: 12.0),
                TextFormField(
                  controller: _customerPaymentMethod,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Payment'),
                  ),
                ),
                const Divider(),
                const SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Input Payment Method',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),

                    //Payment Method Button Code.
                    //Change setState to enable to  store view payment method.
                    // Padding(
                    //   padding: const EdgeInsets.only(bottom: 8.0),
                    //   child: Wrap(
                    //     spacing: 8.0,
                    //     children: [
                    //       TextFormField(
                    //         controller: _customerPaymentMethod,
                    //         keyboardType: TextInputType.text,
                    //         decoration: const InputDecoration(
                    //           border: OutlineInputBorder(),
                    //           label: Text('Payment Method'),
                    //         ),
                    //       ),
                    //     ],
                    // children: List.generate(
                    //   paymentMethod.length,
                    //   (index) => ChoiceChip(
                    //     label: Text(
                    //       paymentMethod[index],
                    //       style: TextStyle(
                    //         color: _selectedPaymentMethodIndex == index
                    //             ? Colors.white
                    //             : Theme.of(context)
                    //                 .colorScheme
                    //                 .secondary,
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 16.0,
                    //       ),
                    //     ),
                    //     padding: const EdgeInsets.symmetric(
                    //       horizontal: 16.0,
                    //       vertical: 12.0,
                    //     ),
                    //     selected: _selectedPaymentMethodIndex == index,
                    //     selectedColor: Theme.of(context).primaryColor,
                    //     onSelected: (bool selected) {
                    //       setState(() {
                    //         _selectedPaymentMethodIndex = index;
                    //         if (_selectedPaymentMethodIndex == 1) {
                    //         } else {}
                    //       });
                    //     },
                    //     pressElevation: 0,
                    //   ),
                    // ).toList(),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(height: 12.0),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          //Process Payment first then deduct from stock

                          final transactionId = const Uuid().v1();
                          final customerId = const Uuid().v1();
                          final invoiceid = const Uuid().v1();

                          final c = getTotals(productWithStock, billingItems);

                          final invoices = billingItems
                              .map((e) => InvoiceDataClass(
                                  id: 0,
                                  invoicenumber: invoiceid,
                                  total: c['total']!,
                                  tax: c['tax']!,
                                  subtotal: c['subtotal']!,
                                  customerId: customerId,
                                  productId: e.stockItemId,
                                  quantity: e.quantity,
                                  price: e.unitPrice,
                                  invoiceId: invoiceid,
                                  productCode: e.stockItemCode,
                                  createdAt: DateTime.now()))
                              .toList();

                          final transactionDataClass = TransactionClass(
                              id: 0,
                              transactionId: transactionId,
                              total: c['total']!,
                              tax: c['tax']!,
                              subtotal: c['subtotal']!,
                              customerId: customerId,
                              invoiceId: invoiceid,
                              customerEmail: _customerNameController.text,
                              customerName: _customerNameController.text,
                              customerPhone:
                                  int.parse(_customerPhoneController.text),
                              paymentMethod: _customerPaymentMethod.text);

                          print(invoices);
                          getIt<BillingItemsBloc>().add(
                              CheckoutBillingItemsEvent(
                                  transaction: transactionDataClass,
                                  invoices: invoices));

                          getIt<StockItemBloc>()
                              .add(UpdateStockItemEvent(stock: stockModel));

                          getIt<BillingItemsBloc>()
                              .add(RemoveBillingItemsEvent());

                          Navigator.pushNamedAndRemoveUntil(
                              context, '/dashboard', (route) => false);
                        },
                        child: const Text(
                          'Process Pay',
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
                    ),
                  ],
                ),
              ]),
            ),
          ]),
        ),
      );
    }
  }
}
