import '../../../../core/common/data/models/models.dart';

class VatTaxResponse {
  final List<TaxModel> taxes;
  final List<VatModel> vats;

  const VatTaxResponse({
    required this.taxes,
    required this.vats,
  });
}
