class CategoryEntity {
  final int id;
  final String name;

  const CategoryEntity({
    required this.id,
    required this.name,
  });

  factory CategoryEntity.fromMap(Map<String, dynamic> map) {
    return CategoryEntity(
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

  const CategoryEntity.empty()
      : id = 0,
        name = '';
}
