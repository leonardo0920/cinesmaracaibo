// ignore_for_file: empty_catches
import 'package:cloud_firestore/cloud_firestore.dart';

import '../usuarios/horario.dart';

class HorarioProvider {
  late CollectionReference _ref;

  HorarioProvider() {
    _ref = FirebaseFirestore.instance.collection('horario');
  }

  Future<String?> create(Horario horario) async {
    try {
      String id = _ref.doc().id;
      horario.id = id;

      await _ref.doc(horario.id).set(horario.toJson());
      return id;
    } catch (error) {}
    return null;
  }

  Stream<DocumentSnapshot> getByIdStream(String id) {
    return _ref.doc(id).snapshots(includeMetadataChanges: true);
  }

  Future<Horario?> getById(String id) async {
    DocumentSnapshot document = await _ref.doc(id).get();

    if (document.exists) {
      Horario horario =
          Horario.fromJson(document.data() as Map<String, dynamic>);
      return horario;
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
