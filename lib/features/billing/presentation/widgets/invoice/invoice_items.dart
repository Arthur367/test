// import 'package:flutter/material.dart';
// import 'package:mobile_pos/features/billing/domain/entities/billing_item_entity.dart';
// import 'package:mobile_pos/features/billing/domain/entities/invoice_entity.dart';
// import 'package:mobile_pos/features/billing/domain/entities/transactions_entity.dart';
// import 'package:mobile_pos/features/billing/presentation/bloc/blocs.dart';
// import 'package:mobile_pos/features/billing/presentation/widgets/invoice/folder_clipped.dart';
// import 'package:mobile_pos/features/billing/presentation/widgets/invoice/invoice_clipped.dart';

// Color defaultColor = Color(0XFFDCA583);

// class InvoiceItems extends StatelessWidget {
//   final BillingItemEntity items;
//   final TransactionEntity transactions;
//   const InvoiceItems(
//       {Key? key, required this.items, required this.transactions})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//             backgroundColor: Colors.blueAccent,
//             appBar: AppBar(
//               elevation: 0,
//               leading: BackButton(
//                 onPressed: () {
//                   Navigator.pushNamedAndRemoveUntil(
//                     context,
//                     '/dashboard',
//                     (route) => false,
//                   );
//                 },
//               ),
//               title: const Text('Invoice OverView'),
//               actions: [
//                 IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
//               ],
//             ),
//             body: ClipPath(
//               clipper: FolderClipper(),
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height,
//                 color: const Color(0xFFEAE7EA),
//                 padding: const EdgeInsets.only(top: 24),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     //Invoice Header Here
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text("Invoice For",
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .bodyText2),
//                                         Text(
//                                           transactions.customerName,
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .headline6!
//                                               .copyWith(
//                                                 color: Colors.purple,
//                                               ),
//                                         )
//                                       ])
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),

//                     PhysicalModel(
//                         color: Colors.white,
//                         elevation: 32,
//                         shadowColor: Colors.black,
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 16.0),

//                           // Invoice Content Here

