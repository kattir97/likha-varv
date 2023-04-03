import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_from.freezed.dart';
part 'word_from.g.dart';

@freezed
class WordForm with _$WordForm {
  const factory WordForm({
    required String? meaning,
    required String? text,
  }) = _WordForm;

  factory WordForm.fromJson(Map<String, dynamic> json) =>
      _$WordFormFromJson(json);
}
