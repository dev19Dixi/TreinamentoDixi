// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PositionModel {
  int id;
  String name;
  String email;
  bool isActive;
  String description;
  PositionModel({
    required this.id,
    required this.name,
    required this.email,
    required this.isActive,
    required this.description,
  });

  PositionModel copyWith({
    int? id,
    String? name,
    String? email,
    bool? isActive,
    String? description,
  }) {
    return PositionModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      isActive: isActive ?? this.isActive,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'isActive': isActive,
      'description': description,
    };
  }

  factory PositionModel.fromMap(Map<String, dynamic> map) {
    return PositionModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      isActive: map['isActive'] as bool,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PositionModel.fromJson(String source) => PositionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PositionModel(id: $id, name: $name, email: $email, isActive: $isActive, description: $description)';
  }

  @override
  bool operator ==(covariant PositionModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.isActive == isActive &&
      other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      isActive.hashCode ^
      description.hashCode;
  }
}
