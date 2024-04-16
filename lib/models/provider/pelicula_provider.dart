// ignore_for_file: empty_catches

import 'package:cinesmaracaibo/models/usuarios/peliculas.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PeliculaProvider {
  late CollectionReference _ref;

  PeliculaProvider() {
    _ref = FirebaseFirestore.instance.collection('peliculas');
  }

  Future<String?> create(Peliculas pelicula) async {
    try {
      String id = _ref.doc().id;
      pelicula.id = id;

      await _ref.doc(pelicula.id).set(pelicula.toJson());
      return id;
    } catch (error) {}
    return null;
  }

  Stream<DocumentSnapshot> getByIdStream(String id) {
    return _ref.doc(id).snapshots(includeMetadataChanges: true);
  }

  Future<Peliculas?> getById(String id) async {
    DocumentSnapshot document = await _ref.doc(id).get();

    if (document.exists) {
      Peliculas trabajador =
          Peliculas.fromJson(document.data() as Map<String, dynamic>);
      return trabajador;
    }
    return null;
  }

  Future<void> update(Map<String, dynamic> data, String id) {
    return _ref.doc(id).update(data);
  }

  Future<void> delete(String id) {
    return _ref.doc(id).delete();
  }
}
