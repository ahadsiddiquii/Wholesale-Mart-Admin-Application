class PrintingItemModel {
  PrintingItemModel({
    this.packPrice,
    this.itemName,
    this.itemCode,
    this.vendorName,
    this.departmentName,
    this.caseSize,
    this.packageUPC,
    this.itemsIngredients,
    this.packageSize,
    this.itemSize,
    this.barcodeData,
    this.itemPrice,
    this.imageUrl,
  });

  factory PrintingItemModel.fromJson(Map<String, dynamic> map) {
    return PrintingItemModel(
      packPrice: map['packPrice'],
      itemName: map['itemName'],
      itemCode: map['itemCode'],
      vendorName: map['vendorName'],
      departmentName: map['departmentName'],
      caseSize: map['caseSize'],
      packageUPC: map['packageUPC'],
      itemsIngredients: map['itemsIngredients'],
      packageSize: map['packageSize'],
      itemSize: map['itemSize'],
      barcodeData: map['barcodeData'],
      itemPrice: map['itemPrice'],
      imageUrl: map['imageUrl'],
    );
  }
  final num? packPrice;
  final String? itemName;
  final String? itemCode;
  final String? vendorName;
  final String? departmentName;
  final num? caseSize;
  final String? packageUPC;
  final String? itemsIngredients;
  final num? packageSize;
  final String? itemSize;
  final String? barcodeData;
  final num? itemPrice;
  final String? imageUrl;

  static List<PrintingItemModel> listFromJson(List jsonList) {
    return jsonList.map((e) => PrintingItemModel.fromJson(e)).toList();
  }
}
