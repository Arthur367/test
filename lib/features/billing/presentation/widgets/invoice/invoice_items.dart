import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_pos/core/utils/helpers.dart';
import 'package:mobile_pos/database/app_database.dart';
import 'package:mobile_pos/database/daos.dart';
import 'package:mobile_pos/database/invoice/invoice_dao.dart';
import 'package:mobile_pos/database/transaction/transaction_dao.dart';
import 'package:mobile_pos/database/transaction/transactioned_items.dart';
import 'package:mobile_pos/features/billing/domain/entities/billing_item_entity.dart';
import 'package:mobile_pos/features/billing/domain/entities/invoice_entity.dart';
import 'package:mobile_pos/features/billing/domain/entities/transactions_entity.dart';
import 'package:mobile_pos/features/billing/presentation/bloc/blocs.dart';
import 'package:mobile_pos/features/billing/presentation/pages/receipts.dart';
import 'package:mobile_pos/features/billing/presentation/widgets/invoice/folder_clipped.dart';
import 'package:mobile_pos/features/billing/presentation/widgets/invoice/invoice_clipped.dart';
import 'package:mobile_pos/features/billing/presentation/widgets/invoice/pdf/model/customer.dart';
import 'package:mobile_pos/features/billing/presentation/widgets/invoice/pdf/model/invoice.dart';
import 'package:mobile_pos/features/billing/presentation/widgets/invoice/pdf/model/supplier.dart';
import 'package:mobile_pos/features/billing/presentation/widgets/invoice/pdf/pdf_api.dart';
import 'package:mobile_pos/features/billing/presentation/widgets/invoice/pdf/pdf_invoice.dart';
import 'package:provider/provider.dart';

Color defaultColor = Color(0XFFDCA583);

class InvoiceItems extends StatefulWidget {
  final TransactionDataClass transactions;
  const InvoiceItems({
    required this.transactions,
    Key? key,
  }) : super(key: key);

  @override
  State<InvoiceItems> createState() => _InvoiceItemsState();
}

