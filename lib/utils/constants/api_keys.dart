class ApiKeys {
  ApiKeys._();
  
  static const _baseUrl = 'https://rmusayevr.pythonanywhere.com';
  static const _accounts = '$_baseUrl/accounts';
  static const _store = '$_baseUrl/store';
  static const _product = '$_baseUrl/store';
  static const _base = '$_baseUrl/base';
  
  static const login = '$_accounts/login/';
  static const register = '$_accounts/register/';
  static const product = '$_product/';
  static const productCategories = '$_base/category/list/';
  static const productDetail = '$_store/detail/';
}
