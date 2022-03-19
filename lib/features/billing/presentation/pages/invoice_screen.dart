import 'package:flutter/material.dart';
import 'package:mobile_pos/features/billing/presentation/widgets/invoice/folder_clipped.dart';

class InvoiceScreen extends StatefulWidget {
  InvoiceScreen({Key? key}) : super(key: key);

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/dashboard',
              (route) => false,
            );
          },
        ),
        title: const Text('Invoice OverView'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        ],
      ),
      body: ClipPath(
        clipper: FolderClipper(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color(0xFFEAE7EA),
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //invoice header;
              PhysicalModel(
                color: Colors.white,
                elevation: 32,
                shadowColor: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),

                  //Invoice Content Here
                ),
              ),
              const Expanded(
                child: SizedBox.shrink(),
              ),

              //Invoice ActionButton Here
            ],
          ),
        ),
      ),
    );
  }
}
