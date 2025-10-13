import 'usuario.dart';
import 'tipo.dart';

class Restaurante{
  int? _codigo;
  String? _nomeRestaurante;
  String? _latitude;
  String? _longitude;
  Usuario? _proprietario;
  Tipo? _tipodeCulinaria;

  Restaurante({int? codigo, String? nomeRestaurante,String? latitude, String? longitude}){
    _codigo = codigo;
    _nomeRestaurante = nomeRestaurante;
    _latitude = latitude;
    _longitude = longitude;
  }
  int? get codigo => _codigo;
  String? get latitude => _latitude;
  String? get nomeRestaurante => _nomeRestaurante;
  String? get longitude => _longitude;

  set codigo(int? value) => _codigo = value;
  set latitude(String? value) => _latitude = value;
  set nomeRestaurante(String? value) => _nomeRestaurante = value;
  set longitude(String? value) => _longitude = value;
}