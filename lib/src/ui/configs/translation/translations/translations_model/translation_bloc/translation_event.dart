part of 'translation_bloc.dart';

@immutable
sealed class TranslationEvent {}

class SwitchLanguage extends TranslationEvent {
  SwitchLanguage({required this.language});
  final String language;
}
