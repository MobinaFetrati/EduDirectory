import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/admin_auth_service.dart';

final adminAuthProvider = StateProvider<bool>((ref) {
  return false;
});

final logoutProvider = Provider((ref) {
  return () async {
    await AdminAuthService.logout();
  };
});
