part of 'vaccination_bloc.dart';

abstract class VaccinationState extends Equatable {
  const VaccinationState();

  @override
  List<Object> get props => [];
}

class VaccinationLoading extends VaccinationState {}

class VaccinationLoaded extends VaccinationState {
  final VaccinationResponseModel vaccinationResponseModel;

  VaccinationLoaded({@required this.vaccinationResponseModel});
}

class VaccinationError extends VaccinationState {
  final String message;

  VaccinationError({@required this.message});
}
