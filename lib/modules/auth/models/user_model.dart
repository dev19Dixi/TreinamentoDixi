class UserModel {
  int id;
  String name;
  String email;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

   factory  UserModel.empty({int id = 0}) => UserModel(id: id, name: "Teste name", email: "teste@teste.com");
}
