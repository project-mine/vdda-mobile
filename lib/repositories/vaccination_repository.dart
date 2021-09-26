import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vdds_mobile/models/vaccination_response.dart';

class VaccionationRepository {

  final http.Client httpClient = http.Client();

  

  Future<List<VaccinationResponse>> getVaccinationData({@required String idNumber,}) async {
    var queryString = '?id_number=$idNumber';

    var url = 'http://192.168.1.113:8000/api/core/vaccinations/vaccinated/';

    var urlheader = '$url$queryString';
    print(urlheader);

/*    var response = await http.get(
      Uri.parse(urlheader),
      headers: <String, String>{
        // 'Content-Type': 'application/json; charset=UTF-8',
      },
    );*/
    final response = await this.httpClient.get(
        Uri.parse(urlheader)
    );

    print("Vaccination response model......." + response.toString());
    if (response.statusCode == 200) {
      final vbody =jsonDecode(response.body);
      List<VaccinationResponse> vaccines = [];
      for(final vac in vbody){
        vaccines.add(VaccinationResponse.fromJson(vac));
      }

      return vaccines;
    } else {
      throw Exception();
    }
  }




}
