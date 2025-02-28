class ApiKeys {
  ApiKeys._();
  
  static const baseUrl = 'https://rmusayevr.pythonanywhere.com';
  static const _accounts = '$baseUrl/accounts';
  static const _store = '$baseUrl/store';
  static const _product = '$baseUrl/store';
  static const _base = '$baseUrl/base';
  static const _basket = '$baseUrl/basket';  // Added basket base endpoint
  static const _order = '$baseUrl/order';
  // Auth endpoints
  static const login = '$_accounts/login/';
  static const register = '$_accounts/register/';
  
  // Product endpoints
  static const product = '$_product/';
  static const productCategories = '$_base/category/list/';
  static const productDetail = '$_store/detail/';

  // Basket endpoints
  static const basketCreate = '$_basket/create/';
  static const basketList = '$_basket/list/';
  static const basketDelete = '$_basket/delete/';  // Note: Requires ID parameter
  static const basketUpdate = '$_basket/update/';  // Note: Requires ID parameter

  
  //Favorite endpoints
  static const favorite = '$baseUrl/favorite/';  
  static const favoriteCreate = '$baseUrl/favorite/create/';  

  // Order endpoints
  static const orderCreate = '$_order/create/';
  static const orderCancel = '$_order/cancel/';
  static const orderCheckPromo = '$_order/check/promo/code/';
  static const orderDetail = '$_order/detail/';
  static const orderList = '$_order/list/';
  static const orderTrack = '$_order/track/';

  //Settings
  static const settingsPrivacy = '$baseUrl/privacy/';  

}

