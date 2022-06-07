import 'package:flutter/material.dart';
import 'package:mobile_pos/database/app_database.dart';
import 'package:mobile_pos/database/customers/customer_dao.dart';
import 'package:mobile_pos/features/billing/presentation/pages/add_item_screen.dart';
import 'package:mobile_pos/features/billing/presentation/pages/billing_screen.dart';
import 'package:mobile_pos/features/billing/presentation/widgets/stock/add_item_list.dart';
import 'package:mobile_pos/features/dashboard/presentation/pages/dashboard.dart';
import 'package:mobile_pos/features/initial_data_dump/presentation/bloc/initial_customer_load/initial_load_customer_bloc.dart';
import 'package:provider/provider.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<CustomerDao>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => DashboardScreen()));
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('Customer', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                CustomerDownloadButtonPressed();
              },
              icon: const Icon(Icons.replay))
        ],
      ),
      body: _buildBody(context),
    );
  }

  StreamBuilder<List<CustomerClass>> _buildBody(BuildContext context) {
    final db = Provider.of<CustomerDao>(context);
    return StreamBuilder(
        stream: db.getCustomers(),
        builder: (context, AsyncSnapshot<List<CustomerClass>> snapshot) {
          final customers = snapshot.data ?? [];
          return ListView.builder(
              itemCount: customers.length,
              itemBuilder: (_, index) {
                String name = '';
                if (customers[index].customerName.contains('0')) {
                  name = 'Cash Customer';
                } else {
                  name = 'Credit Customer';
                }
                return InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_) =>
                            BillingScreen(customer: customers[index])));
                  },
                  child: ListTile(
                    title: Text(customers[index].customerId),
                    subtitle: Text(name),
                  ),
                );
              });
        });
  }
}
