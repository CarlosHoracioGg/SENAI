import 'usuario.dart';
import 'tipo.dart';

class Restaurante{
  int? _codigo;
  String? _nomeRestaurante;
  String? _latitude;
  String? _longitude;
  Usuario? _proprietario;
  Tipo? _tipodeCulinaria;

  Restaurante({int? codigo, String? nomeRestaurante,String? latitude, String? longitude, Tipo? tipodeCulinaria, Usuario? proprietario}){
    _codigo = codigo;
    _nomeRestaurante = nomeRestaurante;
    _latitude = latitude;
    _longitude = longitude;
    _tipodeCulinaria = tipodeCulinaria;
    _proprietario = proprietario;
  }
  int? get codigo => _codigo;
  String? get latitude => _latitude;
  String? get nomeRestaurante => _nomeRestaurante;
  String? get longitude => _longitude;
  Tipo? get tipodeCulinaria => _tipodeCulinaria;
  Usuario? get proprietario=> _proprietario;

  set codigo(int? value) => _codigo = value;
  set latitude(String? value) => _latitude = value;
  set nomeRestaurante(String? value) => _nomeRestaurante = value;
  set longitude(String? value) => _longitude = value;
  set tipodeCulinaria(Tipo? value) => _tipodeCulinaria = value;
  set proprietario(Usuario? value) => _proprietario = value;
}