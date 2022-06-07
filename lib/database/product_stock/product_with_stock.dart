import '../app_database.dart';

/// Join product with its stock information to get tax
/// and price
class ProductWithStock {
  final ProductDataClass product;
  final StockDataClass stock;
  final TaxDataClass tax;
  ProductWithStock(
      {required this.tax, required this.product, required this.stock});

  int _quantity = 1;
  int get quantity => _quantity;

  set setQuantity(int value) {
    _quantity = value;
  }
}
