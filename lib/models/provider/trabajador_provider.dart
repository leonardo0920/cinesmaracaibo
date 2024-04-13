import 'package:cinesmaracaibo/models/usuarios/trabajador.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TrabajadorProvider {
  late CollectionReference _ref;

  TrabajadorProvider() {
    _ref = FirebaseFirestore.instance.collection('trabajadores');
  }

  Future<String?> create(Trabajador trabajador) async {
    try {
      String id = _ref.doc().id;
      trabajador.id = id;

      await _ref.doc(trabajador.id).set(trabajador.toJson());
      return id;
    } catch (error) {}
    return null;
  }

  Stream<DocumentSnapshot> getByIdStream(String id) {
    return _ref.doc(id).snapshots(includeMetadataChanges: true);
  }

  Future<Trabajador?> getById(String id) async {
    DocumentSnapshot document = await _ref.doc(id).get();

    if (document.exists) {
      Trabajador trabajador =
          Trabajador.fromJson(document.data() as Map<String, dynamic>);
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
