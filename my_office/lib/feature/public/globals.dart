class Globals {
  static var gmail;

  static var id;
  static var isLogin = false;
  static var seasonId;

  static var phone;

  static var firstname;

  static var lastname;

  static changeGmail(String a) {
    gmail = a;
  }

  static getgmail() {
    return gmail;
  }

  static changeUserPhone(String a) {
    phone = a;
  }

  static getUserPhone() {
    return phone;
  }

  static changeFirstName(String a) {
    firstname = a;
  }

  static getFirstName() {
    return firstname;
  }

  static changeLastName(String a) {
    lastname = a;
  }

  static getLastName() {
    return lastname;
  }

  static changeIsLogin(bool a) {
    isLogin = a;
  }

  static getIsLogin() {
    return isLogin;
  }
}
