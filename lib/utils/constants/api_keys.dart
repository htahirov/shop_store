class ApiKeys {
  ApiKeys._();

  static const baseUrl = 'https://rmusayevr.pythonanywhere.com';
  static const _accounts = '$baseUrl/accounts';
  static const _product = '$baseUrl/store';
  static const _base = '$baseUrl/base';

  static const login = '$_accounts/login/';
  static const register = '$_accounts/register/';
  static const product = '$_product/';
  static const productCategories = '$_base/category/list/';
}
