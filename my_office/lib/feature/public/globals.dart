class Globals {
  static late String gmail;
  static late int id;
  static bool isLogin = false;
  static late int seasonId;
  static late String phone;
  static late String firstname;
  static late String lastname;
  static late String register;
  static late String address;
  static late String password;
  static late String userId;

  static void changeGmail(String a) {
    gmail = a;
  }

  static String getGmail() {
    return gmail;
  }

  static void changeUserId(String a) {
    userId = a;
  }

  static String getUserId() {
    return userId;
  }

  static void changeRegister(String a) {
    register = a;
  }

  static String getRegister() {
    return register;
  }

  static void changeAddress(String a) {
    address = a;
  }

  static String getAddress() {
    return address;
  }

  static void changePassword(String a) {
    password = a;
  }

  static String getPassword() {
    return password;
  }

  static void changeUserPhone(String a) {
    phone = a;
  }

  static String getUserPhone() {
    return phone;
  }

  static void changeFirstName(String a) {
    firstname = a;
  }

  static String getFirstName() {
    return firstname;
  }

  static void changeLastName(String a) {
    lastname = a;
  }

  static String getLastName() {
    return lastname;
  }

  static void changeIsLogin(bool a) {
    isLogin = a;
  }

  static bool getIsLogin() {
    return isLogin;
  }
}
