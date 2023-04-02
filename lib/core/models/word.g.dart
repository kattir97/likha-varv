// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Word _$$_WordFromJson(Map<String, dynamic> json) => _$_Word(
      headword: json['headword'] as String?,
      language: json['language'] as String?,
      ipa: json['ipa'] as String?,
      definitions: (json['definitions'] as List<dynamic>?)
          ?.map((e) => Definition.fromJson(e as Map<String, dynamic>))
          .toList(),
      forms: (json['forms'] as List<dynamic>?)
          ?.map((e) => WordForm.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_WordToJson(_$_Word instance) => <String, dynamic>{
      'headword': instance.headword,
      'language': instance.language,
      'ipa': instance.ipa,
      'definitions': instance.definitions,
      'forms': instance.forms,
      'tags': instance.tags,
    };

_$_Definition _$$_DefinitionFromJson(Map<String, dynamic> json) =>
    _$_Definition(
      translation: json['translation'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_DefinitionToJson(_$_Definition instance) =>
    <String, dynamic>{
      'translation': instance.translation,
      'tags': instance.tags,
    };

_$_WordForm _$$_WordFormFromJson(Map<String, dynamic> json) => _$_WordForm(
      meaning: json['meaning'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$$_WordFormToJson(_$_WordForm instance) =>
    <String, dynamic>{
      'meaning': instance.meaning,
      'text': instance.text,
    };
