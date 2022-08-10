import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'reply_record.g.dart';

abstract class ReplyRecord implements Built<ReplyRecord, ReplyRecordBuilder> {
  static Serializer<ReplyRecord> get serializer => _$replyRecordSerializer;

  @nullable
  String get replyContennts;

  @nullable
  @BuiltValueField(wireName: 'reply_by')
  DocumentReference get replyBy;

  @nullable
  @BuiltValueField(wireName: 'reply_at')
  DateTime get replyAt;

  @nullable
  String get img;

  @nullable
  @BuiltValueField(wireName: 'reply_for')
  DocumentReference get replyFor;

  @nullable
  @BuiltValueField(wireName: 'liked_by')
  BuiltList<DocumentReference> get likedBy;

  @nullable
  String get order;

  @nullable
  int get depth;

  @nullable
  int get noOfReply;

  @nullable
  BuiltList<String> get images;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ReplyRecordBuilder builder) => builder
    ..replyContennts = ''
    ..img = ''
    ..likedBy = ListBuilder()
    ..order = ''
    ..depth = 0
    ..noOfReply = 0
    ..images = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reply');

  static Stream<ReplyRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ReplyRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ReplyRecord._();
  factory ReplyRecord([void Function(ReplyRecordBuilder) updates]) =
      _$ReplyRecord;

  static ReplyRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createReplyRecordData({
  String replyContennts,
  DocumentReference replyBy,
  DateTime replyAt,
  String img,
  DocumentReference replyFor,
  String order,
  int depth,
  int noOfReply,
}) =>
    serializers.toFirestore(
        ReplyRecord.serializer,
        ReplyRecord((r) => r
          ..replyContennts = replyContennts
          ..replyBy = replyBy
          ..replyAt = replyAt
          ..img = img
          ..replyFor = replyFor
          ..likedBy = null
          ..order = order
          ..depth = depth
          ..noOfReply = noOfReply
          ..images = null));
