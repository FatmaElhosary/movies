import 'dart:convert';




class ProductionCompany {
  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  const ProductionCompany({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  @override
  String toString() {
    return 'ProductionCompany(id: $id, logoPath: $logoPath, name: $name, originCountry: $originCountry)';
  }

  factory ProductionCompany.fromMap(Map<String, dynamic> data) {
    return ProductionCompany(
      id: data['id'] as int?,
      logoPath: data['logo_path'] as String?,
      name: data['name'] as String?,
      originCountry: data['origin_country'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'logo_path': logoPath,
        'name': name,
        'origin_country': originCountry,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProductionCompany].
  factory ProductionCompany.fromJson(String data) {
    return ProductionCompany.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProductionCompany] to a JSON string.
  String toJson() => json.encode(toMap());
}
