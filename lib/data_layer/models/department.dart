import 'package:equatable/equatable.dart';

class DepartmentModel extends Equatable {
  final int id;
  final String name;
  final String image;

  const DepartmentModel({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  List<Object> get props => [id, name, image];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory DepartmentModel.fromMap(Map<String, dynamic> map) {
    return DepartmentModel(
      id: map['id'],
      name: map['name'],
      image: map['image'],
    );
  }
  factory DepartmentModel.test() {
    return const DepartmentModel(
      id: 0,
      name: "Name",
      image:"",
    );
  }
}
