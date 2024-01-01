import '../../domain_layer/entities/section_entity.dart';

class SectionModel extends SectionEntity {
  const SectionModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
  });

  factory SectionModel.fromMap(Map<String, dynamic> map) {
    print(map);
    return SectionModel(
      id: map['id'],
      name: map['name'],
      description: map['description'] ?? "",
      price: 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'section_id': id,
      'name': name,
      'description': description,
      'price': price,
    };
  }

  factory SectionModel.fromEntity(SectionEntity section) {
    return SectionModel(
      id: section.id,
      name: section.name,
      description: section.description,
      price: section.price,
    );
  }
}
