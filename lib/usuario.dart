class Usuario{
  //Atributos
  int? _codigo;
  String? _nome;
  String? _login;
  String? _senha;
  //Para selecionar classe, privada use ( _ ) antes do nome do atributo
  //Metodo construtor
  Usuario({String? nome, int? codigo, String? login, String? senha}){
   _senha = senha;
   _codigo = codigo;
   _nome = nome;
   _login = login;
  }

  //getters
  //escrita do get tradicional
  String? getNome(){
    return _nome;
  }
  //escrita do get no Dart
  String? get login => _login;
  String? get senha => _senha;
  int? get codigo => _codigo;

  //setters

  //escrita do set tradicional
  set nome(String? nome){
    _nome = nome;
  }

  //escrita do set no Dart
  set login(String? login) => _login = login;
  set codigo(int? codigo) => _codigo = codigo;
  set senha(String? senha) => _senha = senha;
}