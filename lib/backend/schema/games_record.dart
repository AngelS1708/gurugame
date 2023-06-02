import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GamesRecord extends FirestoreRecord {
  GamesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "generos" field.
  String? _generos;
  String get generos => _generos ?? '';
  bool hasGeneros() => _generos != null;

  // "desarrolladora" field.
  String? _desarrolladora;
  String get desarrolladora => _desarrolladora ?? '';
  bool hasDesarrolladora() => _desarrolladora != null;

  // "distribuidora" field.
  String? _distribuidora;
  String get distribuidora => _distribuidora ?? '';
  bool hasDistribuidora() => _distribuidora != null;

  // "plataformas" field.
  String? _plataformas;
  String get plataformas => _plataformas ?? '';
  bool hasPlataformas() => _plataformas != null;

  // "metacriticScore" field.
  int? _metacriticScore;
  int get metacriticScore => _metacriticScore ?? 0;
  bool hasMetacriticScore() => _metacriticScore != null;

  // "urlImage" field.
  String? _urlImage;
  String get urlImage => _urlImage ?? '';
  bool hasUrlImage() => _urlImage != null;

  // "fechaLanzamiento" field.
  String? _fechaLanzamiento;
  String get fechaLanzamiento => _fechaLanzamiento ?? '';
  bool hasFechaLanzamiento() => _fechaLanzamiento != null;

  // "usersCompletados" field.
  List<String>? _usersCompletados;
  List<String> get usersCompletados => _usersCompletados ?? const [];
  bool hasUsersCompletados() => _usersCompletados != null;

  // "usersEnEspera" field.
  List<String>? _usersEnEspera;
  List<String> get usersEnEspera => _usersEnEspera ?? const [];
  bool hasUsersEnEspera() => _usersEnEspera != null;

  // "usersEnCurso" field.
  List<String>? _usersEnCurso;
  List<String> get usersEnCurso => _usersEnCurso ?? const [];
  bool hasUsersEnCurso() => _usersEnCurso != null;

  // "usersFavoritos" field.
  List<String>? _usersFavoritos;
  List<String> get usersFavoritos => _usersFavoritos ?? const [];
  bool hasUsersFavoritos() => _usersFavoritos != null;

  // "usersAbandonados" field.
  List<String>? _usersAbandonados;
  List<String> get usersAbandonados => _usersAbandonados ?? const [];
  bool hasUsersAbandonados() => _usersAbandonados != null;

  void _initializeFields() {
    _titulo = snapshotData['titulo'] as String?;
    _descripcion = snapshotData['descripcion'] as String?;
    _generos = snapshotData['generos'] as String?;
    _desarrolladora = snapshotData['desarrolladora'] as String?;
    _distribuidora = snapshotData['distribuidora'] as String?;
    _plataformas = snapshotData['plataformas'] as String?;
    _metacriticScore = snapshotData['metacriticScore'] as int?;
    _urlImage = snapshotData['urlImage'] as String?;
    _fechaLanzamiento = snapshotData['fechaLanzamiento'] as String?;
    _usersCompletados = getDataList(snapshotData['usersCompletados']);
    _usersEnEspera = getDataList(snapshotData['usersEnEspera']);
    _usersEnCurso = getDataList(snapshotData['usersEnCurso']);
    _usersFavoritos = getDataList(snapshotData['usersFavoritos']);
    _usersAbandonados = getDataList(snapshotData['usersAbandonados']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('games');

  static Stream<GamesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GamesRecord.fromSnapshot(s));

  static Future<GamesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GamesRecord.fromSnapshot(s));

  static GamesRecord fromSnapshot(DocumentSnapshot snapshot) => GamesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GamesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GamesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GamesRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createGamesRecordData({
  String? titulo,
  String? descripcion,
  String? generos,
  String? desarrolladora,
  String? distribuidora,
  String? plataformas,
  int? metacriticScore,
  String? urlImage,
  String? fechaLanzamiento,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titulo': titulo,
      'descripcion': descripcion,
      'generos': generos,
      'desarrolladora': desarrolladora,
      'distribuidora': distribuidora,
      'plataformas': plataformas,
      'metacriticScore': metacriticScore,
      'urlImage': urlImage,
      'fechaLanzamiento': fechaLanzamiento,
    }.withoutNulls,
  );

  return firestoreData;
}