//                           child: (BuildContext context) {
//                             var defaltColor;
//                             return Column(
//                               children: [
//                                 ClipPath(
//                                   clipper: InvoiceClipper(),
//                                   child: Container(
//                                     color: Color(0XFFDCA583),
//                                     height: 100,
//                                     padding: const EdgeInsets.all(24),
//                                     child: Row(children: [
//                                       const Icon(
//                                         Icons.monetization_on,
//                                         color: Colors.black54,
//                                       ),
//                                       Text('Invoice',
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .headline4),
//                                     ]),
//                                   ),
//                                 ),
//                                 ClipPath(
//                                   clipper: InvoiceContentClipper(),
//                                   child: Container(
//                                     color: Colors.white,
//                                     padding: const EdgeInsets.all(24),
//                                     child: Column(
//                                       children: [
//                                         Row(
//                                           children: [
//                                             const Icon(Icons.file_copy),
//                                             Text("Invoice Details",
//                                                 style: Theme.of(context)
//                                                     .textTheme
//                                                     .headline6!
//                                                     .copyWith(
//                                                       color: defaultColor,
//                                                     )),
//                                           ],
//                                         ),
//                                         SizedBox(height: 12),
//                                         Row(
//                                           children: [
//                                             Expanded(
//                                               child: Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   Text("Client's Email",
//                                                       style: Theme.of(context)
//                                                           .textTheme
//                                                           .caption),
//                                                   const SizedBox(
//                                                     height: 8,
//                                                   ),
//                                                   Text(
//                                                     transactions.customerEmail,
//                                                     style: Theme.of(context)
//                                                         .textTheme
//                                                         .bodyText1!
//                                                         .copyWith(
//                                                             color:
//                                                                 defaultColor),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             Container(
//                                               width: .5,
//                                               color: Colors.black38,
//                                               height: 24,
//                                             ),
//                                             Expanded(
//                                               child: Container(
//                                                 alignment: Alignment.center,
//                                                 child: Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     Text('Invoice Date',
//                                                         style: Theme.of(context)
//                                                             .textTheme
//                                                             .caption),
//                                                     const SizedBox(
//                                                       height: 8,
//                                                     ),
//                                                     Text(
//                                                       "21 August 2021",
//                                                       style: Theme.of(context)
//                                                           .textTheme
//                                                           .bodyText1!
//                                                           .copyWith(
//                                                               color:
//                                                                   defaultColor),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         DataTable(
//                                             columns: <DataColumn>[
//                                               DataColumn(
//                                                 label: Text(
//                                                   'Items',
//                                                   style: Theme.of(context)
//                                                       .textTheme
//                                                       .caption,
//                                                 ),
//                                               ),
//                                               DataColumn(
//                                                   label: Text(
//                                                 'Price',
//                                                 style: Theme.of(context)
//                                                     .textTheme
//                                                     .caption,
//                                               ))
//                                             ],
//                                             rows: items
//                                                 .map((e) =>
//                                                     DataRow(cells: <DataCell>[
//                                                       DataCell(
//                                                         Text(
//                                                           e.stock.itemname,
//                                                           style:
//                                                               Theme.of(context)
//                                                                   .textTheme
//                                                                   .bodyText1!
//                                                                   .copyWith(
//                                                                     color:
//                                                                         defaultColor,
//                                                                   ),
//                                                         ),
//                                                       ),
//                                                       DataCell(
//                                                         Text(
//                                                             NumberFormat.currency(
//                                                                     locale:
//                                                                         'en',
//                                                                     name: '',
//                                                                     decimalDigits:
//                                                                         2)
//                                                                 .format(e.stock
//                                                                     .masterRate),
//                                                             style: Theme.of(
//                                                                     context)
//                                                                 .textTheme
//                                                                 .bodyText1!
//                                                                 .copyWith(
//                                                                   color:
//                                                                       defaultColor,
//                                                                 )),
//                                                       ),
//                                                     ]))
//                                                 .toList()),
//                                         // Container(
//                                         //   width: double.infinity,
//                                         //   height: .5,
//                                         //   color: Colors.black38,
//                                         //   padding: const EdgeInsets.symmetric(
//                                         //       vertical: 24),
//                                         // ),
//                                         // DataTable(
//                                         //     columns: const <DataColumn>[
//                                         //       DataColumn(
//                                         //         label: Text(
//                                         //           'Items',
//                                         //         ),
//                                         //       ),
//                                         //       DataColumn(label: Text('Price'))
//                                         //     ],
//                                         //     rows: items
//                                         //         .map((e) =>
//                                         //             DataRow(cells: <DataCell>[
//                                         //               DataCell(Text(
//                                         //                   e.stock.itemname)),
//                                         //               DataCell(
//                                         //                 Text(
//                                         //                   NumberFormat.currency(
//                                         //                           locale: 'en',
//                                         //                           name: '',
//                                         //                           decimalDigits:
//                                         //                               2)
//                                         //                       .format(e.stock
//                                         //                           .masterRate),
//                                         //                 ),
//                                         //               ),
//                                         //             ]))
//                                         //         .toList()),
//                                         // Column(children: [
//                                         //   Row(
//                                         //     mainAxisAlignment:
//                                         //         MainAxisAlignment.spaceBetween,
//                                         //     children: [
//                                         //       Text(
//                                         //         "items",
//                                         //         style: Theme.of(context)
//                                         //             .textTheme
//                                         //             .caption,
//                                         //       ),
//                                         //       Container(
//                                         //         width: 100,
//                                         //         child: Text(
//                                         //           "Price",
//                                         //           style: Theme.of(context)
//                                         //               .textTheme
//                                         //               .caption,
//                                         //         ),
//                                         //       ),
//                                         //     ],
//                                         //   ),
//                                         //   Row(
//                                         //       mainAxisAlignment:
//                                         //           MainAxisAlignment
//                                         //               .spaceBetween,
//                                         //       children: [
//                                         //         Text(
//                                         //           "Choco Nuts",
//                                         //           style: Theme.of(context)
//                                         //               .textTheme
//                                         //               .bodyText1!
//                                         //               .copyWith(
//                                         //                 color: Colors.black54,
//                                         //               ),
//                                         //         ),
//                                         //         Container(
//                                         //           width: 100,
//                                         //           child: Text(
//                                         //             "4,500",
//                                         //             style: Theme.of(context)
//                                         //                 .textTheme
//                                         //                 .bodyText1!
//                                         //                 .copyWith(
//                                         //                   color: defaultColor,
//                                         //                 ),
//                                         //           ),
//                                         //         ),
//                                         //       ]),
//                                         //   Row(
//                                         //       mainAxisAlignment:
//                                         //           MainAxisAlignment
//                                         //               .spaceBetween,
//                                         //       children: [
//                                         //         Text(
//                                         //           "ChocPuffs CreamyO",
//                                         //           style: Theme.of(context)
//                                         //               .textTheme
//                                         //               .bodyText1,
//                                         //         ),
//                                         //         Container(
//                                         //           width: 100,
//                                         //           child: Text(
//                                         //             "3,500",
//                                         //             style: Theme.of(context)
//                                         //                 .textTheme
//                                         //                 .bodyText1!
//                                         //                 .copyWith(
//                                         //                   color: defaultColor,
//                                         //                 ),
//                                         //           ),
//                                         //         ),
//                                         //       ])
//                                         // ]),
//                                         // Container(
//                                         //   width: double.infinity,
//                                         //   height: .5,
//                                         //   color: Colors.black38,
//                                         //   padding: const EdgeInsets.symmetric(
//                                         //       vertical: 24),
//                                         // ),

