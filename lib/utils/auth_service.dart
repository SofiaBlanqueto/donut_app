/// Autenticación local (sin servidor): valida contra una lista de usuarios.
class AuthService {
  // correo -> contraseña
  static final Map<String, String> _users = {
    'admin@donut.com': '123456',
    'user@donut.com': 'donut2026',
  };

  static String? currentUser;

  static bool get isLoggedIn => currentUser != null;

  static bool login(String email, String password) {
    final key = email.trim().toLowerCase();
    if (_users[key] == password) {
      currentUser = key;
      return true;
    }
    return false;
  }

  static void logout() {
    currentUser = null;
  }
}
