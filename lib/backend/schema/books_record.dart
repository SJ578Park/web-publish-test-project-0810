import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'books_record.g.dart';

abstract class BooksRecord implements Built<BooksRecord, BooksRecordBuilder> {
  static Serializer<BooksRecord> get serializer => _$booksRecordSerializer;

  @nullable
  String get book;

  @nullable
  String get category;

  @nullable
  @BuiltValueField(wireName: 'liked_by')
  BuiltList<DocumentReference> get likedBy;

  @nullable
  int get noOfReply;

  @nullable
  String get date;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BooksRecordBuilder builder) => builder
    ..book = ''
    ..category = ''
    ..likedBy = ListBuilder()
    ..noOfReply = 0
    ..date = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('books');

  static Stream<BooksRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BooksRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static BooksRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => BooksRecord(
        (c) => c
          ..book = snapshot.data['book']
          ..category = snapshot.data['category']
          ..likedBy = safeGet(
              () => ListBuilder(snapshot.data['liked_by'].map((s) => toRef(s))))
          ..noOfReply = snapshot.data['noOfReply']?.round()
          ..date = snapshot.data['date']
          ..reference = BooksRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<BooksRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'books',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  BooksRecord._();
  factory BooksRecord([void Function(BooksRecordBuilder) updates]) =
      _$BooksRecord;

  static BooksRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBooksRecordData({
  String book,
  String category,
  int noOfReply,
  String date,
}) =>
    serializers.toFirestore(
        BooksRecord.serializer,
        BooksRecord((b) => b
          ..book = book
          ..category = category
          ..likedBy = null
          ..noOfReply = noOfReply
          ..date = date));