//                                         //Ivoice Summary Here

//                                         Column(children: [
//                                           Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Text(
//                                                   "SubTotal",
//                                                   style: Theme.of(context)
//                                                       .textTheme
//                                                       .bodyText1!
//                                                       .copyWith(
//                                                         color: defaultColor,
//                                                       ),
//                                                 ),
//                                                 Container(
//                                                   width: 100,
//                                                   child: Text(
//                                                     ,
//                                                     style: Theme.of(context)
//                                                         .textTheme
//                                                         .bodyText1!
//                                                         .copyWith(
//                                                           color: defaultColor,
//                                                         ),
//                                                   ),
//                                                 ),
//                                               ]),
//                                           Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Text(
//                                                   "Tax",
//                                                   style: Theme.of(context)
//                                                       .textTheme
//                                                       .bodyText1!
//                                                       .copyWith(
//                                                         color: defaultColor,
//                                                       ),
//                                                 ),
//                                                 Container(
//                                                   width: 100,
//                                                   child: Text(
//                                                     ,
//                                                     style: Theme.of(context)
//                                                         .textTheme
//                                                         .bodyText1!
//                                                         .copyWith(
//                                                           color: defaultColor,
//                                                         ),
//                                                   ),
//                                                 ),
//                                               ]),
//                                           Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Text(
//                                                   "Total",
//                                                   style: Theme.of(context)
//                                                       .textTheme
//                                                       .bodyText1!
//                                                       .copyWith(
//                                                         color: defaultColor,
//                                                       ),
//                                                 ),
//                                                 Container(
//                                                   width: 100,
//                                                   child: Text(
//                                                    ,
//                                                     style: Theme.of(context)
//                                                         .textTheme
//                                                         .bodyText1!
//                                                         .copyWith(
//                                                             color: defaultColor,
//                                                             fontSize: 18),
//                                                   ),
//                                                 ),
//                                               ]),
//                                         ]),
//                                       ],
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             );
//                           }(context),
//                         )),
//                     const Expanded(
//                       child: SizedBox.shrink(),
//                     ),

//                     // Invoice ActionButton Here

//                     Row(
//                       children: [
//                         Expanded(
//                           child: TextButton.icon(
//                             onPressed: () {},
//                             icon: Icon(
//                               Icons.cancel_outlined,
//                               color: defaultColor,
//                             ),
//                             label: const Text('Cancel',
//                                 style: TextStyle(color: Colors.purple)),
//                           ),
//                         ),
//                         Expanded(
//                             flex: 2,
//                             child: Container(
//                               color: Colors.amber,
//                               child: TextButton.icon(
//                                 onPressed: () {
//                                   context
//                                       .read<BillingItemsBloc>()
//                                       .add(RemoveBillingItemsEvent());
//                                   Navigator.pushReplacementNamed(
//                                       context, '/billing');
//                                 },
//                                 icon: Icon(
//                                   Icons.send_rounded,
//                                   color: defaultColor,
//                                 ),
//                                 label: Text(
//                                   'Send',
//                                   style: TextStyle(color: defaultColor),
//                                 ),
//                               ),
//                             ))
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }
       
    
// }
