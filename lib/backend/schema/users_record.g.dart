// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.role;
    if (value != null) {
      result
        ..add('role')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pass;
    if (value != null) {
      result
        ..add('pass')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.hasPhoto;
    if (value != null) {
      result
        ..add('hasPhoto')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.blockedUsers;
    if (value != null) {
      result
        ..add('blockedUsers')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.apartment;
    if (value != null) {
      result
        ..add('apartment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.roomNum;
    if (value != null) {
      result
        ..add('roomNum')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.kakaoUrl;
    if (value != null) {
      result
        ..add('kakaoUrl')
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
  UsersRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'role':
          result.role = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'pass':
          result.pass = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'hasPhoto':
          result.hasPhoto = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'blockedUsers':
          result.blockedUsers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'apartment':
          result.apartment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'roomNum':
          result.roomNum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'kakaoUrl':
          result.kakaoUrl = serializers.deserialize(value,
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

class _$UsersRecord extends UsersRecord {
  @override
  final String email;
  @override
  final String displayName;
  @override
  final String photoUrl;
  @override
  final String uid;
  @override
  final DateTime createdTime;
  @override
  final String phoneNumber;
  @override
  final int role;
  @override
  final String pass;
  @override
  final bool hasPhoto;
  @override
  final BuiltList<DocumentReference<Object>> blockedUsers;
  @override
  final String apartment;
  @override
  final String roomNum;
  @override
  final String kakaoUrl;
  @override
  final DocumentReference<Object> reference;

  factory _$UsersRecord([void Function(UsersRecordBuilder) updates]) =>
      (new UsersRecordBuilder()..update(updates))._build();

  _$UsersRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.role,
      this.pass,
      this.hasPhoto,
      this.blockedUsers,
      this.apartment,
      this.roomNum,
      this.kakaoUrl,
      this.reference})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        role == other.role &&
        pass == other.pass &&
        hasPhoto == other.hasPhoto &&
        blockedUsers == other.blockedUsers &&
        apartment == other.apartment &&
        roomNum == other.roomNum &&
        kakaoUrl == other.kakaoUrl &&
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
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc($jc(0, email.hashCode),
                                                        displayName.hashCode),
                                                    photoUrl.hashCode),
                                                uid.hashCode),
                                            createdTime.hashCode),
                                        phoneNumber.hashCode),
                                    role.hashCode),
                                pass.hashCode),
                            hasPhoto.hashCode),
                        blockedUsers.hashCode),
                    apartment.hashCode),
                roomNum.hashCode),
            kakaoUrl.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('role', role)
          ..add('pass', pass)
          ..add('hasPhoto', hasPhoto)
          ..add('blockedUsers', blockedUsers)
          ..add('apartment', apartment)
          ..add('roomNum', roomNum)
          ..add('kakaoUrl', kakaoUrl)
          ..add('reference', reference))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord _$v;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  DateTime _createdTime;
  DateTime get createdTime => _$this._createdTime;
  set createdTime(DateTime createdTime) => _$this._createdTime = createdTime;

  String _phoneNumber;
  String get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String phoneNumber) => _$this._phoneNumber = phoneNumber;

  int _role;
  int get role => _$this._role;
  set role(int role) => _$this._role = role;

  String _pass;
  String get pass => _$this._pass;
  set pass(String pass) => _$this._pass = pass;

  bool _hasPhoto;
  bool get hasPhoto => _$this._hasPhoto;
  set hasPhoto(bool hasPhoto) => _$this._hasPhoto = hasPhoto;

  ListBuilder<DocumentReference<Object>> _blockedUsers;
  ListBuilder<DocumentReference<Object>> get blockedUsers =>
      _$this._blockedUsers ??= new ListBuilder<DocumentReference<Object>>();
  set blockedUsers(ListBuilder<DocumentReference<Object>> blockedUsers) =>
      _$this._blockedUsers = blockedUsers;

  String _apartment;
  String get apartment => _$this._apartment;
  set apartment(String apartment) => _$this._apartment = apartment;

  String _roomNum;
  String get roomNum => _$this._roomNum;
  set roomNum(String roomNum) => _$this._roomNum = roomNum;

  String _kakaoUrl;
  String get kakaoUrl => _$this._kakaoUrl;
  set kakaoUrl(String kakaoUrl) => _$this._kakaoUrl = kakaoUrl;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _role = $v.role;
      _pass = $v.pass;
      _hasPhoto = $v.hasPhoto;
      _blockedUsers = $v.blockedUsers?.toBuilder();
      _apartment = $v.apartment;
      _roomNum = $v.roomNum;
      _kakaoUrl = $v.kakaoUrl;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersRecord build() => _build();

  _$UsersRecord _build() {
    _$UsersRecord _$result;
    try {
      _$result = _$v ??
          new _$UsersRecord._(
              email: email,
              displayName: displayName,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              phoneNumber: phoneNumber,
              role: role,
              pass: pass,
              hasPhoto: hasPhoto,
              blockedUsers: _blockedUsers?.build(),
              apartment: apartment,
              roomNum: roomNum,
              kakaoUrl: kakaoUrl,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'blockedUsers';
        _blockedUsers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UsersRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
