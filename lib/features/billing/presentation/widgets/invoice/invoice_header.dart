import 'package:flutter/material.dart';
import 'package:mobile_pos/features/billing/domain/entities/transactions_entity.dart';

class InvoiceHeader extends StatelessWidget {
  final TransactionEntity trans;
  const InvoiceHeader({Key? key, required this.trans}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                        Text("Invoice For",
                            style: Theme.of(context).textTheme.bodyText2),
                        Text(
                          trans.customerName,
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Colors.purple,
                                  ),
                        )
                      ])
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//                                       .read<BillingItemsBloc>()
//                                       .add(RemoveBillingItemsEvent());
