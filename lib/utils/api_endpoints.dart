class ApiEndPoints {
  static const String baseUrl = 'https://api-x-robot.future-developers.cloud/api/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'auth/register';
  final String loginEmail = 'auth/login';
}
