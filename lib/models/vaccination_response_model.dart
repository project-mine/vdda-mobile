// To parse this JSON data, do
//
//     final vaccinationResponseModel = vaccinationResponseModelFromJson(jsonString);

import 'dart:convert';

List<VaccinationResponseModel> vaccinationResponseModelFromJson(String str) =>
    List<VaccinationResponseModel>.from(
        json.decode(str).map((x) => VaccinationResponseModel.fromJson(x)));

String vaccinationResponseModelToJson(List<VaccinationResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VaccinationResponseModel {
  VaccinationResponseModel({
    this.id,
    this.dose,
    this.placeOfVaccination,
    this.patient,
    this.vaccinator,
    this.dateOfVaccination,
  });

  int id;
  Dose dose;
  PlaceOfVaccination placeOfVaccination;
  Patient patient;
  Vaccinator vaccinator;
  String dateOfVaccination;

  factory VaccinationResponseModel.fromJson(Map<String, dynamic> json) =>
      VaccinationResponseModel(
        id: json["id"] == null ? null : json["id"],
        dose: json["dose"] == null ? null : Dose.fromJson(json["dose"]),
        placeOfVaccination: json["place_of_vaccination"] == null
            ? null
            : PlaceOfVaccination.fromJson(json["place_of_vaccination"]),
        patient:
            json["patient"] == null ? null : Patient.fromJson(json["patient"]),
        vaccinator: json["vaccinator"] == null
            ? null
            : Vaccinator.fromJson(json["vaccinator"]),
        dateOfVaccination: json["date_of_vaccination"] == null
            ? null
            : json["date_of_vaccination"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "dose": dose == null ? null : dose.toJson(),
        "place_of_vaccination":
            placeOfVaccination == null ? null : placeOfVaccination.toJson(),
        "patient": patient == null ? null : patient.toJson(),
        "vaccinator": vaccinator == null ? null : vaccinator.toJson(),
        "date_of_vaccination":
            dateOfVaccination == null ? null : dateOfVaccination,
      };
}

class Dose {
  Dose({
    this.id,
    this.vaccine,
    this.name,
    this.batch,
    this.expiryDate,
  });

  int id;
  Vaccine vaccine;
  String name;
  String batch;
  DateTime expiryDate;

  factory Dose.fromJson(Map<String, dynamic> json) => Dose(
        id: json["id"] == null ? null : json["id"],
        vaccine:
            json["vaccine"] == null ? null : Vaccine.fromJson(json["vaccine"]),
        name: json["name"] == null ? null : json["name"],
        batch: json["batch"] == null ? null : json["batch"],
        expiryDate: json["expiry_date"] == null
            ? null
            : DateTime.parse(json["expiry_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "vaccine": vaccine == null ? null : vaccine.toJson(),
        "name": name == null ? null : name,
        "batch": batch == null ? null : batch,
        "expiry_date": expiryDate == null
            ? null
            : "${expiryDate.year.toString().padLeft(4, '0')}-${expiryDate.month.toString().padLeft(2, '0')}-${expiryDate.day.toString().padLeft(2, '0')}",
      };
}

class Vaccine {
  Vaccine({
    this.id,
    this.name,
    this.requiredDoses,
  });

  int id;
  String name;
  int requiredDoses;

  factory Vaccine.fromJson(Map<String, dynamic> json) => Vaccine(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        requiredDoses:
            json["required_doses"] == null ? null : json["required_doses"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "required_doses": requiredDoses == null ? null : requiredDoses,
      };
}

class Patient {
  Patient({
    this.id,
    this.firstName,
    this.lastName,
    this.idNumber,
    this.dateOfBirth,
  });

  int id;
  String firstName;
  String lastName;
  String idNumber;
  DateTime dateOfBirth;

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"] == null ? null : json["id"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        idNumber: json["id_number"] == null ? null : json["id_number"],
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "id_number": idNumber == null ? null : idNumber,
        "date_of_birth": dateOfBirth == null
            ? null
            : "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
      };
}

class PlaceOfVaccination {
  PlaceOfVaccination({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory PlaceOfVaccination.fromJson(Map<String, dynamic> json) =>
      PlaceOfVaccination(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}

class Vaccinator {
  Vaccinator({
    this.id,
    this.user,
  });

  int id;
  User user;

  factory Vaccinator.fromJson(Map<String, dynamic> json) => Vaccinator(
        id: json["id"] == null ? null : json["id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "user": user == null ? null : user.toJson(),
      };
}

class User {
  User({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
  });

  int id;
  String email;
  String firstName;
  String lastName;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : json["email"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "email": email == null ? null : email,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
      };
}
