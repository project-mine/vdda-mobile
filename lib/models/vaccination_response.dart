/// id : 1
/// dose : {"id":1,"vaccine":{"id":1,"name":"Sinovac","required_doses":2},"name":"dose 1","batch":"678676","expiry_date":"2021-09-22"}
/// place_of_vaccination : {"id":1,"name":"CIMAS"}
/// patient : {"id":1,"first_name":"Jack","last_name":"Hayzos","id_number":"09-8789979Y66","date_of_birth":"2021-09-26"}
/// vaccinator : {"id":1,"user":{"id":2,"email":"thabo@testmail.com","first_name":"Thabo","last_name":"Moyo"}}
/// date_of_vaccination : "2021-09-26T05:00:19.859255Z"

class VaccinationResponse {
  int id;
  Dose dose;
  Place_of_vaccination placeOfVaccination;
  Patient patient;
  Vaccinator vaccinator;
  String dateOfVaccination;

  VaccinationResponse({
      this.id,
      this.dose,
      this.placeOfVaccination,
      this.patient,
      this.vaccinator,
      this.dateOfVaccination});

  VaccinationResponse.fromJson(dynamic json) {
    id = json['id'];
    dose = json['dose'] != null ? Dose.fromJson(json['dose']) : null;
    placeOfVaccination = json['place_of_vaccination'] != null ? Place_of_vaccination.fromJson(json['place_of_vaccination']) : null;
    patient = json['patient'] != null ? Patient.fromJson(json['patient']) : null;
    vaccinator = json['vaccinator'] != null ? Vaccinator.fromJson(json['vaccinator']) : null;
    dateOfVaccination = json['date_of_vaccination'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    if (dose != null) {
      map['dose'] = dose.toJson();
    }
    if (placeOfVaccination != null) {
      map['place_of_vaccination'] = placeOfVaccination.toJson();
    }
    if (patient != null) {
      map['patient'] = patient.toJson();
    }
    if (vaccinator != null) {
      map['vaccinator'] = vaccinator.toJson();
    }
    map['date_of_vaccination'] = dateOfVaccination;
    return map;
  }

}

/// id : 1
/// user : {"id":2,"email":"thabo@testmail.com","first_name":"Thabo","last_name":"Moyo"}

class Vaccinator {
  int id;
  User user;

  Vaccinator({
      this.id,
      this.user});

  Vaccinator.fromJson(dynamic json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    if (user != null) {
      map['user'] = user.toJson();
    }
    return map;
  }

}

/// id : 2
/// email : "thabo@testmail.com"
/// first_name : "Thabo"
/// last_name : "Moyo"

class User {
  int id;
  String email;
  String firstName;
  String lastName;

  User({
      this.id,
      this.email,
      this.firstName,
      this.lastName});

  User.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    return map;
  }

}

/// id : 1
/// first_name : "Jack"
/// last_name : "Hayzos"
/// id_number : "09-8789979Y66"
/// date_of_birth : "2021-09-26"

class Patient {
  int id;
  String firstName;
  String lastName;
  String idNumber;
  String dateOfBirth;

  Patient({
      this.id,
      this.firstName,
      this.lastName,
      this.idNumber,
      this.dateOfBirth});

  Patient.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    idNumber = json['id_number'];
    dateOfBirth = json['date_of_birth'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['id_number'] = idNumber;
    map['date_of_birth'] = dateOfBirth;
    return map;
  }

}

/// id : 1
/// name : "CIMAS"

class Place_of_vaccination {
  int id;
  String name;

  Place_of_vaccination({
      this.id,
      this.name});

  Place_of_vaccination.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}

/// id : 1
/// vaccine : {"id":1,"name":"Sinovac","required_doses":2}
/// name : "dose 1"
/// batch : "678676"
/// expiry_date : "2021-09-22"

class Dose {
  int id;
  Vaccine vaccine;
  String name;
  String batch;
  String expiryDate;

  Dose({
      this.id,
      this.vaccine,
      this.name,
      this.batch,
      this.expiryDate});

  Dose.fromJson(dynamic json) {
    id = json['id'];
    vaccine = json['vaccine'] != null ? Vaccine.fromJson(json['vaccine']) : null;
    name = json['name'];
    batch = json['batch'];
    expiryDate = json['expiry_date'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    if (vaccine != null) {
      map['vaccine'] = vaccine.toJson();
    }
    map['name'] = name;
    map['batch'] = batch;
    map['expiry_date'] = expiryDate;
    return map;
  }

}

/// id : 1
/// name : "Sinovac"
/// required_doses : 2

class Vaccine {
  int id;
  String name;
  int requiredDoses;

  Vaccine({
      this.id,
      this.name,
      this.requiredDoses});

  Vaccine.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    requiredDoses = json['required_doses'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['required_doses'] = requiredDoses;
    return map;
  }

}