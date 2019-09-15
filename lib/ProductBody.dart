class ProductBody {
  final String message;
  final bool success;
  final List<ProductHead> data;
  final String offset;
  final int count;

  ProductBody({this.message, this.success, this.data, this.offset, this.count});

  factory ProductBody.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
//    print(list.runtimeType); //returns List<dynamic>
    List<ProductHead> productsList =
        list.map((i) => ProductHead.fromJson(i)).toList();

    return ProductBody(
        message: json['message'],
        success: json['success'],
        data: productsList,
        offset: json['offset'],
        count: json['count']);
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'success': success,
        'data': data,
        'offset': offset,
        'count': count
      };
}

class ProductHead {
  ProductCategory Product_Category;
  List<ProductData> Product;

  ProductHead({this.Product, this.Product_Category});

  factory ProductHead.fromJson(Map<String, dynamic> json) {
    var list = json['Product'] as List;
    List<ProductData> productsList =
        list.map((i) => ProductData.fromJson(i)).toList();

    return ProductHead(
      Product_Category: ProductCategory.fromJson(json['Product_Category']),
      Product: productsList,
    );
  }
}

class ProductCategory {
  String id;
  String cat_name;

  ProductCategory({this.id, this.cat_name});

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(id: json['id'], cat_name: json['cat_name']);
  }
}

class ProductData {
  String id;
  String product_name;
  String price;
  String product_picture;
  String product_description;
  String product_application;
  String cat_id;
  String packing_variants;
  String dosage;

  List<Benefits> Product_Benefits;
  List<Speciality> Product_Speciality;
  List<Feature> Product_Feature;
  List<ProductCategory> Product_Category;

  ProductData(
      {this.id,
      this.product_name,
      this.price,
      this.product_picture,
      this.product_description,
      this.product_application,
      this.cat_id,
      this.packing_variants,
      this.dosage,
      this.Product_Benefits,
      this.Product_Speciality,
      this.Product_Feature,
      this.Product_Category});

  factory ProductData.fromJson(Map<String, dynamic> json) {
    var productsBenefitsList = json['Product_Benefits'] as List;
//    print(list.runtimeType); //returns List<dynamic>
    List<Benefits> productsList =
        productsBenefitsList.map((i) => Benefits.fromJson(i)).toList();

    var productCategoryList = json['Product_Category'] as List;
//    print(list.runtimeType); //returns List<dynamic>
    List<ProductCategory> productCategoryListSample =
        productCategoryList.map((i) => ProductCategory.fromJson(i)).toList();

    var Product_SpecialityList = json['Product_Speciality'] as List;
//    print(list.runtimeType); //returns List<dynamic>
    List<Speciality> productsSpecialityList =
        Product_SpecialityList.map((i) => Speciality.fromJson(i)).toList();

    var productFeatureVar = json['Product_Feature'] as List;
//    print(list.runtimeType); //returns List<dynamic>
    List<Feature> productFeatureList =
        productFeatureVar.map((i) => Feature.fromJson(i)).toList();

    return ProductData(
        id: json['id'],
        product_name: json['product_name'],
        price: json['price'],
        product_picture: json['product_picture'],
        product_description: json['product_description'],
        product_application: json['product_application'],
        cat_id: json['cat_id'],
        packing_variants: json['packing_variants'],
        dosage: json['dosage'],
        Product_Benefits: productsList,
        Product_Speciality: productsSpecialityList,
        Product_Feature: productFeatureList,
        Product_Category: productCategoryListSample);
  }
}


class Benefits {
  String id;
  String product_benefits;
  String product_id;

  Benefits({this.id, this.product_benefits, this.product_id});

  factory Benefits.fromJson(Map<String, dynamic> json) {
    return Benefits(
      id: json['id'],
      product_benefits: json['product_benefits'],
      product_id: json['product_id'],
    );
  }
}

class Speciality {
  String id;
  String product_speciality;
  String product_id;

  Speciality({this.id, this.product_speciality, this.product_id});

  factory Speciality.fromJson(Map<String, dynamic> json) {
    return Speciality(
      id: json['id'],
      product_speciality: json['product_speciality'],
      product_id: json['product_id'],
    );
  }
}

class Feature {
  String id;
  String product_feature;
  String product_id;

  Feature({this.id, this.product_feature, this.product_id});

  factory Feature.fromJson(Map<String, dynamic> json) {
    return Feature(
      id: json['id'],
      product_feature: json['product_feature'],
      product_id: json['product_id'],
    );
  }
}
