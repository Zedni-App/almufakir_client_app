import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'section_entity.g.dart';

@HiveType(typeId: 2)
class SectionEntity extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final int price;
  @HiveField(4)
  final String image;

  const SectionEntity({
    this.id = 0,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  factory SectionEntity.newOne() {
    return const SectionEntity(
        id: -1, name: "", description: "", price: 0, image: "");
  }

  @override
  List<Object> get props => [id, name, description, price, image];
}
