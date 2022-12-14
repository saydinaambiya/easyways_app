import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easyplane_app/models/destination_model.dart';
import 'package:easyplane_app/services/destination_service.dart';
import 'package:equatable/equatable.dart';

part 'destination_state.dart';

class DestinationCubit extends Cubit<DestinationState> {
  DestinationCubit() : super(DestinationInitial());

  void fetchDestinations() async {
    try {
      emit(DestinationLoading());

      List<DestinationModel> destinations =
          await DestinationService().fetchDestinations();
      emit(DestinationSuccess(destinations));
    } catch (e) {
      emit(DestinationFailed(e.toString()));
    }
  }
}
