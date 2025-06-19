class URLs {
  const URLs();
  static String baseURL = 'https://dummyjson.com/';
  static String imageBaseURL = '';
  static String subscriptionURL = '';
  static bool isProduction = false;
}

class EndPoints {
  static const login = 'auth/login';
  static const getProducts = 'products';
  static const getProductsDetails = 'products/';
  static const getCategory = 'products/categories';
  static const getCategoryProductList = 'products/category/';
  static const getUserProfile = 'user/15';
  static const getPosts = 'posts?limit=';
  static const getTodos = 'todos?limit=';
  static const getQuotes = 'quotes?limit=';
}
