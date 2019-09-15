class ProductApiBody {
  final String limit;
  final String offset;

  ProductApiBody({this.limit, this.offset});

  Map<String, dynamic> toJson() => {
        'limit': limit,
        'offset': offset,
      };
}
