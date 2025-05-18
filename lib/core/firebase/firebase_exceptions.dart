import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseExceptionHandler {
  static Exception handleFirestoreException(FirebaseException e) {
    switch (e.code) {
      case 'not-found':
        return FirestoreNotFoundException();
      case 'permission-denied':
        return FirestorePermissionDeniedException();
      case 'unavailable':
        return FirestoreUnavailableException();
      default:
        return GenericFirestoreException(e.message ?? 'خطأ غير معروف من Firestore');
    }
  }
}


class FirestoreNotFoundException implements Exception {
  final String message = 'المستند المطلوب غير موجود.';
}

class FirestorePermissionDeniedException implements Exception {
  final String message = 'ليس لديك صلاحيات للوصول إلى هذه البيانات.';
}

class FirestoreUnavailableException implements Exception {
  final String message = 'خدمة Firestore غير متاحة حالياً.';
}

class GenericFirestoreException implements Exception {
  final String message;
  GenericFirestoreException(this.message);
}
