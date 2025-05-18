import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firestore/firestore_service.dart';

final sl = GetIt.instance;

Future<void> initFirebaseModule() async {
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  sl.registerLazySingleton<FirestoreService>(() => FirestoreService(sl()));
}
