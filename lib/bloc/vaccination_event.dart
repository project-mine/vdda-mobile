part of 'vaccination_bloc.dart';

abstract class VaccinationEvent extends Equatable {
  const VaccinationEvent();

  @override
  List<Object> get props => [];
}

class GetVaccinationDetails extends VaccinationEvent {
  final String idNumber;

  GetVaccinationDetails({@required this.idNumber});
  @override
  List<Object> get props => [idNumber];
}
