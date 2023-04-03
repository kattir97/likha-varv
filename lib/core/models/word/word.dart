import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:likha_varv/core/models/definition/definition.dart';
import 'package:likha_varv/core/models/word_from/word_from.dart';

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
