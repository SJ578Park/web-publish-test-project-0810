// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BooksRecord> _$booksRecordSerializer = new _$BooksRecordSerializer();

class _$BooksRecordSerializer implements StructuredSerializer<BooksRecord> {
  @override
  final Iterable<Type> types = const [BooksRecord, _$BooksRecord];
  @override
  final String wireName = 'BooksRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, BooksRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.book;
    if (value != null) {
      result
        ..add('book')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.likedBy;
    if (value != null) {
      result
        ..add('liked_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.noOfReply;
    if (value != null) {
      result
        ..add('noOfReply')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
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
  BooksRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BooksRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'book':
          result.book = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'liked_by':
          result.likedBy.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'noOfReply':
          result.noOfReply = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
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

class _$BooksRecord extends BooksRecord {
  @override
  final String book;
  @override
  final String category;
  @override
  final BuiltList<DocumentReference<Object>> likedBy;
  @override
  final int noOfReply;
  @override
  final String date;
  @override
  final DocumentReference<Object> reference;

  factory _$BooksRecord([void Function(BooksRecordBuilder) updates]) =>
      (new BooksRecordBuilder()..update(updates))._build();

  _$BooksRecord._(
      {this.book,
      this.category,
      this.likedBy,
      this.noOfReply,
      this.date,
      this.reference})
      : super._();

  @override
  BooksRecord rebuild(void Function(BooksRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BooksRecordBuilder toBuilder() => new BooksRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BooksRecord &&
        book == other.book &&
        category == other.category &&
        likedBy == other.likedBy &&
        noOfReply == other.noOfReply &&
        date == other.date &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, book.hashCode), category.hashCode),
                    likedBy.hashCode),
                noOfReply.hashCode),
            date.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BooksRecord')
          ..add('book', book)
          ..add('category', category)
          ..add('likedBy', likedBy)
          ..add('noOfReply', noOfReply)
          ..add('date', date)
          ..add('reference', reference))
        .toString();
  }
}

class BooksRecordBuilder implements Builder<BooksRecord, BooksRecordBuilder> {
  _$BooksRecord _$v;

  String _book;
  String get book => _$this._book;
  set book(String book) => _$this._book = book;

  String _category;
  String get category => _$this._category;
  set category(String category) => _$this._category = category;

  ListBuilder<DocumentReference<Object>> _likedBy;
  ListBuilder<DocumentReference<Object>> get likedBy =>
      _$this._likedBy ??= new ListBuilder<DocumentReference<Object>>();
  set likedBy(ListBuilder<DocumentReference<Object>> likedBy) =>
      _$this._likedBy = likedBy;

  int _noOfReply;
  int get noOfReply => _$this._noOfReply;
  set noOfReply(int noOfReply) => _$this._noOfReply = noOfReply;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  BooksRecordBuilder() {
    BooksRecord._initializeBuilder(this);
  }

  BooksRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _book = $v.book;
      _category = $v.category;
      _likedBy = $v.likedBy?.toBuilder();
      _noOfReply = $v.noOfReply;
      _date = $v.date;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BooksRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BooksRecord;
  }

  @override
  void update(void Function(BooksRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  BooksRecord build() => _build();

  _$BooksRecord _build() {
    _$BooksRecord _$result;
    try {
      _$result = _$v ??
          new _$BooksRecord._(
              book: book,
              category: category,
              likedBy: _likedBy?.build(),
              noOfReply: noOfReply,
              date: date,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'likedBy';
        _likedBy?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'BooksRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
