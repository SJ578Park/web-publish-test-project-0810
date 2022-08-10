import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'notice_record.g.dart';

abstract class NoticeRecord
    implements Built<NoticeRecord, NoticeRecordBuilder> {
  static Serializer<NoticeRecord> get serializer => _$noticeRecordSerializer;

  @nullable
  String get title;

  @nullable
  String get contents;

  @nullable
  @BuiltValueField(wireName: 'created_by')
  String get createdBy;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  @nullable
  @BuiltValueField(wireName: 'editted_at')
  DateTime get edittedAt;

  @nullable
  String get img;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(NoticeRecordBuilder builder) => builder
    ..title = ''
    ..contents = ''
    ..createdBy = ''
    ..img = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notice');

  static Stream<NoticeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<NoticeRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  NoticeRecord._();
  factory NoticeRecord([void Function(NoticeRecordBuilder) updates]) =
      _$NoticeRecord;

  static NoticeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createNoticeRecordData({
  String title,
  String contents,
  String createdBy,
  DateTime createdAt,
  DateTime edittedAt,
  String img,
}) =>
    serializers.toFirestore(
        NoticeRecord.serializer,
        NoticeRecord((n) => n
          ..title = title
          ..contents = contents
          ..createdBy = createdBy
          ..createdAt = createdAt
          ..edittedAt = edittedAt
          ..img = img));
