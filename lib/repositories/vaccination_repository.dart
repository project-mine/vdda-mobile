import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:vdds_mobile/models/vaccination_response_model.dart';

class VaccionationRepository {
  

  Future<VaccinationResponseModel> getVaccinationData({
    @required String idNumber,
  }) async {
    var queryString = '?id_number=$idNumber';

    var url = 'http://192.168.1.113:8000/api/core/vaccinations/vaccinated/';

    var urlheader = '$url$queryString';
    print(urlheader);

    var response = await http.get(
      Uri.parse(urlheader),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print("Vaccination response model......." + response.toString());
    if (response.statusCode == 200) {
      Map body;
      if (response.body
          .toString()
          .contains(' "error": "Patient has not been vaccinated"')) {
        throw Exception(
            " Not Vaccination Information available for this individual");
      } else {
        body = json.decode(response.body);
      }
      return VaccinationResponseModel.fromJson(body);
    } else {
      throw Exception();
    }
  }
}
