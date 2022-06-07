import 'package:mobile_pos/core/common/reducers/list_reducer_models.dart';
import 'package:mobile_pos/database/product_stock/product_with_stock.dart';
import 'package:mobile_pos/database/transaction/transactioned_items.dart';
import 'package:mobile_pos/features/billing/domain/entities/transactions_entity.dart';

import '../../../features/billing/domain/entities/billing_item_entity.dart';

Map<String, double> getTotals(
  List<ProductWithStock> stock,
  List<BillingItemEntity> entities,
) {
  List<BillingModel> products = entities
      .asMap()
      .entries
      .map((e) => BillingModel(
            productId: stock[e.key].product.productCode,
            name: stock[e.key].product.productName,
            tax: stock[e.key].tax.taxPercent,
            isIncluded: stock[e.key].product.isInclusive,
            quantity: entities[e.key].quantity,
            rate: stock[e.key].stock.rate,
          ))
      .toList();

  List<BillingModel> _taxInclusive = [];
  List<BillingModel> _taxExclusive = [];

  for (var item in products) {
    if (item.isIncluded) {
      _taxInclusive.add(item);
    } else {
      _taxExclusive.add(item);
    }
  }

  List<Map<String, double>> taxExc = [];

  List<Map<String, double>> taxInc = [];
  //if tax is not included, the rate is the inital amount, add tax to the rate
  //calculate the tax for the quantity provided.

  for (var item in _taxExclusive) {
    final taxPct = item.tax;
    final rate = item.rate;
    final calc = (taxPct / 100) * item.rate * item.quantity;
    final stw = (taxPct / 100) * item.rate;
    final costAfter = item.rate * item.quantity;
    taxExc.add({'tax': calc, 'costAfter': costAfter, 'taxPct': taxPct});
  }

  //if tax is included, to get the initial price, deduct the tax from the price.
  for (var item in _taxInclusive) {
    final taxPct = item.tax;
    final rate = item.rate;
    final calc = (taxPct / 100) * item.rate * item.quantity;
    final stw = (taxPct / 100) * item.rate;
    final costAfter = item.rate * item.quantity;
    taxExc.add({'tax': calc, 'costAfter': costAfter, 'taxPct': taxPct});
  }

  print('Inclusive Tax: ${taxInc}');
  print('Exclusive Tax: ${taxExc}');

  // Combine the two lists

  final combinedList = [...taxInc, ...taxExc];

  print('Combined List: ${combinedList}');

  double subtotal = 0;
  double totalTax = 0;
  double taxPct = 0;
  for (var item in combinedList) {
    subtotal += item['costAfter']!;
    totalTax += item['tax']!;
  }

  double total = subtotal + totalTax;
  double taxPt = taxPct;

  return {
    'total': total,
    'tax': totalTax,
    'subtotal': subtotal,
    'taxPct': taxPt
  };
}
