class ConfigHeaders{
  static Map<String,String> getHeaderToken(String token, String entity){
    if(entity == '') return {'Authorization': 'bearer $token','Content-Type': 'application/json; charset=UTF-8'};
    return {'Authorization': 'bearer $token','Content-Type': 'application/json; charset=UTF-8', 'Entidade': entity};
  }


}