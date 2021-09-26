import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:vdds_mobile/models/vaccination_response.dart';
import 'package:vdds_mobile/repositories/vaccination_repository.dart';

part 'vaccination_event.dart';
part 'vaccination_state.dart';

class VaccinationBloc extends Bloc<VaccinationEvent, VaccinationState> {
  VaccinationBloc({
    @required this.vaccionationRepository,
    VaccinationState initialState,
   
  }) : super(initialState);
  final VaccionationRepository vaccionationRepository;

  @override
  Stream<VaccinationState> mapEventToState(VaccinationEvent event) async* {
    if (event is GetVaccinationDetails) {
      try {
        yield VaccinationLoading();
        List<VaccinationResponse> data = await vaccionationRepository.getVaccinationData(
            idNumber: event.idNumber);
        yield VaccinationLoaded(vaccinationResponseModel: data);
      } catch (e) {
        print("........................." + e.message.toString());
        yield VaccinationError(message: e.message);
      }
    }
  }
}
