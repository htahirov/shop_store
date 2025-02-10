class ApiKeys {
  ApiKeys._();

  static const _baseUrl = 'https://rmusayevr.pythonanywhere.com';
  static const _accounts = '$_baseUrl/accounts';
  static const _store = '$_baseUrl/store';
  
  static const login = '$_accounts/login/';
  static const register = '$_accounts/register/';
  static const productDetail = '$_store/detail/'; 
}
