// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:treinamento_mvvm/core/navigation/models/submenu_model.dart';

class MenuModel {
  String name;
  String icon;
  List<SubMenuModel> listSubMenu;
  MenuModel({
    required this.name,
    required this.icon,
    required this.listSubMenu,
  });

  MenuModel copyWith({
    String? name,
    String? icon,
    List<SubMenuModel>? listSubMenu,
  }) {
    return MenuModel(
      name: name ?? this.name,
      icon: icon ?? this.icon,
      listSubMenu: listSubMenu ?? this.listSubMenu,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'icon': icon,
      'listSubMenu': listSubMenu.map((x) => x.toMap()).toList(),
    };
  }

  factory MenuModel.fromMap(Map<String, dynamic> map) {
    return MenuModel(
      name: map['name'] as String,
      icon: map['icon'] as String,
      listSubMenu: List<SubMenuModel>.from((map['listSubMenu'] as List<int>).map<SubMenuModel>((x) => SubMenuModel.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuModel.fromJson(String source) => MenuModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MenuModel(name: $name, icon: $icon, listSubMenu: $listSubMenu)';

  @override
  bool operator ==(covariant MenuModel other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return 
      other.name == name &&
      other.icon == icon &&
      listEquals(other.listSubMenu, listSubMenu);
  }

  @override
  int get hashCode => name.hashCode ^ icon.hashCode ^ listSubMenu.hashCode;
}
