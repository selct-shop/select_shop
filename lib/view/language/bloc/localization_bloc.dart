import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:select_shop/core/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(LocalizationState.initial()) {
    on<LoadSavedLocalizationEvent>(getLanguage);
    on<LoadLocalizationEvent>(changeLanguage);
  }

  void changeLanguage(LoadLocalizationEvent event, Emitter<LocalizationState> emit) {
    if (event.locale == state.locale) return;
    saveLocale(event.locale);
    emit(LocalizationState(event.locale));
  }

  Future<void> getLanguage(
      LoadSavedLocalizationEvent event, Emitter<LocalizationState> emit) async {
    Locale saveLocale = await getLocale();
    emit(LocalizationState(saveLocale));
  }

  saveLocale(Locale locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(AppConstants.cachedUserLang, locale.languageCode);
  }

  Future<Locale> getLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString(AppConstants.cachedUserLang) ?? 'en';

    print(languageCode);
    return Locale(languageCode);
  }
}