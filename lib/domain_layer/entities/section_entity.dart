import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'section_entity.g.dart';

@HiveType(typeId: 3)
class SectionEntity extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final int price;

  const SectionEntity({
    this.id = 0,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  List<Object> get props => [id, name, description, price];
}
