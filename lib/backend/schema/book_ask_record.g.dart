// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_ask_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BookAskRecord> _$bookAskRecordSerializer =
    new _$BookAskRecordSerializer();

class _$BookAskRecordSerializer implements StructuredSerializer<BookAskRecord> {
  @override
  final Iterable<Type> types = const [BookAskRecord, _$BookAskRecord];
  @override
  final String wireName = 'BookAskRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, BookAskRecord object,
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
    value = object.author;
    if (value != null) {
      result
        ..add('author')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.askAt;
    if (value != null) {
      result
        ..add('ask_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.askBy;
    if (value != null) {
      result
        ..add('ask_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.thumbBy;
    if (value != null) {
      result
        ..add('thumb_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
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
  BookAskRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BookAskRecordBuilder();

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
        case 'author':
          result.author = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ask_at':
          result.askAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'ask_by':
          result.askBy = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'thumb_by':
          result.thumbBy.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
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

class _$BookAskRecord extends BookAskRecord {
  @override
  final String title;
  @override
  final String author;
  @override
  final DateTime askAt;
  @override
  final DocumentReference<Object> askBy;
  @override
  final BuiltList<DocumentReference<Object>> thumbBy;
  @override
  final DocumentReference<Object> reference;

  factory _$BookAskRecord([void Function(BookAskRecordBuilder) updates]) =>
      (new BookAskRecordBuilder()..update(updates))._build();

  _$BookAskRecord._(
      {this.title,
      this.author,
      this.askAt,
      this.askBy,
      this.thumbBy,
      this.reference})
      : super._();

  @override
  BookAskRecord rebuild(void Function(BookAskRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BookAskRecordBuilder toBuilder() => new BookAskRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BookAskRecord &&
        title == other.title &&
        author == other.author &&
        askAt == other.askAt &&
        askBy == other.askBy &&
        thumbBy == other.thumbBy &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, title.hashCode), author.hashCode),
                    askAt.hashCode),
                askBy.hashCode),
            thumbBy.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BookAskRecord')
          ..add('title', title)
          ..add('author', author)
          ..add('askAt', askAt)
          ..add('askBy', askBy)
          ..add('thumbBy', thumbBy)
          ..add('reference', reference))
        .toString();
  }
}

class BookAskRecordBuilder
    implements Builder<BookAskRecord, BookAskRecordBuilder> {
  _$BookAskRecord _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _author;
  String get author => _$this._author;
  set author(String author) => _$this._author = author;

  DateTime _askAt;
  DateTime get askAt => _$this._askAt;
  set askAt(DateTime askAt) => _$this._askAt = askAt;

  DocumentReference<Object> _askBy;
  DocumentReference<Object> get askBy => _$this._askBy;
  set askBy(DocumentReference<Object> askBy) => _$this._askBy = askBy;

  ListBuilder<DocumentReference<Object>> _thumbBy;
  ListBuilder<DocumentReference<Object>> get thumbBy =>
      _$this._thumbBy ??= new ListBuilder<DocumentReference<Object>>();
  set thumbBy(ListBuilder<DocumentReference<Object>> thumbBy) =>
      _$this._thumbBy = thumbBy;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  BookAskRecordBuilder() {
    BookAskRecord._initializeBuilder(this);
  }

  BookAskRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _author = $v.author;
      _askAt = $v.askAt;
      _askBy = $v.askBy;
      _thumbBy = $v.thumbBy?.toBuilder();
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BookAskRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BookAskRecord;
  }

  @override
  void update(void Function(BookAskRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  BookAskRecord build() => _build();

  _$BookAskRecord _build() {
    _$BookAskRecord _$result;
    try {
      _$result = _$v ??
          new _$BookAskRecord._(
              title: title,
              author: author,
              askAt: askAt,
              askBy: askBy,
              thumbBy: _thumbBy?.build(),
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'thumbBy';
        _thumbBy?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'BookAskRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
