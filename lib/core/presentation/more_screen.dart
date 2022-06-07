import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:mobile_pos/di/injection.dart';

import '../../database/app_database.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  final db = getIt<AppDatabase>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More Actions'),
        centerTitle: true,
      ),
      body: Container(
        height: 120.0,
        width: 200.0,
        child: Card(
          elevation: 2.0,
          child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(Icons.summarize),
                Text('Data Setup'),
              ],
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DriftDbViewer(db)));
            },
          ),
        ),
      ),
    );
  }
}
