import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_pos/core/common/data/models/models.dart';
import 'package:mobile_pos/core/common/presentation/bloc/blocs.dart';
import 'package:mobile_pos/core/common/presentation/widget/loading_indicator.dart';
import 'package:mobile_pos/core/common/reducers/list_reducer_models.dart';
import 'package:mobile_pos/core/constants.dart';
import 'package:mobile_pos/core/error/exceptions.dart';
import 'package:mobile_pos/core/network/dio_config.dart';
import 'package:mobile_pos/core/utils/helpers.dart';
import 'package:mobile_pos/database/app_database.dart';
import 'package:mobile_pos/database/customers/customer_dao.dart';
import 'package:mobile_pos/database/daos.dart';
import 'package:mobile_pos/database/invoice/invoice_dao.dart';
import 'package:mobile_pos/database/invoice/product_quantity.dart';
import 'package:mobile_pos/database/product/product_dao.dart';
import 'package:mobile_pos/database/stock/stock_dao.dart';
import 'package:mobile_pos/database/tax/tax_dao.dart';
import 'package:mobile_pos/database/transaction/transaction_dao.dart';
import 'package:mobile_pos/di/injection.dart';
import 'package:mobile_pos/features/billing/data/models/invoice/invoice_model.dart';
import 'package:mobile_pos/features/billing/presentation/pages/customer_screen.dart';
import 'package:mobile_pos/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:mobile_pos/features/dashboard/presentation/pages/dashboard_filters.dart';
import 'package:mobile_pos/features/initial_data_dump/data/datasources/local/initial_data_dump_local_data_source.dart';
import 'package:mobile_pos/features/initial_data_dump/presentation/bloc/blocs.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/utils/shared_prefs.dart';
import '../widgets/sales_charts/sales_chart.dart';

