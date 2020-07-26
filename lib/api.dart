import 'package:http/http.dart';

class Api {
  final String baseUrl = "https://covid19.mathdro.id";
  final String historyUrl = "https://louislugas.github.io/covid_19_cluster/json/kasus-corona-indonesia.json";
  final String baseKawalKorona  = "https://api.kawalcorona.com/";
  Client client = Client();
}