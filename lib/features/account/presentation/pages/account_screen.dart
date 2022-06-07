import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_pos/database/daos.dart';
import 'package:mobile_pos/di/injection.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/shared_prefs.dart';
import '../../../../database/app_database.dart';
import '../../../login/data/models/user_model.dart';
import '../bloc/account_bloc.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              UserPrefences().removeUser();
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: BlocBuilder<AccountBloc, AccountState>(
          bloc: getIt<AccountBloc>()..add(AccountEventFetch()),
          builder: (context, state) {
            if (state is AccountLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is AccountLoaded) {
              return _buildAccount(state.account);
            }
            return const Center(
              child: Text('Something went wrong'),
            );
          }),
    );
  }

  Widget _buildAccount(UserDataClass user) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Text(
          user.name,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person_outline),
            const SizedBox(width: 8.0),
            Text(
              user.username,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        const SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.email_outlined),
            const SizedBox(width: 8.0),
            Text(
              user.useremail,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on_outlined),
            const SizedBox(width: 8.0),
            _buildLocation(context)
          ],
        )
      ],
    ));
  }

  FutureBuilder _buildLocation(BuildContext context) {
    final db = Provider.of<LocationDao>(context, listen: false);
    return FutureBuilder(
        future: db.getLocation(),
        builder: (context, snapshot) {
          List<LocationDataClass> location = snapshot.data ?? [];

          String locationl = '';
          for (int i = 0; i < location.length; i++) {
            String locationY = location[i].locationName;
            locationl = locationY;
          }
          return Text(
            locationl,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
            ),
          );
        });
  }
}