import 'package:string_extensions/string_extensions.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int? _value = 0;

  final List<String> _salesFilterDates = ['MTD', 'YTD'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                UserPrefences().removeUser();
                Navigator.pushNamed(
                  context,
                  '/more',
                );
              },
              icon: const Icon(
                Icons.apps_outlined,
              ),
            ),
          ],
        ),
        title: const Text('Dashboard'),
        centerTitle: true,
        actions: [
          _buildSync(context),
          _buildLogout(context),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // dashboard overview items
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sales overview
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Sales',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        Row(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    _buildTodaysTrans(context),
                                    const SizedBox(width: 6.0),
                                    _buildMonthTrans(context),
                                    const SizedBox(width: 6.0),
                                    _buildYearTrans(context)
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),

                        const SizedBox(height: 12.0),
                        //SalesChart(),
                      ],
                    ),
                  ),
                  // Collections overview
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Collections',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        Row(
                          children: [
                            _buildCollectionMpesaContainer(context),
                            // seperator between the containers
                            const SizedBox(width: 12.0),
                            _buildCollectionChequeContainer(context),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Stock overview
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      width: double.infinity,
                      child: _buildLowStocks(context),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // persistent bottom sheet
          Material(
            elevation: 6,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    child: Column(
                      children: const [
                        Icon(
                          Icons.attach_money_outlined,
                        ),
                        Text('Billing'),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => const CustomerScreen()));
                    },
                  ),
                  InkWell(
                    child: Column(
                      children: const [
                        Icon(
                          Icons.inventory_2_outlined,
                        ),
                        Text('Stock'),
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/stock',
                      );
                    },
                  ),
                  InkWell(
                    child: Column(
                      children: const [
                        Icon(
                          Icons.description_outlined,
                        ),
                        Text('Reports'),
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/reports',
                      );
                    },
                  ),
                  InkWell(
                    child: Column(
                      children: const [
                        Icon(
                          Icons.person_outline,
                        ),
                        Text('Account'),
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/account',
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLogout(BuildContext context) {
    return IconButton(
      onPressed: () {
        deleteProducts(context);
        deleteStocks(context);
        deleteTax(context);
        deleteCustomer(context);
        deleteLocation(context);
        deleteStore(context);
        deleteUser(context);
        removeShared();
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/login',
          (route) => false,
        );
      },
      icon: const Icon(
        Icons.logout_outlined,
      ),
    );
  }

  FutureBuilder<List<StockDataClass>> _buildLowStocks(BuildContext context) {
    final db = Provider.of<StockDao>(context);
    return FutureBuilder(
        future: db.shownSmallStock(),
        builder: (context, AsyncSnapshot<List<StockDataClass>> snapshot) {
          final smallStock = snapshot.data ?? [];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Stock',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12.0),
              Row(
                children: [
                  Icon(
                    Icons.info_outlined,
                    color: Colors.indigo.shade300,
                  ),
                  const SizedBox(width: 6.0),
                  Text(
                    'Low Stock',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              _lowStockTable(smallStock),
            ],
          );
        });
  }

  Widget _lowStockTable(List<StockDataClass> smallStock) {
    if (smallStock.isNotEmpty) {
      return DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'S. No',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Name',
                style: TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            DataColumn(
              label: Text(
                'Qty',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Level',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
          rows: smallStock
              .map(
                (e) => DataRow(
                  cells: <DataCell>[
                    DataCell(Text(e.itemcode)),
                    DataCell(Text(e.itemname)),
                    DataCell(Text(e.transactionQauntity.toString())),
                    const DataCell(
                      Icon(
                        Icons.arrow_downward_outlined,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              )
              .toList());
    } else {
      const Text('Stock Above quantity of 10');
    }
    return const Text('No Stock');
  }

  Widget _buildSync(BuildContext context) {
    return IconButton(
        onPressed: () async {
          try {
            await sendInvoiceData(context);
            await sendTransactionData(context);
            await deleteStocks(context).then((value) => _updateStocks());

            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      'Sync State',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    content: Text(
                      'Sync Completed Successfully',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context, 'OK');
                          },
                          child: Text('OK'))
                    ],
                  );
                });
          } catch (e) {
            await sendTransactionData(context);
            await deleteStocks(context).then((value) async {
              await _updateStocks();
            });

            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      'Sync State',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    content: Text(
                      'Sync Completed Successfully',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context, 'OK');
                          },
                          child: Text('OK'))
                    ],
                  );
                });
          }
        },
        icon: const Icon(Icons.replay_outlined));
  }

  Future _updateStocks() async {
    BlocProvider(
        create: (context) =>
            getIt<InitialStockLoadBloc>()..add(StockDownloadButtonPressed()));

    getIt<InitialStockLoadBloc>().add(StockDownloadButtonPressed());
  }
  // FutureBuilder<List<InvoiceDataClass>> _buildSync(BuildContext context) {
  //   final db = Provider.of<InvoiceDao>(context);
  //   return FutureBuilder(
  //       future: db.getInvoices(),
  //       builder: (context, AsyncSnapshot<List<InvoiceDataClass>> snapshot) {
  //         final invoices = snapshot.data ?? [];

  //         return IconButton(
  //             onPressed: () async {
  //               var dio = Dio();
  //               Response response;
  //               SharedPreferences _shared;
  //               _shared = await SharedPreferences.getInstance();
  //               var _token = _shared.getString('token');

  //               response = await dio.post(BASE_URL + '/api/invoice',
  //                   data: invoices,
  //                   options: Options(headers: {
  //                     HttpHeaders.contentTypeHeader: 'application/json',
  //                     HttpHeaders.authorizationHeader:
  //                         'Token ${_token.toString()}',
  //                   }));
  //               print(response);
  //             },
  //             icon: const Icon(Icons.replay_outlined));
  //       });
  // }

  StreamBuilder<List<TransactionDataClass>> _buildCollectionMpesaContainer(
      BuildContext context) {
    final transactions = Provider.of<TransactionDao>(context);

    return StreamBuilder(
        stream: transactions.getMpesaTransactions(),
        builder: (context, AsyncSnapshot<List<TransactionDataClass>> snapshot) {
          final payE = snapshot.data ?? [];
          double sum = 0;
          for (int i = 0; i < payE.length; i++) {
            double oTotal = payE[i].total;
            sum += oTotal;
          }
          String type = 'mpesa';
          return SizedBox(
            height: 100,
            child: Ink(
              decoration: BoxDecoration(
                color: const Color(0xff6d95c9),
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: Text(
                          NumberFormat.currency(
                            locale: 'en',
                            name: 'Ksh. ',
                            decimalDigits: 2,
                          ).format(sum),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        type.capitalize()!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => FilterScreen()),
                      (route) => false);
                },
              ),
            ),
          );
        });
  }

  StreamBuilder<List<TransactionDataClass>> _buildCollectionChequeContainer(
      BuildContext context) {
    final transactions = Provider.of<TransactionDao>(context);

    return StreamBuilder(
        stream: transactions.getChequeTransactions(),
        builder: (context, AsyncSnapshot<List<TransactionDataClass>> snapshot) {
          final payE = snapshot.data ?? [];
          double sum = 0;
          for (int i = 0; i < payE.length; i++) {
            double oTotal = payE[i].total;
            sum += oTotal;
          }
          String type = 'cheque';
          return SizedBox(
            height: 100,
            child: Ink(
              decoration: BoxDecoration(
                color: const Color(0xff6d95c9),
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        NumberFormat.currency(
                          locale: 'en',
                          name: 'Ksh. ',
                          decimalDigits: 2,
                        ).format(sum),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        type.capitalize()!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => FilterScreen()),
                      (route) => false);
                },
              ),
            ),
          );
        });
  }

  FutureBuilder<List<TransactionDataClass>> _buildTodaysTrans(
      BuildContext context) {
    final db = Provider.of<TransactionDao>(context);
    int now = DateTime.now().day;

    return FutureBuilder(
        future: db.getTodayTrans(now),
        builder: (context, AsyncSnapshot<List<TransactionDataClass>> snapshot) {
          final leoTrans = snapshot.data ?? [];
          double sum = 0;
          String filterType = 'today';

          for (int i = 0; i < leoTrans.length; i++) {
            double total = leoTrans[i].total;

            sum += total;
          }
          return SizedBox(
            height: 80,
            width: MediaQuery.of(context).size.width * 0.3,
            child: Ink(
              decoration: BoxDecoration(
                color: const Color(0xff6d95c9),
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Text(
                        NumberFormat.currency(
                          locale: 'en',
                          name: 'Ksh. ',
                          decimalDigits: 2,
                        ).format(sum),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    Text(
                      filterType.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => FilterScreen()),
                      (route) => false);
                },
              ),
            ),
          );
        });
  }

  FutureBuilder<List<TransactionDataClass>> _buildMonthTrans(
      BuildContext context) {
    final db = Provider.of<TransactionDao>(context);
    int now = DateTime.now().month;

    return FutureBuilder(
        future: db.getTodayTrans(now),
        builder: (context, AsyncSnapshot<List<TransactionDataClass>> snapshot) {
          final leoTrans = snapshot.data ?? [];
          double sum = 0;
          String filterType = 'month';

          for (int i = 0; i < leoTrans.length; i++) {
            double total = leoTrans[i].total;

            sum += total;
          }
          return SizedBox(
            height: 80,
            child: Ink(
              decoration: BoxDecoration(
                color: const Color(0xff6d95c9),
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Text(
                        NumberFormat.currency(
                          locale: 'en',
                          name: 'Ksh. ',
                          decimalDigits: 2,
                        ).format(sum),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    Text(
                      filterType.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => FilterScreen()),
                      (route) => false);
                },
              ),
            ),
          );
        });
  }

  FutureBuilder<List<TransactionDataClass>> _buildYearTrans(
      BuildContext context) {
    final db = Provider.of<TransactionDao>(context);
    int now = DateTime.now().year;

    return FutureBuilder(
        future: db.getTodayTrans(now),
        builder: (context, AsyncSnapshot<List<TransactionDataClass>> snapshot) {
          final leoTrans = snapshot.data ?? [];
          double sum = 0;
          String filterType = 'year';

          for (int i = 0; i < leoTrans.length; i++) {
            double total = leoTrans[i].total;

            sum += total;
          }
          return SizedBox(
            height: 80,
            child: Ink(
              decoration: BoxDecoration(
                color: const Color(0xff6d95c9),
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Text(
                        NumberFormat.currency(
                          locale: 'en',
                          name: 'Ksh. ',
                          decimalDigits: 2,
                        ).format(sum),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    Text(
                      filterType.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => FilterScreen()),
                      (route) => false);
                },
              ),
            ),
          );
        });
  }

  Future<void> deleteProducts(BuildContext context) {
    final products = Provider.of<ProductDao>(context, listen: false);
    return products.deleteAllItems();
  }

  Future<void> deleteStocks(BuildContext context) {
    final products = Provider.of<StockDao>(context, listen: false);
    return products.deleteAllItems();
  }

  Future<void> deleteTax(BuildContext context) {
    final products = Provider.of<TaxDao>(context, listen: false);
    return products.deleteAllItems();
  }

  Future<void> deleteCustomer(BuildContext context) {
    final products = Provider.of<CustomerDao>(context, listen: false);
    return products.deleteCustomer();
  }

  Future<void> deleteLocation(BuildContext context) {
    final products = Provider.of<LocationDao>(context, listen: false);
    return products.deleteLocation();
  }

  Future<void> deleteStore(BuildContext context) {
    final products = Provider.of<StoreDao>(context, listen: false);
    return products.deleteStore();
  }

  Future<void> deleteUser(BuildContext context) {
    final products = Provider.of<UserDao>(context, listen: false);
    return products.deleteUser();
  }

  Future<bool> removeShared() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.remove('token');
  }

  Future sendInvoiceData(BuildContext context) async {
    final db = Provider.of<InvoiceDao>(context, listen: false);
    final invoices = db.getInvoices();
    List<InvoiceDataClass> invoice = await invoices;
    print(invoice);
    var dio = Dio();

    Response response;
    SharedPreferences _shared;
    _shared = await SharedPreferences.getInstance();
    var _token = _shared.getString('token');
    response = await dio.post(BASE_URL + '/api/invoice',
        data: invoice,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Token ${_token.toString()}',
        }));

    print(response);
  }

  Future sendTransactionData(BuildContext context) async {
    var dio = Dio();

    final kdb = Provider.of<TransactionDao>(context, listen: false);

    var transactions = kdb.getTransactions();
    List<TransactionDataClass> transaction = await transactions;
    print(transaction);

    Response response;
    SharedPreferences _shared;
    _shared = await SharedPreferences.getInstance();
    var _token = _shared.getString('token');
    response = await dio.post(BASE_URL + '/api/transaction-detail',
        data: transaction,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Token ${_token.toString()}',
        }));

    print(response);
  }

  Future updateStockAtHand(BuildContext context) async {
    var dio = Dio();

    Response response;
    SharedPreferences _shared;
    _shared = await SharedPreferences.getInstance();
    var _token = _shared.getString('token');
    response = await dio.get(BASE_URL + '/api/transaction-detail',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Token ${_token.toString()}',
        }));
    final stocks = response.data['invoices']
        .map<StockModel>((json) => StockModel.fromJson(json))
        .toList();
    print(response);
    final db = Provider.of<StockDao>(context, listen: false);
    final stockAtHand = db.insertMultipleStock(stocks);
    print(stockAtHand);
  }
}
