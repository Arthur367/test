import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pos/features/dashboard/presentation/widgets/filter_details.dart';

class FilterScreen extends StatefulWidget {
  FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: (() {
            Navigator.pushNamedAndRemoveUntil(
                context, '/dashboard', (route) => false);
          }),
        ),
        title: Text(
          'Filter Details',
          style: GoogleFonts.ubuntu(
              textStyle: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white)),
        ),
        centerTitle: true,
      ),
      body: FilterDetails(),
    );
  }
}
