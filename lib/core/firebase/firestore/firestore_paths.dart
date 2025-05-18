class FirestorePaths {

  static String users() => 'users';

  static String user(String userId) => 'users/$userId';

  static String userOrders(String userId) => 'users/$userId/orders';

  static String order(String orderId) => 'orders/$orderId';

  static String orders() => 'orders';

  static String comments(String postId) => 'posts/$postId/comments';

  static String categories() => 'categories';
}
