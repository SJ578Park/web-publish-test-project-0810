// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reply_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReplyRecord> _$replyRecordSerializer = new _$ReplyRecordSerializer();

class _$ReplyRecordSerializer implements StructuredSerializer<ReplyRecord> {
  @override
  final Iterable<Type> types = const [ReplyRecord, _$ReplyRecord];
  @override
  final String wireName = 'ReplyRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ReplyRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.replyContennts;
    if (value != null) {
      result
        ..add('replyContennts')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.replyBy;
    if (value != null) {
      result
        ..add('reply_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.replyAt;
    if (value != null) {
      result
        ..add('reply_at')
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
    value = object.replyFor;
    if (value != null) {
      result
        ..add('reply_for')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
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
    value = object.order;
    if (value != null) {
      result
        ..add('order')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.depth;
    if (value != null) {
      result
        ..add('depth')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.noOfReply;
    if (value != null) {
      result
        ..add('noOfReply')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.images;
    if (value != null) {
      result
        ..add('images')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  ReplyRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReplyRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'replyContennts':
          result.replyContennts = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'reply_by':
          result.replyBy = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'reply_at':
          result.replyAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'img':
          result.img = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'reply_for':
          result.replyFor = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'liked_by':
          result.likedBy.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'order':
          result.order = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'depth':
          result.depth = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'noOfReply':
          result.noOfReply = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
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

class _$ReplyRecord extends ReplyRecord {
  @override
  final String replyContennts;
  @override
  final DocumentReference<Object> replyBy;
  @override
  final DateTime replyAt;
  @override
  final String img;
  @override
  final DocumentReference<Object> replyFor;
  @override
  final BuiltList<DocumentReference<Object>> likedBy;
  @override
  final String order;
  @override
  final int depth;
  @override
  final int noOfReply;
  @override
  final BuiltList<String> images;
  @override
  final DocumentReference<Object> reference;

  factory _$ReplyRecord([void Function(ReplyRecordBuilder) updates]) =>
      (new ReplyRecordBuilder()..update(updates))._build();

  _$ReplyRecord._(
      {this.replyContennts,
      this.replyBy,
      this.replyAt,
      this.img,
      this.replyFor,
      this.likedBy,
      this.order,
      this.depth,
      this.noOfReply,
      this.images,
      this.reference})
      : super._();

  @override
  ReplyRecord rebuild(void Function(ReplyRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReplyRecordBuilder toBuilder() => new ReplyRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReplyRecord &&
        replyContennts == other.replyContennts &&
        replyBy == other.replyBy &&
        replyAt == other.replyAt &&
        img == other.img &&
        replyFor == other.replyFor &&
        likedBy == other.likedBy &&
        order == other.order &&
        depth == other.depth &&
        noOfReply == other.noOfReply &&
        images == other.images &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, replyContennts.hashCode),
                                            replyBy.hashCode),
                                        replyAt.hashCode),
                                    img.hashCode),
                                replyFor.hashCode),
                            likedBy.hashCode),
                        order.hashCode),
                    depth.hashCode),
                noOfReply.hashCode),
            images.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReplyRecord')
          ..add('replyContennts', replyContennts)
          ..add('replyBy', replyBy)
          ..add('replyAt', replyAt)
          ..add('img', img)
          ..add('replyFor', replyFor)
          ..add('likedBy', likedBy)
          ..add('order', order)
          ..add('depth', depth)
          ..add('noOfReply', noOfReply)
          ..add('images', images)
          ..add('reference', reference))
        .toString();
  }
}

class ReplyRecordBuilder implements Builder<ReplyRecord, ReplyRecordBuilder> {
  _$ReplyRecord _$v;

  String _replyContennts;
  String get replyContennts => _$this._replyContennts;
  set replyContennts(String replyContennts) =>
      _$this._replyContennts = replyContennts;

  DocumentReference<Object> _replyBy;
  DocumentReference<Object> get replyBy => _$this._replyBy;
  set replyBy(DocumentReference<Object> replyBy) => _$this._replyBy = replyBy;

  DateTime _replyAt;
  DateTime get replyAt => _$this._replyAt;
  set replyAt(DateTime replyAt) => _$this._replyAt = replyAt;

  String _img;
  String get img => _$this._img;
  set img(String img) => _$this._img = img;

  DocumentReference<Object> _replyFor;
  DocumentReference<Object> get replyFor => _$this._replyFor;
  set replyFor(DocumentReference<Object> replyFor) =>
      _$this._replyFor = replyFor;

  ListBuilder<DocumentReference<Object>> _likedBy;
  ListBuilder<DocumentReference<Object>> get likedBy =>
      _$this._likedBy ??= new ListBuilder<DocumentReference<Object>>();
  set likedBy(ListBuilder<DocumentReference<Object>> likedBy) =>
      _$this._likedBy = likedBy;

  String _order;
  String get order => _$this._order;
  set order(String order) => _$this._order = order;

  int _depth;
  int get depth => _$this._depth;
  set depth(int depth) => _$this._depth = depth;

  int _noOfReply;
  int get noOfReply => _$this._noOfReply;
  set noOfReply(int noOfReply) => _$this._noOfReply = noOfReply;

  ListBuilder<String> _images;
  ListBuilder<String> get images =>
      _$this._images ??= new ListBuilder<String>();
  set images(ListBuilder<String> images) => _$this._images = images;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ReplyRecordBuilder() {
    ReplyRecord._initializeBuilder(this);
  }

  ReplyRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _replyContennts = $v.replyContennts;
      _replyBy = $v.replyBy;
      _replyAt = $v.replyAt;
      _img = $v.img;
      _replyFor = $v.replyFor;
      _likedBy = $v.likedBy?.toBuilder();
      _order = $v.order;
      _depth = $v.depth;
      _noOfReply = $v.noOfReply;
      _images = $v.images?.toBuilder();
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReplyRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReplyRecord;
  }

  @override
  void update(void Function(ReplyRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ReplyRecord build() => _build();

  _$ReplyRecord _build() {
    _$ReplyRecord _$result;
    try {
      _$result = _$v ??
          new _$ReplyRecord._(
              replyContennts: replyContennts,
              replyBy: replyBy,
              replyAt: replyAt,
              img: img,
              replyFor: replyFor,
              likedBy: _likedBy?.build(),
              order: order,
              depth: depth,
              noOfReply: noOfReply,
              images: _images?.build(),
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'likedBy';
        _likedBy?.build();

        _$failedField = 'images';
        _images?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ReplyRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
