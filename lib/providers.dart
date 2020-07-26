import 'package:v_covid/model.dart';
import 'package:v_covid/api.dart';
import 'package:flutter/material.dart';

class Providers with ChangeNotifier {
  var api = Api();
  List<Model> model;

  Future<List<Model>> getProviders() async {
    final response = await api.client.get("${api.baseKawalKorona}indonesia");
    if(response.statusCode == 200){
      notifyListeners();

      var res = modelFromJson(response.body);
      model = res;
      return model;
    }else{
      return null;
    }
  }
}

class ListProviders with ChangeNotifier {
  var api = Api();
  List<ListModel> listModel;

  Future<List<ListModel>> getProviders() async {
    final response = await api.client.get("${api.baseKawalKorona}indonesia/provinsi");
    if(response.statusCode == 200){
      notifyListeners();
      var res = listModelFromJson(response.body);
      listModel = res;

      return listModel;
    }else{
      return null;
    }
  }
}