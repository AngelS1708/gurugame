import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "Admin" field.
  bool? _admin;
  bool get admin => _admin ?? false;
  bool hasAdmin() => _admin != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "juegosCompletados" field.
  List<String>? _juegosCompletados;
  List<String> get juegosCompletados => _juegosCompletados ?? const [];
  bool hasJuegosCompletados() => _juegosCompletados != null;

  // "juegosEspera" field.
  List<String>? _juegosEspera;
  List<String> get juegosEspera => _juegosEspera ?? const [];
  bool hasJuegosEspera() => _juegosEspera != null;

  // "juegoAbandonados" field.
  List<String>? _juegoAbandonados;
  List<String> get juegoAbandonados => _juegoAbandonados ?? const [];
  bool hasJuegoAbandonados() => _juegoAbandonados != null;

  // "juegosEnCurso" field.
  List<String>? _juegosEnCurso;
  List<String> get juegosEnCurso => _juegosEnCurso ?? const [];
  bool hasJuegosEnCurso() => _juegosEnCurso != null;

  // "juegosFavoritos" field.
  List<String>? _juegosFavoritos;
  List<String> get juegosFavoritos => _juegosFavoritos ?? const [];
  bool hasJuegosFavoritos() => _juegosFavoritos != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _admin = snapshotData['Admin'] as bool?;
    _descripcion = snapshotData['descripcion'] as String?;
    _juegosCompletados = getDataList(snapshotData['juegosCompletados']);
    _juegosEspera = getDataList(snapshotData['juegosEspera']);
    _juegoAbandonados = getDataList(snapshotData['juegoAbandonados']);
    _juegosEnCurso = getDataList(snapshotData['juegosEnCurso']);
    _juegosFavoritos = getDataList(snapshotData['juegosFavoritos']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  bool? admin,
  String? descripcion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'Admin': admin,
      'descripcion': descripcion,
    }.withoutNulls,
  );

  return firestoreData;
}
