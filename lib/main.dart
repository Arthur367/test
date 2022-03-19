import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/database/app_database.dart';
import 'package:mobile_pos/database/daos.dart';
import 'package:mobile_pos/database/user/user_dao.dart';
import 'package:mobile_pos/features/billing/presentation/pages/receipts.dart';
import 'package:mobile_pos/features/billing/presentation/widgets/invoice/invoice.dart';
import 'package:mobile_pos/features/login/data/datasources/local/user_local.dart';
import 'package:mobile_pos/features/login/presentation/bloc/login_bloc.dart';
import 'package:provider/provider.dart';

import 'core/presentation/more_screen.dart';
import 'core/theme.dart';
import 'core/utils/shared_prefs.dart';
import 'core/utils/simple_bloc_observer.dart';
import 'di/injection.dart';
import 'features/account/presentation/pages/account_screen.dart';
import 'features/billing/presentation/pages/add_item_screen.dart';
import 'features/billing/presentation/pages/billing_screen.dart';
import 'features/billing/presentation/pages/checkout_screen.dart';
import 'features/dashboard/presentation/pages/dashboard.dart';
import 'features/initial_data_dump/presentation/pages/initial_data_dump_screen.dart';
import 'features/login/presentation/pages/login_screen.dart';
import 'features/reports/presentation/pages/reports_screen.dart';
import 'features/stock/presentation/pages/stock_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environment.dev);
  BlocOverrides.runZoned(
    () => runApp(
      Provider(create: (_) => AppDatabase(), child: const MobilePOS()),
    ),
    blocObserver: SimpleBlocObserver(),
  );
}

class MobilePOS extends StatefulWidget {
  const MobilePOS({Key? key}) : super(key: key);

  @override
  State<MobilePOS> createState() => _MobilePOSState();
}

class _MobilePOSState extends State<MobilePOS> {
  _MobilePOSState();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => getIt<LoginBloc>()..add(const CheckUserEvent()),
        child: MaterialApp(
          title: 'Mobile POS',
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          home: const App(),
          routes: {
            '/login': (context) => const LoginScreen(),
            '/initial-data-dump': (context) => const InitialDataDumpScreen(),
            '/dashboard': (context) => const DashboardScreen(),
            '/billing': (context) => const BillingScreen(),
            '/stock': (context) => const StockScreen(),
            '/reports': (context) => const ReportsScreen(),
            '/more': (context) => const MoreScreen(),
            '/account': (context) => const AccountScreen(),
            '/add-billing-item': (context) => const AddItemScreen(),
            '/checkout': (context) => const CheckoutScreen(),
            // '/invoice': (context) => const InvoiceScreen(),
          },
        ));
  }
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      if (state is LoginSuccess) {
        /// login was a success.
        ///
        /// check if initial Data Loaded has initial data loaded.
        Future<bool?> initialDataLoaded =
            Future.value(UserPrefences().initialDataLoaded());

        initialDataLoaded.then((value) {
          /// Initial data is loaded
          if (value != null && value) {
            return Navigator.pushNamedAndRemoveUntil(
              context,
              '/dashboard',
              (route) => false,
            );
          }

          UserPrefences().setInitialDataLoaded(false);

          /// initialdata resolved with false/null
          return Navigator.pushNamedAndRemoveUntil(
            context,
            '/initial-data-dump',
            (route) => false,
          );
        });
      }
      if (state is LoginLoading) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      return const LoginScreen();
    });
  }
}
