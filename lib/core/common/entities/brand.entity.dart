class BrandEntity {
  final int id;
  final String name;

  const BrandEntity({
    required this.id,
    required this.name,
  });

  factory BrandEntity.fromMap(Map<String, dynamic> map) {
    return BrandEntity(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  const BrandEntity.empty()
      : id = 0,
        name = '';
}
