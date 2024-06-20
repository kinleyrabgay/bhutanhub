import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'personalization_event.dart';
part 'personalization_state.dart';

class PersonalizationBloc
    extends Bloc<PersonalizationEvent, PersonalizationState> {
  PersonalizationBloc() : super(PersonalizationInitial()) {
    on<PersonalizationEvent>(
      (event, emit) {},
    );
  }
}
