class ProductIdService {
  ProductIdService._();
  static String getProductId({
    int? sno,
    String? barCode,
  }) {
    //Generate UUID

    String productId = '';
    if (sno != null && sno != -1) {
      productId = '$sno';
    }
    if (barCode != null && barCode != '-1') {
      productId = '${productId}_$barCode';
    }
    return productId;
  }
}
