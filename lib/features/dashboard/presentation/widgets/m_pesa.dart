import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_pos/database/app_database.dart';
import 'package:mobile_pos/database/invoice/invoice_dao.dart';
import 'package:mobile_pos/database/transaction/transactioned_items.dart';

class BuildMpesa extends StatelessWidget {
  const BuildMpesa({
    Key? key,
    required this.db,
  }) : super(key: key);

  final InvoiceDao db;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: db.getTransaction('M-Pesa'),
        builder: ((context, AsyncSnapshot<List<TransactionItems>> snapshot) {
          final invoice = snapshot.data ?? [];
          double sum = 0;
          double sumItems = 0;
          String store = '';
          String location = '';
          for (int i = 0; i < invoice.length; i++) {
            double item = invoice[i].invoices.total;
            double avail = invoice[i].invoices.quantity;
            sum += item;
            sumItems += avail;
            store = invoice[i].invoices.storecode;
            location = invoice[i].invoices.locationCode;
          }
          return Column(
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromARGB(87, 37, 102, 155),
                  ),
                  child: Column(children: [
                    Row(
                      children: [
                        Text(
                          'Mpesa',
                          style: GoogleFonts.ubuntu(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              store,
                              style: GoogleFonts.ubuntu(
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600),
                            )),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              location,
                              style: GoogleFonts.ubuntu(
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600),
                            )),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              sumItems.toString(),
                              style: GoogleFonts.ubuntu(
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600),
                            )),
                      ],
                    ),
                    Divider(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              'Ksh ' '$sum',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: invoice.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Card(
                          child: ListTile(
                            title: Text(
                              invoice[index].stocks.itemname,
                              style: GoogleFonts.ubuntu(),
                            ),
                            subtitle: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Unit Price',
                                        style: GoogleFonts.ubuntu(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        invoice[index].stocks.rate.toString(),
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Units Sold',
                                        style: GoogleFonts.ubuntu(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        invoice[index]
                                            .invoices
                                            .quantity
                                            .toString(),
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Total',
                                        style: GoogleFonts.ubuntu(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        invoice[index]
                                            .invoices
                                            .total
                                            .toString(),
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Payment Method',
                                        style: GoogleFonts.ubuntu(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        invoice[index]
                                            .transactions
                                            .paymentMethod,
                                        style: GoogleFonts.ubuntu(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  }),
            ],
          );
        }));
  }
}