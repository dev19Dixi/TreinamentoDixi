// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SubMenuModel {
  String name;
  String route;
  SubMenuModel({
    required this.name,
    required this.route,
  });

  SubMenuModel copyWith({
    String? name,
    String? route,
  }) {
    return SubMenuModel(
      name: name ?? this.name,
      route: route ?? this.route,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'route': route,
    };
  }

  factory SubMenuModel.fromMap(Map<String, dynamic> map) {
    return SubMenuModel(
      name: map['name'] as String,
      route: map['route'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubMenuModel.fromJson(String source) => SubMenuModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SubMenuModel(name: $name, route: $route)';

  @override
  bool operator ==(covariant SubMenuModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.route == route;
  }

  @override
  int get hashCode => name.hashCode ^ route.hashCode;
}
