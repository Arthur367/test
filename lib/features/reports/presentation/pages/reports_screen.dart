// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mobile_pos/core/common/presentation/widget/loading_indicator.dart';
// import 'package:mobile_pos/di/injection.dart';
// import 'package:mobile_pos/features/billing/presentation/bloc/invoice/invoice_bloc.dart';

// class ReportsScreen extends StatefulWidget {
//   const ReportsScreen({Key? key}) : super(key: key);

//   @override
//   _ReportsScreenState createState() => _ReportsScreenState();
// }

// class _ReportsScreenState extends State<ReportsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => getIt<InvoiceBloc>()..add(RetriveInvoicesEvent()),
//       child: Scaffold(
//           appBar: AppBar(
//             title: Text('Reports'),
//             centerTitle: true,
//           ),
//           body: Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: BlocBuilder(builder: (context, state) {
//               if (state is InvoicesError) {
//                 return const Center(
//                   child: LoadingIndicator(),
//                 );
//               }
//               if (state is InvoicesLoaded) {
//                 return Container(
//                   padding: const EdgeInsets.all(8.0),
//                   child: ListView.builder(itemBuilder: (context, index) {
//                     return Card(
//                       child: Column(
//                         children: [
//                           ListTile(
//                             title: Text(state.invoices[index].productCode),
//                           )
//                         ],
//                       ),
//                     );
//                   }),
//                 );
//               }
//               return const Text('No Invoices');
//             }),
//           )),
//     );
//     // return Scaffold(
//     //   appBar: AppBar(
//     //     title: Text('Reports'),
//     //     centerTitle: true,
//     //   ),
//     //   body: ListView.builder(
//     //     itemCount: 18,
//     //     itemBuilder: (BuildContext context, int index) {
//     //       return ListTile(
//     //         leading: const Icon(
//     //           Icons.summarize_outlined,
//     //         ),
//     //         title: Text('Report $index'),
//     //         trailing: const Icon(
//     //           Icons.arrow_forward_outlined,
//     //         ),
//     //         onTap: () {},
//     //       );
//     //     },
//     //   ),
//     // );
//   }
// }