class _InvoiceItemsState extends State<InvoiceItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const ReportsScreen()));
          },
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Align(
              alignment: Alignment.center,
              child: Text('Invoice',
                  style: TextStyle(
                    color: Colors.black,
                  )),
            ),
          ],
        ),
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
              //Invoice Header Here
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(Icons.file_copy),
                                  Text('Invoice Details',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(
                                            color: defaultColor,
                                          )),
                                ])
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              PhysicalModel(
                  color: Colors.white,
                  elevation: 32,
                  shadowColor: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),

                    // Invoice Content Here

                    child: (BuildContext context) {
                      var defaltColor;
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipPath(
                            clipper: InvoiceContentClipper(),
                            child: Container(
                              color: Colors.white,
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text('Invoice for:  ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2),
                                      Text(
                                        widget.transactions.customerName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                              color: Colors.purple,
                                            ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Client's Email: ",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Container(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                widget
                                                    .transactions.customerEmail,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .copyWith(
                                                        color: defaultColor),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: .5,
                                        color: Colors.black38,
                                        height: 24,
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.centerRight,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text('Invoice Date',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                Utils.formatDate(widget
                                                    .transactions.createdAt),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .copyWith(
                                                        color: defaultColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  //Bought Items List

                                  Container(
                                    width: double.infinity,
                                    height: .5,
                                    color: Colors.black38,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 24),
                                  ),

                                  Container(
                                    height: 250,
                                    child: SingleChildScrollView(
                                      child: Column(children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "items",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption,
                                            ),
                                          ],
                                        ),
                                        _buildContent(context),
                                      ]),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: .5,
                                    color: Colors.black38,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 24),
                                  ),

                                  //Ivoice Summary Here

                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'SubTotal',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .copyWith(
                                                      color: defaultColor,
                                                    ),
                                              ),
                                              Container(
                                                width: 100,
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text(
                                                  NumberFormat.currency(
                                                          locale: 'en',
                                                          name: '',
                                                          symbol: 'Ksh ',
                                                          decimalDigits: 2)
                                                      .format(widget
                                                          .transactions
                                                          .subtotal),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                        color: defaultColor,
                                                      ),
                                                ),
                                              ),
                                            ]),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Tax",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .copyWith(
                                                      color: defaultColor,
                                                    ),
                                              ),
                                              Container(
                                                width: 100,
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text(
                                                  NumberFormat.currency(
                                                          locale: 'en',
                                                          name: '',
                                                          symbol: 'Ksh ',
                                                          decimalDigits: 2)
                                                      .format(widget
                                                          .transactions.tax),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                        color: defaultColor,
                                                      ),
                                                ),
                                              ),
                                            ]),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "Total",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .copyWith(
                                                      color: defaultColor,
                                                    ),
                                              ),
                                              Container(
                                                width: 150,
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Text(
                                                  NumberFormat.currency(
                                                    locale: 'en',
                                                    name: '',
                                                    symbol: 'Ksh',
                                                    decimalDigits: 2,
                                                  ).format(widget
                                                      .transactions.total),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                          color: defaultColor,
                                                          fontSize: 16),
                                                  overflow:
                                                      TextOverflow.visible,
                                                ),
                                              ),
                                            ]),
                                      ]),
                                  Container(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Payment Method: ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1,
                                            ),
                                            Text(
                                              widget.transactions.paymentMethod,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    }(context),
                  )),
              const Expanded(
                child: SizedBox.shrink(),
              ),

              // Invoice ActionButton Here

              Row(
                children: [
                  Expanded(
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/dashboard', (route) => false);
                      },
                      icon: Icon(
                        Icons.cancel_outlined,
                        color: defaultColor,
                      ),
                      label: const Text('Cancel',
                          style: TextStyle(color: Colors.purple)),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.amber,
                        child: TextButton.icon(
                          onPressed: () async {
                            await getInvoicePdf(context);
                          },
                          icon: Icon(
                            Icons.send_rounded,
                            color: defaultColor,
                          ),
                          label: Text(
                            'Send',
                            style: TextStyle(color: defaultColor),
                          ),
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder _buildContent(BuildContext context) {
    final query = Provider.of<InvoiceDao>(context);
    return FutureBuilder<List<TransactionItems>>(
        future: query.getItems(widget.transactions.invoiceId),
        builder: (context, AsyncSnapshot<List<TransactionItems>> snapshot) {
          final items = snapshot.data ?? [];
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: items.length,
                itemBuilder: (_, index) {
                  return Card(
                    child: ListTile(
                      tileColor: Colors.blueAccent[100],
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text('Product Name: ',
                                  style: Theme.of(context).textTheme.bodyText1),
                            ],
                          ),
                          Row(
                            children: [
                              FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  items[index].stocks.itemname.toLowerCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  overflow: null,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      subtitle: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Price: ',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Text(NumberFormat.currency(
                                name: '',
                                locale: 'en',
                                symbol: 'ksh ',
                                decimalDigits: 2,
                              ).format(items[index].stocks.rate))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Quantity: ',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Text(NumberFormat.compact(
                                locale: 'en',
                              ).format(items[index].invoices.quantity))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Tax: ',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Text(NumberFormat.percentPattern()
                                  .format(items[index].invoices.taxPct))
                            ],
                          )
                        ],
                      ),
                    ),

                    // child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text(
                    //         items[index].stocks.itemname,
                    //         style:
                    //             Theme.of(context).textTheme.bodyText1!.copyWith(
                    //                   color: Colors.black54,
                    //                 ),
                    //       ),
                    //       Container(
                    //         width: 100,
                    //         child: Text(
                    //           items[index].stocks.masterRate.toString(),
                    //           style: Theme.of(context)
                    //               .textTheme
                    //               .bodyText1!
                    //               .copyWith(
                    //                 color: defaultColor,
                    //               ),
                    //         ),
                    //       ),
                    //     ]),
                  );
                },
              ),
            ],
          );
        });
  }

  Future getInvoicePdf(BuildContext context) async {
    final InvoicesDB = Provider.of<InvoiceDao>(context, listen: false);
    final item = InvoicesDB.getItems(widget.transactions.invoiceId);
    final locationDB = Provider.of<LocationDao>(context, listen: false);
    final locationItem = locationDB.getLocation();
    final storeDB = Provider.of<StoreDao>(context, listen: false);
    final storeItem = storeDB.getStore();
    final userDb = Provider.of<UserDao>(context, listen: false);
    final userItems = userDb.getUser();
    List<UserDataClass> user = await userItems;
    List<TransactionItems> invoices = await item;
    List<LocationDataClass> location = await locationItem;
    List<StoreDataClass> store = await storeItem;
    String supplierN = '';
    String supplierL = '';
    String supplierS = '';
    for (int i = 0; i < user.length; i++) {
      String userN = user[i].name;
      supplierN = userN;
    }
    for (int i = 0; i < location.length; i++) {
      String locationL = location[i].locationName;
      supplierL = locationL;
    }
    for (int i = 0; i < store.length; i++) {
      String userS = store[i].storeName;
      supplierS = userS;
    }
    final invoice = Invoice(
      info: InvoiceInfo(
        number: widget.transactions.invoiceId,
        date: widget.transactions.createdAt,
      ),
      customer: Customer(
        name: widget.transactions.customerName,
        address: widget.transactions.customerEmail,
      ),
      items: invoices
          .map((e) => InvoiceItem(
              name: e.stocks.itemname,
              date: e.invoices.createdAt,
              quantity: e.invoices.quantity.toInt(),
              vat: e.invoices.taxPct,
              unitPrice: e.stocks.rate,
              total: e.stocks.masterRate))
          .toList(),
      total: InvoiceTotal(
          subTotal: widget.transactions.subtotal,
          tax: widget.transactions.tax,
          total: widget.transactions.total),
      payment: Payment(name: widget.transactions.paymentMethod),
      supplier: Supplier(name: supplierN, address: supplierL, store: supplierS),
    );
    final pdfFile = await PdfInvoiceApi.generate(invoice);
    return PdfApi.openFile(pdfFile);
  }
}
