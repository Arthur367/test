import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_pos/database/app_database.dart';
import 'package:mobile_pos/database/user/user_dao.dart';
import 'package:mobile_pos/features/dashboard/presentation/pages/dashboard.dart';
import 'package:mobile_pos/features/login/presentation/pages/login_screen.dart';
import 'package:mobile_pos/main.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      await getUserDirection(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            Container(
              height: 400,
              width: 600,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/app_splash.png'),
                    fit: BoxFit.fill),
              ),
            ),
            Text(
              'Mobile_pos',
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

Future getUserDirection(BuildContext context) async {
  final db = Provider.of<UserDao>(context, listen: false);
  Future<List<UserDataClass>> user = await Future.value(db.getUser());
  user.then((value) {
    if (value.isNotEmpty) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const DashboardScreen()));
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const App()));
    }
  });
}
