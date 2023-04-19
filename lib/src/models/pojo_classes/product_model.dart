class ProductModel {
  int? id;
  String? type;
  String? parentCode;
  String? name;
  String? code;
  double? price;
  double? costPrice;
  String? unitName;
  String? categoryName;
  String? brandName;
  String? modelName;
  String? variantName;
  String? sizeName;
  String? colorName;
  double? oldPrice;
  String? imagePath;
  String? productBarcode;
  String? description;
  List<WarehouseList>? warehouseList;
  double? currentStock;
  String? createDate;
  String? updateDate;

  ProductModel(
      {this.id,
      this.type,
      this.parentCode,
      this.name,
      this.code,
      this.price,
      this.costPrice,
      this.unitName,
      this.categoryName,
      this.brandName,
      this.modelName,
      this.variantName,
      this.sizeName,
      this.colorName,
      this.oldPrice,
      this.imagePath,
      this.productBarcode,
      this.description,
      this.warehouseList,
      this.currentStock,
      this.createDate,
      this.updateDate});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    type = json['Type'];
    parentCode = json['ParentCode'];
    name = json['Name'];
    code = json['Code'];
    price = json['Price'];
    costPrice = json['CostPrice'];
    unitName = json['UnitName'];
    categoryName = json['CategoryName'];
    brandName = json['BrandName'];
    modelName = json['ModelName'];
    variantName = json['VariantName'];
    sizeName = json['SizeName'];
    colorName = json['ColorName'];
    oldPrice = json['OldPrice'];
    imagePath = json['ImagePath'];
    productBarcode = json['ProductBarcode'];
    description = json['Description'];

    if (json['WarehouseList'] != null) {
      warehouseList = <WarehouseList>[];
      json['WarehouseList'].forEach((v) {
        warehouseList!.add(WarehouseList.fromJson(v));
      });
    }
    currentStock = json['CurrentStock'];
    createDate = json['CreateDate'];
    updateDate = json['UpdateDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Type'] = type;
    data['ParentCode'] = parentCode;
    data['Name'] = name;
    data['Code'] = code;
    data['Price'] = price;
    data['CostPrice'] = costPrice;
    data['UnitName'] = unitName;
    data['CategoryName'] = categoryName;
    data['BrandName'] = brandName;
    data['ModelName'] = modelName;
    data['VariantName'] = variantName;
    data['SizeName'] = sizeName;
    data['ColorName'] = colorName;
    data['OldPrice'] = oldPrice;
    data['ImagePath'] = imagePath;
    data['ProductBarcode'] = productBarcode;
    data['Description'] = description;

    if (warehouseList != null) {
      data['WarehouseList'] = warehouseList!.map((v) => v.toJson()).toList();
    }
    data['CurrentStock'] = currentStock;
    data['CreateDate'] = createDate;
    data['UpdateDate'] = updateDate;
    return data;
  }
}

class WarehouseList {
  int? costCalculatedId;
  String? whShortName;
  double? currentStock;
  double? averageCosting;
  double? costingValue;
  double? salesValue;

  WarehouseList({this.costCalculatedId, this.whShortName, this.currentStock, this.averageCosting, this.costingValue, this.salesValue});

  WarehouseList.fromJson(Map<String, dynamic> json) {
    costCalculatedId = json['CostCalculatedId'];
    whShortName = json['WhShortName'];
    currentStock = json['CurrentStock'];
    averageCosting = json['AverageCosting'];
    costingValue = json['CostingValue'];
    salesValue = json['SalesValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CostCalculatedId'] = costCalculatedId;
    data['WhShortName'] = whShortName;
    data['CurrentStock'] = currentStock;
    data['AverageCosting'] = averageCosting;
    data['CostingValue'] = costingValue;
    data['SalesValue'] = salesValue;
    return data;
  }
}
