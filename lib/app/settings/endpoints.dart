// ignore_for_file: constant_identifier_names

abstract class Endpoints {
  static const String API_URL = 'https://dummyjson.com/auth';
  static const String IAM_URL = 'https://10.0.2.2:44321/api';

  //Auth
  static const String LOGIN = '$API_URL/login';
  static const String REGISTER = '$IAM_URL/iam/authentication/register';
  static const String USER_PROFILE = '$API_URL/users?lastAccess=true';
  static const String UPDATE_USER_PROFILE = '$API_URL/user';
  static const String REFRESH_TOKEN = '$IAM_URL/iam/authentication/refresh';
  static const String UPLOAD_PHOTO = '$API_URL/storage/upload';
  static const String FORGOT_PASSWORD = '$API_URL/user/forgot-password';

  //Notification
  static const String NOTIFICATION = '$API_URL/notifications';

  // ReceiveTimeout
  static const int RECEIVE_TIMEOUT = 15000;

  // ConnectTimeout
  static const int CONNECTION_TIMEOUT = 15000;
}
