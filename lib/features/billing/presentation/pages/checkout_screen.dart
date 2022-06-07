import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:mobile_pos/core/common/data/models/models.dart';
import 'package:mobile_pos/core/common/presentation/widget/loading_indicator.dart';
import 'package:mobile_pos/core/common/reducers/list_reducer.dart';
import 'package:mobile_pos/core/constants.dart';
import 'package:mobile_pos/database/app_database.dart';
import 'package:mobile_pos/database/daos.dart';
import 'package:mobile_pos/database/product_stock/product_with_stock.dart';
import 'package:mobile_pos/database/user/user_dao.dart';
import 'package:mobile_pos/features/billing/domain/entities/billing_item_entity.dart';

import 'package:mobile_pos/features/billing/presentation/widgets/billing/billing_total.dart';
import 'package:provider/provider.dart';
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
  int? _selectedPaymentMethodIndex = 0;

  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _customerEmailController =
      TextEditingController();
  final TextEditingController _customerPhoneController =
      TextEditingController();
  final TextEditingController _customerPaymentMethod = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String payment = 'Cheque';
  String payment2 = 'M-Pesa';
  String payment3 = '';
  late String payment4;
  late String payComp;
  var color2 = Colors.grey[600];
  var color1 = Colors.grey[600];
  var color3 = Colors.white;
  var color4 = Colors.white;
  var colorPayment = Colors.blue[300];
  var colorCheque = Colors.brown[500];
  var mpesaIcon = Icon(Icons.check);
  var chequeIcon = Icon(Icons.check);
  var icon1 = '';
  var icon2 = '';
  List<String> paymentMethod = ['M-Pesa', 'Cheque'];

  @override
  void dispose() {
    super.dispose();
  }

  void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
    //..customAnimation = CustomAnimation();
  }

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
              storecode: e.value.stock.storecode,
            ))
        .toList();
    {
      String emailValid =
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
      String phone = r'(^(?:[+0]10)?[0-9]{10,12}$)';
      final c = getTotals(productWithStock, billingItems);
      RegExp regExp = RegExp(emailValid);
      RegExp phoneReg = RegExp(phone);

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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter customer email';
                    } else if (!regExp.hasMatch(value)) {
                      return 'Invalid Email Address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12.0),
                TextFormField(
                  controller: _customerPhoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Phone'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Phone Number';
                    } else if (!phoneReg.hasMatch(value)) {
                      return 'Invalid Phone Number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12.0),
                // TextFormField(
                //   controller: _customerPaymentMethod,
                //   decoration: const InputDecoration(
                //     border: OutlineInputBorder(),
                //     label: Text('Payment'),
                //   ),
                // ),
                const Divider(),
                const SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Wrap(children: [
                        Text(
                          'Payment Method',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 50.0,
                              width: 70.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: color1),
                                onPressed: () async {
                                  if (_customerPhoneController.text.isEmpty ||
                                      _customerNameController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Please enter a phone No. and name')),
                                    );
                                  } else {
                                    setState(() {
                                      color1 = colorPayment!;
                                      color2 = color4;
                                      payment3 = '';
                                    });
                                    await getMpesaTransaction(
                                            productWithStock, billingItems)
                                        .then((value) async {
                                      EasyLoading.show(
                                          status:
                                              'Dont close app. Mpesa Transaction...');
                                      getMpesaResponse();
                                      EasyLoading.dismiss();
                                    });
                                  }
                                },
                                child: Text('M-Pesa',
                                    style:
                                        Theme.of(context).textTheme.bodyText2),
                              ),
                            ),

                            Container(
                              height: 50.0,
                              width: 70.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: color2),
                                onPressed: () {
                                  setState(() {
                                    payment3 = payment;
                                    color2 = colorCheque!;
                                    color1 = color4;
                                    payComp = 'true';
                                  });
                                  print(payment3);
                                  print(payComp);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Cheque Selected as Payment Method')),
                                  );
                                },
                                child: Text('Cheque',
                                    style:
                                        Theme.of(context).textTheme.bodyText2),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(bottom: 8.0),
                            //   child: Wrap(
                            //     spacing: 8.0,
                            //     children: List.generate(
                            //         paymentMethod.length,
                            //         (index) => ActionChip(
                            //             backgroundColor: color4,
                            //             pressElevation: 13,
                            //             avatar: CircleAvatar(
                            //               backgroundColor:
                            //                   Colors.grey.shade800,
                            //               child: const Icon(Icons.check),
                            //             ),
                            //             label: Text(paymentMethod[index]),
                            //             onPressed: () async {})).toList(),
                            //   ),
                            // ),
                          ],
                        ),
                      ]),
                    ),
                    const SizedBox(height: 12.0),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          onPressed: () async {
                            //Process Payment first then deduct from stock

                            if (_formKey.currentState!.validate()) {
                              if (payment3.isEmpty || payment3 == '') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Please Choose a Payment Method to procced')),
                                );
                              } else {
                                final transactionId = const Uuid().v1();
                                final invoiceid = const Uuid().v4();
                                double avaliQty = 0;
                                final c =
                                    getTotals(productWithStock, billingItems);
                                for (int i = 0; i < stockModel.length; i++) {
                                  var quantity =
                                      stockModel[i].transactionQuantity;
                                  avaliQty = quantity;
                                }

                                final invoices = billingItems
                                    .map((e) => InvoiceDataClass(
                                        id: 0,
                                        invoicenumber: invoiceid,
                                        total: c['total']!,
                                        tax: c['tax']!,
                                        subtotal: c['subtotal']!,
                                        customerId: e.customerId,
                                        productId: e.stockItemId,
                                        quantity: e.quantity,
                                        price: e.unitPrice,
                                        invoiceId: invoiceid,
                                        productCode: e.stockItemCode,
                                        createdAt: DateTime.now(),
                                        locationCode: e.locationCode,
                                        storecode: e.storecode,
                                        availQty: avaliQty,
                                        taxPct: c['taxPct']!))
                                    .toList();
                                String customer = '';
                                String locationCode = '';
                                String storecode = '';

                                for (int i = 0; i < billingItems.length; i++) {
                                  var customerN = billingItems[i].customerId;
                                  customer = customerN;
                                  var locationN = billingItems[i].locationCode;
                                  locationCode = locationN;
                                  var storeCode = billingItems[i].storecode;
                                  storecode = storeCode;
                                }
                                final transactionClass = TransactionDataClass(
                                  id: 0,
                                  transactionId: transactionId,
                                  total: c['total']!,
                                  tax: c['tax']!,
                                  subtotal: c['subtotal']!,
                                  customerId: customer,
                                  invoiceId: invoiceid,
                                  customerEmail: _customerEmailController.text,
                                  customerName: _customerNameController.text,
                                  customerPhone:
                                      int.parse(_customerPhoneController.text),
                                  paymentMethod: payment3,
                                  payComp: payComp,
                                  createdAt: DateTime.now(),
                                  locationCode: locationCode,
                                  storecode: storecode,
                                );

                                print(invoices);
                                getIt<BillingItemsBloc>().add(
                                    CheckoutBillingItemsEvent(
                                        transaction: transactionClass,
                                        invoices: invoices));

                                getIt<StockItemBloc>().add(
                                    UpdateStockItemEvent(stock: stockModel));

                                getIt<BillingItemsBloc>()
                                    .add(RemoveBillingItemsEvent());
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/dashboard', (route) => false);
                              }
                            } else {
                              const Text('Error');
                            }
                          },
                          child: const Text(
                            'Process Transaction',
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
                          )),
                    )
                  ],
                ),
              ]),
            ),
          ]),
        ),
      );
    }
  }

  FutureOr<void> getMpesaResponse() async {
    Response response2;
    var dio = Dio();

    try {
      response2 = await dio.get(BASE_URL + '/api/m/pay/callback',
          options: Options(
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json',
              HttpHeaders.authorizationHeader:
                  'Token 50ecf5eb5902ae3d3b79afc7c23fcece821cc92c',
            },
          ));
      print(response2);
      if (response2.statusCode == 200 || response2.statusCode == 201) {
        payment4 = 'paid';

        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Payment Completed'),
                content: Text(
                    'Mpesa Transaction was completed successfully. Paid By ${_customerNameController.text} from ${_customerPhoneController.text}'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              );
            });
      } else {
        payment4 = 'not paid';
      }
    } on DioError catch (e) {
      payment4 = 'not paid';

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Payment Issue'),
              content: Text(
                  'Mpesa Transaction was completed unsuccessfully. Paid By ${_customerNameController.text} from ${_customerPhoneController.text} '
                  'Please Choose another Payment Option or Check if Phone Number is Correct'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            );
          });
    }
    print(payment4);
    if (payment4 == 'paid') {
      payment3 = 'M-Pesa';
      payComp = 'true';
    } else {
      payment3 = '';
      payComp = 'false';
    }
    print(payment3);
    print(payComp);
  }

  Future getMpesaTransaction(List<ProductWithStock> productWithStock,
      List<BillingItemEntity> billingItems) async {
    Response response;
    var dio = Dio();

    final c = getTotals(productWithStock, billingItems);
    try {
      response = await dio.get(BASE_URL + '/api/m/pay/get-stk',
          options: Options(
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json',
              HttpHeaders.authorizationHeader:
                  'Token 50ecf5eb5902ae3d3b79afc7c23fcece821cc92c',
              'phone': _customerPhoneController.text,
              'name': _customerNameController.text,
              'amount': c['total']
            },
          ));

      print(response);
    } on DioError catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Payment Issue'),
              content: const Text(
                  'Mpesa has some issues at the moment.Please choose another payment option'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            );
          });
    }
  }
}
