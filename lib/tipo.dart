class Tipo{
  int? _codigo;
  String? _nome;
  String? _descricao;
  Tipo({int? codigo, String? nome, String? descricao}){
    _codigo = codigo;
    _nome = nome;
    _descricao = descricao;
  }
  int? get codigo => _codigo;
  String? get nome => _nome;
  String? get descricao => _descricao;

  set descricao(String? value) => _descricao = value;
  set nome(String? nome) => _nome = nome;
  set codigo(int? codigo) => _codigo = codigo;

}

