import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore;

  FirestoreService(this._firestore);

  /// add and modify data
  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
    bool merge = true,
  }) async {
    final reference = _firestore.doc(path);
    await reference.set(data, SetOptions(merge: merge));
  }

  /// Get document data once
   Future<DocumentSnapshot<Map<String, dynamic>>> getDocument(String path) async {
    return await _firestore.doc(path).get();
  }

  /// Partial update of the document
  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = _firestore.doc(path);
    await reference.update(data);
  }

  /// delet doc
  Future<void> deleteDocument(String path) async {
    final reference = _firestore.doc(path);
    await reference.delete();
  }

  /// Listen to document changes
  Stream<DocumentSnapshot<Map<String, dynamic>>> documentStream(String path) {
    return _firestore.doc(path).snapshots();
  }

  /// Listen to group changes
  Stream<QuerySnapshot<Map<String, dynamic>>> collectionStream({
    required String path,
    Query<Map<String, dynamic>> Function(Query<Map<String, dynamic>> query)? builder,
  }) {
    Query<Map<String, dynamic>> query = _firestore.collection(path);
    if (builder != null) {
      query = builder(query);
    }
    return query.snapshots();
  }
}
