import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../global_translation.dart';
import '../language_preference.dart';

part 'translation_event.dart';
part 'translation_state.dart';

class TranslationBloc extends Bloc<TranslationEvent, TranslationState> {
  TranslationBloc(super.initialState) {
    on<SwitchLanguage>((event, emit) async {
      debugPrint(event.language);
      await preferences.setPreferredLanguage(event.language);
      await translations.setNewLanguage(event.language);
      emit(TranslationState(
        locale: translations.locale,
      ));
    });
  }

  TranslationState get initialState => TranslationState(
        locale: translations.locale,
      );
}
