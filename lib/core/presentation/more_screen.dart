import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
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
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/initial-data-dump',
                (route) => false,
              );
            },
          ),
        ),
      ),
    );
  }
}
