import 'package:meta/meta.dart';
import 'dart:convert';

List<Model> modelFromJson(String str) => List<Model>.from(json.decode(str).map((x) => Model.fromMap(x)));

List<ListModel> listModelFromJson(String str) => List<ListModel>.from(json.decode(str).map((x) => ListModel.fromMap(x)));

String modelToJson(List<Model> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));
String listModelToJson(List<ListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Model {
  String confirmed;
  String recovered;
  String deaths;

  Model({
    @required this.confirmed,
    @required this.recovered,
    @required this.deaths,
  });

  factory Model.fromMap(Map<String, dynamic> json) => Model(
    confirmed: json["positif"] == null ? null : json["positif"],
    recovered: json["sembuh"] == null ? null : json["sembuh"],
    deaths: json["meninggal"] == null ? null : json["meninggal"],
  );

  Map<String, dynamic> toMap()  => {
    "confirmed": confirmed == null ? null : confirmed,
    "recovered": recovered == null ? null : recovered,
    "deaths": deaths == null ? null : deaths,
  };
}

class ListModel {
  // String provinceState; 
  String countryRegion; 
  String confirmed; 
  String deaths; 
  String recovered; 

  ListModel({
    // @required this.provinceState,
    @required this.countryRegion,
    @required this.confirmed,
    @required this.deaths,
    @required this.recovered,
  });

  factory ListModel.fromMap(Map<String, dynamic> json) => ListModel(
      // provinceState: json["provinceState"] == null ? null : json["provinceState"],
      countryRegion: json["attributes"]["Provinsi"] == null ? null : json["attributes"]["Provinsi"],
      confirmed: json["attributes"]["Kasus_Posi"] == null ? null : json["attributes"]["Kasus_Posi"].toString(),
      deaths: json["attributes"]["Kasus_Semb"] == null ? null : json["attributes"]["Kasus_Semb"].toString(),
      recovered: json["attributes"]["Kasus_Meni"] == null ? null : json["attributes"]["Kasus_Meni"].toString(),
  );

  Map<String, dynamic> toMap() => {
    // "provinceState": provinceState == null ? null : provinceState,
    "countryRegion": countryRegion == null ? null : countryRegion,
    "confirmed": confirmed == null ? null : confirmed,
    "deaths": deaths == null ? null : deaths,
    "recovered": recovered == null ? null : recovered,
  };
}