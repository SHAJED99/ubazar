class ProductModel {
  String id;
  String? type;
  String? parentCode;
  String name;
  String code;
  double price;
  double costPrice;
  double unitName;

  ProductModel({
    required this.id,
    this.type,
    this.parentCode,
    required this.name,
    required this.code,
    required this.price,
    required this.costPrice,
    required this.unitName,
  });

  // ProductModel.fromJson(Map<String, dynamic> json) {
  //   id = json['Id'] ?? "";

  // }
}
