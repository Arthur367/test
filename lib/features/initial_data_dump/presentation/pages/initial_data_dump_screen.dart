import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_pos/features/initial_data_dump/presentation/widgets/customer_downlaod_card.dart';

import '../../../../database/app_database.dart';
import '../../../../di/injection.dart';
import '../bloc/blocs.dart';
import '../widgets/products_download_card.dart';
import '../widgets/stock_download_card.dart';
import '../widgets/vat_tax_download_card.dart';

class InitialDataDumpScreen extends StatefulWidget {
  const InitialDataDumpScreen({Key? key}) : super(key: key);

  @override
  _InitialDataDumpScreenState createState() => _InitialDataDumpScreenState();
}

class _InitialDataDumpScreenState extends State<InitialDataDumpScreen> {
  final db = getIt<AppDatabase>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<InitialStockLoadBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<InitialProductsLoadBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<InitialVatTaxLoadBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<InitialCustomerLoadBloc>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Data Setup'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DriftDbViewer(db)));
              },
              icon: const Icon(
                Icons.dns_outlined,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: const [
              Text(
                'Click on the download icon to download data.',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
              StockDownloadCard(),
              ProductsDownloadCard(),
              VatTaxDownloadCard(),
              CustomerDownloadCard()
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/dashboard', (route) => false);
          },
          child: const Icon(
            Icons.arrow_forward,
          ),
        ),
      ),
    );
  }
}
