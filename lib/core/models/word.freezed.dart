// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Word _$WordFromJson(Map<String, dynamic> json) {
  return _Word.fromJson(json);
}

/// @nodoc
mixin _$Word {
  String? get headword => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  String? get ipa => throw _privateConstructorUsedError;
  List<Definition>? get definitions => throw _privateConstructorUsedError;
  List<WordForm>? get forms => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordCopyWith<Word> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordCopyWith<$Res> {
  factory $WordCopyWith(Word value, $Res Function(Word) then) =
      _$WordCopyWithImpl<$Res, Word>;
  @useResult
  $Res call(
      {String? headword,
      String? language,
      String? ipa,
      List<Definition>? definitions,
      List<WordForm>? forms,
      List<String>? tags});
}

/// @nodoc
class _$WordCopyWithImpl<$Res, $Val extends Word>
    implements $WordCopyWith<$Res> {
  _$WordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? headword = freezed,
    Object? language = freezed,
    Object? ipa = freezed,
    Object? definitions = freezed,
    Object? forms = freezed,
    Object? tags = freezed,
  }) {
    return _then(_value.copyWith(
      headword: freezed == headword
          ? _value.headword
          : headword // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      ipa: freezed == ipa
          ? _value.ipa
          : ipa // ignore: cast_nullable_to_non_nullable
              as String?,
      definitions: freezed == definitions
          ? _value.definitions
          : definitions // ignore: cast_nullable_to_non_nullable
              as List<Definition>?,
      forms: freezed == forms
          ? _value.forms
          : forms // ignore: cast_nullable_to_non_nullable
              as List<WordForm>?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WordCopyWith<$Res> implements $WordCopyWith<$Res> {
  factory _$$_WordCopyWith(_$_Word value, $Res Function(_$_Word) then) =
      __$$_WordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? headword,
      String? language,
      String? ipa,
      List<Definition>? definitions,
      List<WordForm>? forms,
      List<String>? tags});
}

/// @nodoc
class __$$_WordCopyWithImpl<$Res> extends _$WordCopyWithImpl<$Res, _$_Word>
    implements _$$_WordCopyWith<$Res> {
  __$$_WordCopyWithImpl(_$_Word _value, $Res Function(_$_Word) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? headword = freezed,
    Object? language = freezed,
    Object? ipa = freezed,
    Object? definitions = freezed,
    Object? forms = freezed,
    Object? tags = freezed,
  }) {
    return _then(_$_Word(
      headword: freezed == headword
          ? _value.headword
          : headword // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      ipa: freezed == ipa
          ? _value.ipa
          : ipa // ignore: cast_nullable_to_non_nullable
              as String?,
      definitions: freezed == definitions
          ? _value._definitions
          : definitions // ignore: cast_nullable_to_non_nullable
              as List<Definition>?,
      forms: freezed == forms
          ? _value._forms
          : forms // ignore: cast_nullable_to_non_nullable
              as List<WordForm>?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Word implements _Word {
  const _$_Word(
      {required this.headword,
      required this.language,
      required this.ipa,
      required final List<Definition>? definitions,
      required final List<WordForm>? forms,
      required final List<String>? tags})
      : _definitions = definitions,
        _forms = forms,
        _tags = tags;

  factory _$_Word.fromJson(Map<String, dynamic> json) => _$$_WordFromJson(json);

  @override
  final String? headword;
  @override
  final String? language;
  @override
  final String? ipa;
  final List<Definition>? _definitions;
  @override
  List<Definition>? get definitions {
    final value = _definitions;
    if (value == null) return null;
    if (_definitions is EqualUnmodifiableListView) return _definitions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<WordForm>? _forms;
  @override
  List<WordForm>? get forms {
    final value = _forms;
    if (value == null) return null;
    if (_forms is EqualUnmodifiableListView) return _forms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Word(headword: $headword, language: $language, ipa: $ipa, definitions: $definitions, forms: $forms, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Word &&
            (identical(other.headword, headword) ||
                other.headword == headword) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.ipa, ipa) || other.ipa == ipa) &&
            const DeepCollectionEquality()
                .equals(other._definitions, _definitions) &&
            const DeepCollectionEquality().equals(other._forms, _forms) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      headword,
      language,
      ipa,
      const DeepCollectionEquality().hash(_definitions),
      const DeepCollectionEquality().hash(_forms),
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WordCopyWith<_$_Word> get copyWith =>
      __$$_WordCopyWithImpl<_$_Word>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WordToJson(
      this,
    );
  }
}

abstract class _Word implements Word {
  const factory _Word(
      {required final String? headword,
      required final String? language,
      required final String? ipa,
      required final List<Definition>? definitions,
      required final List<WordForm>? forms,
      required final List<String>? tags}) = _$_Word;

  factory _Word.fromJson(Map<String, dynamic> json) = _$_Word.fromJson;

  @override
  String? get headword;
  @override
  String? get language;
  @override
  String? get ipa;
  @override
  List<Definition>? get definitions;
  @override
  List<WordForm>? get forms;
  @override
  List<String>? get tags;
  @override
  @JsonKey(ignore: true)
  _$$_WordCopyWith<_$_Word> get copyWith => throw _privateConstructorUsedError;
}

Definition _$DefinitionFromJson(Map<String, dynamic> json) {
  return _Definition.fromJson(json);
}

/// @nodoc
mixin _$Definition {
  String? get translation => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DefinitionCopyWith<Definition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefinitionCopyWith<$Res> {
  factory $DefinitionCopyWith(
          Definition value, $Res Function(Definition) then) =
      _$DefinitionCopyWithImpl<$Res, Definition>;
  @useResult
  $Res call({String? translation, List<String>? tags});
}

/// @nodoc
class _$DefinitionCopyWithImpl<$Res, $Val extends Definition>
    implements $DefinitionCopyWith<$Res> {
  _$DefinitionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? translation = freezed,
    Object? tags = freezed,
  }) {
    return _then(_value.copyWith(
      translation: freezed == translation
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DefinitionCopyWith<$Res>
    implements $DefinitionCopyWith<$Res> {
  factory _$$_DefinitionCopyWith(
          _$_Definition value, $Res Function(_$_Definition) then) =
      __$$_DefinitionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? translation, List<String>? tags});
}

/// @nodoc
class __$$_DefinitionCopyWithImpl<$Res>
    extends _$DefinitionCopyWithImpl<$Res, _$_Definition>
    implements _$$_DefinitionCopyWith<$Res> {
  __$$_DefinitionCopyWithImpl(
      _$_Definition _value, $Res Function(_$_Definition) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? translation = freezed,
    Object? tags = freezed,
  }) {
    return _then(_$_Definition(
      translation: freezed == translation
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Definition implements _Definition {
  const _$_Definition(
      {required this.translation, required final List<String>? tags})
      : _tags = tags;

  factory _$_Definition.fromJson(Map<String, dynamic> json) =>
      _$$_DefinitionFromJson(json);

  @override
  final String? translation;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Definition(translation: $translation, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Definition &&
            (identical(other.translation, translation) ||
                other.translation == translation) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, translation, const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DefinitionCopyWith<_$_Definition> get copyWith =>
      __$$_DefinitionCopyWithImpl<_$_Definition>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DefinitionToJson(
      this,
    );
  }
}

abstract class _Definition implements Definition {
  const factory _Definition(
      {required final String? translation,
      required final List<String>? tags}) = _$_Definition;

  factory _Definition.fromJson(Map<String, dynamic> json) =
      _$_Definition.fromJson;

  @override
  String? get translation;
  @override
  List<String>? get tags;
  @override
  @JsonKey(ignore: true)
  _$$_DefinitionCopyWith<_$_Definition> get copyWith =>
      throw _privateConstructorUsedError;
}

WordForm _$WordFormFromJson(Map<String, dynamic> json) {
  return _WordForm.fromJson(json);
}

/// @nodoc
mixin _$WordForm {
  String? get meaning => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordFormCopyWith<WordForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordFormCopyWith<$Res> {
  factory $WordFormCopyWith(WordForm value, $Res Function(WordForm) then) =
      _$WordFormCopyWithImpl<$Res, WordForm>;
  @useResult
  $Res call({String? meaning, String? text});
}

/// @nodoc
class _$WordFormCopyWithImpl<$Res, $Val extends WordForm>
    implements $WordFormCopyWith<$Res> {
  _$WordFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meaning = freezed,
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      meaning: freezed == meaning
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WordFormCopyWith<$Res> implements $WordFormCopyWith<$Res> {
  factory _$$_WordFormCopyWith(
          _$_WordForm value, $Res Function(_$_WordForm) then) =
      __$$_WordFormCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? meaning, String? text});
}

/// @nodoc
class __$$_WordFormCopyWithImpl<$Res>
    extends _$WordFormCopyWithImpl<$Res, _$_WordForm>
    implements _$$_WordFormCopyWith<$Res> {
  __$$_WordFormCopyWithImpl(
      _$_WordForm _value, $Res Function(_$_WordForm) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meaning = freezed,
    Object? text = freezed,
  }) {
    return _then(_$_WordForm(
      meaning: freezed == meaning
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WordForm implements _WordForm {
  const _$_WordForm({required this.meaning, required this.text});

  factory _$_WordForm.fromJson(Map<String, dynamic> json) =>
      _$$_WordFormFromJson(json);

  @override
  final String? meaning;
  @override
  final String? text;

  @override
  String toString() {
    return 'WordForm(meaning: $meaning, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WordForm &&
            (identical(other.meaning, meaning) || other.meaning == meaning) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, meaning, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WordFormCopyWith<_$_WordForm> get copyWith =>
      __$$_WordFormCopyWithImpl<_$_WordForm>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WordFormToJson(
      this,
    );
  }
}

abstract class _WordForm implements WordForm {
  const factory _WordForm(
      {required final String? meaning,
      required final String? text}) = _$_WordForm;

  factory _WordForm.fromJson(Map<String, dynamic> json) = _$_WordForm.fromJson;

  @override
  String? get meaning;
  @override
  String? get text;
  @override
  @JsonKey(ignore: true)
  _$$_WordFormCopyWith<_$_WordForm> get copyWith =>
      throw _privateConstructorUsedError;
}
