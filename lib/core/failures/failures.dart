import 'package:equatable/equatable.dart';

abstract class IDixiFailure extends Equatable  implements Exception {
  String get message => "Error happened";
}

class ServerFailure implements IDixiFailure {
  @override
  String get message => "Erro no servidor, contate o administrador";
  
  @override
  List<Object> get props => [message];
  
  @override
  bool? get stringify => throw UnimplementedError();
}

class InternetFailure implements IDixiFailure {
  @override
  String get message => "Erro na conexão de internet, verifique sua conexão para continuar";
  
  @override
  List<Object> get props => [message];
  
  @override
  bool? get stringify => throw UnimplementedError();
}

class NoAccessFailure implements IDixiFailure {
  @override
  String get message => "Sem acesso";
  
  @override
  List<Object> get props => [message];
  
  @override
  bool? get stringify => throw UnimplementedError();
}

class FormatFailure implements IDixiFailure {
  @override
  String get message => "Error de envio de requisição";
  
  @override
  List<Object> get props => [message];
  
  @override
  bool? get stringify => throw UnimplementedError();
}

class UnexpectedFailure implements IDixiFailure {
  @override
  String get message => "Erro inesperado";
  
  @override
  List<Object> get props => [message];
  
  @override
  bool? get stringify => throw UnimplementedError();
}

