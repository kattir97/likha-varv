import 'package:freezed_annotation/freezed_annotation.dart';

part 'word.freezed.dart';
part 'word.g.dart';

@freezed
class Word with _$Word {
  const factory Word({
    required String? headword,
    required String? language,
    required String? ipa,
    required List<Definition>? definitions,
    required List<WordForm>? forms,
    required List<String>? tags,
  }) = _Word;

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);
}

@freezed
class Definition with _$Definition {
  const factory Definition({
    required String? translation,
    required List<String>? tags,
  }) = _Definition;

  factory Definition.fromJson(Map<String, dynamic> json) =>
      _$DefinitionFromJson(json);
}

@freezed
class WordForm with _$WordForm {
  const factory WordForm({
    required String? meaning,
    required String? text,
  }) = _WordForm;

  factory WordForm.fromJson(Map<String, dynamic> json) =>
      _$WordFormFromJson(json);
}
