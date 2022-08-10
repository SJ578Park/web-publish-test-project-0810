import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'book_ask_record.g.dart';

abstract class BookAskRecord
    implements Built<BookAskRecord, BookAskRecordBuilder> {
  static Serializer<BookAskRecord> get serializer => _$bookAskRecordSerializer;

  @nullable
  String get title;

  @nullable
  String get author;

  @nullable
  @BuiltValueField(wireName: 'ask_at')
  DateTime get askAt;

  @nullable
  @BuiltValueField(wireName: 'ask_by')
  DocumentReference get askBy;

  @nullable
  @BuiltValueField(wireName: 'thumb_by')
  BuiltList<DocumentReference> get thumbBy;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BookAskRecordBuilder builder) => builder
    ..title = ''
    ..author = ''
    ..thumbBy = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bookAsk');

  static Stream<BookAskRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BookAskRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  BookAskRecord._();
  factory BookAskRecord([void Function(BookAskRecordBuilder) updates]) =
      _$BookAskRecord;

  static BookAskRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBookAskRecordData({
  String title,
  String author,
  DateTime askAt,
  DocumentReference askBy,
}) =>
    serializers.toFirestore(
        BookAskRecord.serializer,
        BookAskRecord((b) => b
          ..title = title
          ..author = author
          ..askAt = askAt
          ..askBy = askBy
          ..thumbBy = null));
