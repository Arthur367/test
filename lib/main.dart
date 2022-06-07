import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_pos/database/app_database.dart';
import 'package:mobile_pos/database/stock/stock_dao.dart';

import 'package:mobile_pos/features/billing/presentation/pages/receipts.dart';

import 'package:mobile_pos/features/login/presentation/bloc/login_bloc.dart';
import 'package:mobile_pos/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/presentation/more_screen.dart';
import 'core/theme.dart';
import 'core/utils/shared_prefs.dart';
import 'core/utils/simple_bloc_observer.dart';
import 'di/injection.dart';
import 'features/account/presentation/pages/account_screen.dart';

import 'features/billing/presentation/pages/checkout_screen.dart';
import 'features/dashboard/presentation/pages/dashboard.dart';
import 'features/initial_data_dump/presentation/pages/initial_data_dump_screen.dart';
import 'features/login/presentation/pages/login_screen.dart';

import 'features/stock/presentation/pages/stock_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environment.dev);
  BlocOverrides.runZoned(
    () => runApp(
      MultiProvider(
        providers: [
          Provider(create: (_) => AppDatabase().transactionDao),
          Provider(create: (_) => AppDatabase().invoiceDao),
          Provider(create: (_) => AppDatabase().billingItemDao),
          Provider(create: (_) => AppDatabase().stockDao),
          Provider(create: (_) => AppDatabase().customerDao),
          Provider(create: (_) => AppDatabase().userDao),
          Provider(create: (_) => AppDatabase().locationDao),
          Provider(create: (_) => AppDatabase().storeDao),
          Provider(create: (_) => AppDatabase().productDao),
          Provider(
            create: (_) => AppDatabase().taxDao,
          )
        ],
        child: const MobilePOS(),
      ),
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
          home: WelcomeScreen(),
          routes: {
            '/login': (context) => const LoginScreen(),
            '/initial-data-dump': (context) => const InitialDataDumpScreen(),
            '/dashboard': (context) => const DashboardScreen(),
            '/stock': (context) => const StockScreen(),
            '/reports': (context) => const ReportsScreen(),
            '/more': (context) => const MoreScreen(),
            '/account': (context) => const AccountScreen(),
            '/checkout': (context) => const CheckoutScreen(),
          },
          builder: EasyLoading.init(),
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

        final db = Provider.of<StockDao>(context);

        Future<List<StockDataClass>> initialDataLoaded =
            Future.value(db.selectAllStock());

        initialDataLoaded.then((value) {
          /// Initial data is loaded
          if (value.isNotEmpty) {
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
      return LoginScreen();
    });
  }
}
