class Globals {
  static var gmail;

  static var id;
  static var isLogin = false;
  static var seasonId;

  static var phone;

  static var firstname;

  static var lastname;
  static var register;
  static var address;
  static var password;

  static changeGmail(String a) {
    gmail = a;
  }

  static getgmail() {
    return gmail;
  }

  static changeRegister(String a) {
    register = a;
  }

  static getRegister() {
    return register;
  }

  static changeAddress(String a) {
    address = a;
  }

  static getAddress() {
    return address;
  }

  static changePassword(String a) {
    password = a;
  }

  static getPassword() {
    return password;
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
