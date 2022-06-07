import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pos/database/app_database.dart';
import 'package:mobile_pos/database/invoice/invoice_dao.dart';
import 'package:mobile_pos/database/transaction/transactioned_items.dart';
import 'package:mobile_pos/features/dashboard/presentation/widgets/all.dart';
import 'package:mobile_pos/features/dashboard/presentation/widgets/cheque.dart';
import 'package:mobile_pos/features/dashboard/presentation/widgets/m_pesa.dart';
import 'package:mobile_pos/features/dashboard/presentation/widgets/month.dart';
import 'package:mobile_pos/features/dashboard/presentation/widgets/today.dart';
import 'package:mobile_pos/features/dashboard/presentation/widgets/year.dart';
import 'package:provider/provider.dart';

class FilterDetails extends StatefulWidget {
  const FilterDetails({Key? key}) : super(key: key);

  @override
  _FilterDetailsState createState() => _FilterDetailsState();
}

int? _value = 0;

class _FilterDetailsState extends State<FilterDetails> {
  static List<String> getFilters = [
    'All',
    'Today',
    'Month',
    'Year',
    'M-Pesa',
    'Cheque'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 4,
                children: List<Widget>.generate(
                  getFilters.length,
                  (int index) {
                    return ChoiceChip(
                      label:
                          Text(getFilters[index], style: GoogleFonts.ubuntu()),
                      selected: _value == index,
                      onSelected: (bool selected) {
                        setState(() {
                          _value = selected ? index : null;
                        });
                      },
                    );
                  },
                ).toList(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(children: [
                  _buildFilterItems(),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFilterItems() {
    if (_value == 0) {
      final db = Provider.of<InvoiceDao>(context);
      return BuildAll(db: db);
    } else if (_value == 1) {
      final db = Provider.of<InvoiceDao>(context);
      return BuildToday(db: db);
    } else if (_value == 2) {
      final db = Provider.of<InvoiceDao>(context);
      return BuildMonth(db: db);
    } else if (_value == 3) {
      final db = Provider.of<InvoiceDao>(context);
      return BuildYear(db: db);
    } else if (_value == 4) {
      final db = Provider.of<InvoiceDao>(context);
      return BuildMpesa(db: db);
    } else if (_value == 5) {
      final db = Provider.of<InvoiceDao>(context);
      return BuildCheque(db: db);
    }
    return Text(
      'No data',
      style: GoogleFonts.ubuntu(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}
