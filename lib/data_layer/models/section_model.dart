import 'package:zidne/data_layer/dio_helper.dart';

import '../../domain_layer/entities/section_entity.dart';

class SectionModel extends SectionEntity {
  const SectionModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.image,
  });

  factory SectionModel.fromMap(Map<String, dynamic> map) {
    return SectionModel(
      id: map['id'],
      name: map['name'],
      description: map['description'] ?? "",
      image: "${DioHelper.baseURL}${map['image'] ?? ""}",
      price: 0,
    );
  }

  Map<String, dynamic> toMap({required bool sendImage}) {
    return {
      'section_id': id,
      'name': name,
      'description': description,
      'image': sendImage ? image : null,
      'price': price,
    };
  }

  factory SectionModel.fromEntity(SectionEntity section) {
    return SectionModel(
      id: section.id,
      name: section.name,
      description: section.description,
      price: section.price,
      image: section.image,
    );
  }
}
