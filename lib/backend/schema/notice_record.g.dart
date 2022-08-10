// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NoticeRecord> _$noticeRecordSerializer =
    new _$NoticeRecordSerializer();

class _$NoticeRecordSerializer implements StructuredSerializer<NoticeRecord> {
  @override
  final Iterable<Type> types = const [NoticeRecord, _$NoticeRecord];
  @override
  final String wireName = 'NoticeRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, NoticeRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.contents;
    if (value != null) {
      result
        ..add('contents')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdBy;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.edittedAt;
    if (value != null) {
      result
        ..add('editted_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.img;
    if (value != null) {
      result
        ..add('img')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  NoticeRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NoticeRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'contents':
          result.contents = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'editted_at':
          result.edittedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'img':
          result.img = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$NoticeRecord extends NoticeRecord {
  @override
  final String title;
  @override
  final String contents;
  @override
  final String createdBy;
  @override
  final DateTime createdAt;
  @override
  final DateTime edittedAt;
  @override
  final String img;
  @override
  final DocumentReference<Object> reference;

  factory _$NoticeRecord([void Function(NoticeRecordBuilder) updates]) =>
      (new NoticeRecordBuilder()..update(updates))._build();

  _$NoticeRecord._(
      {this.title,
      this.contents,
      this.createdBy,
      this.createdAt,
      this.edittedAt,
      this.img,
      this.reference})
      : super._();

  @override
  NoticeRecord rebuild(void Function(NoticeRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NoticeRecordBuilder toBuilder() => new NoticeRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NoticeRecord &&
        title == other.title &&
        contents == other.contents &&
        createdBy == other.createdBy &&
        createdAt == other.createdAt &&
        edittedAt == other.edittedAt &&
        img == other.img &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, title.hashCode), contents.hashCode),
                        createdBy.hashCode),
                    createdAt.hashCode),
                edittedAt.hashCode),
            img.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NoticeRecord')
          ..add('title', title)
          ..add('contents', contents)
          ..add('createdBy', createdBy)
          ..add('createdAt', createdAt)
          ..add('edittedAt', edittedAt)
          ..add('img', img)
          ..add('reference', reference))
        .toString();
  }
}

class NoticeRecordBuilder
    implements Builder<NoticeRecord, NoticeRecordBuilder> {
  _$NoticeRecord _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _contents;
  String get contents => _$this._contents;
  set contents(String contents) => _$this._contents = contents;

  String _createdBy;
  String get createdBy => _$this._createdBy;
  set createdBy(String createdBy) => _$this._createdBy = createdBy;

  DateTime _createdAt;
  DateTime get createdAt => _$this._createdAt;
  set createdAt(DateTime createdAt) => _$this._createdAt = createdAt;

  DateTime _edittedAt;
  DateTime get edittedAt => _$this._edittedAt;
  set edittedAt(DateTime edittedAt) => _$this._edittedAt = edittedAt;

  String _img;
  String get img => _$this._img;
  set img(String img) => _$this._img = img;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  NoticeRecordBuilder() {
    NoticeRecord._initializeBuilder(this);
  }

  NoticeRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _contents = $v.contents;
      _createdBy = $v.createdBy;
      _createdAt = $v.createdAt;
      _edittedAt = $v.edittedAt;
      _img = $v.img;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NoticeRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NoticeRecord;
  }

  @override
  void update(void Function(NoticeRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  NoticeRecord build() => _build();

  _$NoticeRecord _build() {
    final _$result = _$v ??
        new _$NoticeRecord._(
            title: title,
            contents: contents,
            createdBy: createdBy,
            createdAt: createdAt,
            edittedAt: edittedAt,
            img: img,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
