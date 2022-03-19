import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/utils/shared_prefs.dart';
import '../widgets/sales_charts/sales_chart.dart';

import 'package:string_extensions/string_extensions.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int? _value = 0;

  final List<String> _salesFilterDates = ['Today', 'MTD', 'YTD'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
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
        title: const Text('Dashboard'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
            icon: const Icon(
              Icons.logout_outlined,
            ),
          ),
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
                    padding: const EdgeInsets.all(16.0),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        Wrap(
                          spacing: 12.0,
                          runSpacing: 8.0,
                          children: List<Widget>.generate(
                            3,
                            (int index) {
                              return _buildSalesContainer(
                                filterType: _salesFilterDates[index],
                                amount: 54647,
                              );
                            },
                          ).toList(),
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
                            _buildCollectionTypeContainer(
                              type: 'mpesa',
                              amount: 233454,
                            ),
                            // seperator between the containers
                            const SizedBox(width: 16.0),
                            _buildCollectionTypeContainer(
                              type: 'cheque',
                              amount: 839748,
                            ),
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
                      child: Column(
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
                          DataTable(
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
                            rows: const <DataRow>[
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('24363526')),
                                  DataCell(Text('Simba Cement')),
                                  DataCell(Text('4')),
                                  DataCell(
                                    Icon(
                                      Icons.arrow_downward_outlined,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('24363526')),
                                  DataCell(Text('Simba Cement')),
                                  DataCell(Text('4')),
                                  DataCell(
                                    Icon(
                                      Icons.arrow_downward_outlined,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
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
                      Navigator.pushNamed(
                        context,
                        '/billing',
                      );
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

  Widget _buildCollectionTypeContainer({String? type, double? amount}) {
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
                ).format(amount),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                type!.capitalize()!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          onTap: () {},
        ),
      ),
    );
  }

  Widget _buildSalesContainer({String? filterType, double? amount}) {
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
              Text(
                NumberFormat.currency(
                  locale: 'en',
                  name: 'Ksh. ',
                  decimalDigits: 2,
                ).format(amount),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                filterType!.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
