import 'dart:convert';
import 'dart:async';

import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:rxdart/subjects.dart';

import '../models/category.dart';
import '../models/product.dart';
import '../models/user.dart';

class ConnectedProductsModel extends Model {
  List<Category> _categories = [];

  List<Product> _products = [];
  String _selCategoryId;
  String _selProductId;
  User _authenticatedUser;
  bool _isLoading = false;
}

class CategoriesModel extends ConnectedProductsModel {
  List<Category> get allCategories {
    return List.from(_categories);
  }

  List<Category> get displayedCategories {
    return List.from(_categories);
  }

  int get selectedCategoryIndex {
    return _categories.indexWhere((Category category) {
      return category.id == _selCategoryId;
    });
  }

  String get selectedCategoryId {
    return _selCategoryId;
  }

  Category get selectedCategory {
    if (selectedCategoryId == null) {
      return null;
    }
    return _categories.firstWhere((Category category) {
      return category.id == _selCategoryId;
    });
  }

  Future<Null> fetchCategories() async {
    _isLoading = true;
    notifyListeners();

    return http   
        // .get('http://192.168.1.4:3000/api/categories/?pagesize=30&page=1')
        .get('https://radiant-peak-40358.herokuapp.com/api/categories/?pagesize=30&page=1')
        .then<Null>((http.Response response) {
         
        print(response.statusCode);

            final List<Category> fetchedCategoriesList = [];
            final List categoriesListData = json.decode(response.body)['categories'];
            
            print(categoriesListData);
            if (fetchedCategoriesList == null) {
              _isLoading = false;
              notifyListeners();
              return;
            }
      categoriesListData.forEach(( categoryData) {
        final Category category = Category(
              id: categoryData["_id"],
              name: categoryData["name"],
              description: categoryData["description"],
              creator: categoryData["creatorName"],
              addedDate: categoryData["addedDate"]
            );

        fetchedCategoriesList.add(category);
      });
   
      _categories = fetchedCategoriesList;
      _isLoading = false;
      notifyListeners();
      _selProductId = null;
    }).catchError((error) {
      _isLoading = false;
      notifyListeners();
      return;
    });

  }


}

class ProductsModel extends ConnectedProductsModel {
  bool _showFavorites = false;

  List<Product> get allProducts {
    return List.from(_products);
  }

  List<Product> get displayedProducts {
    if (_showFavorites) {
      return _products.where((Product product) => product.isFavorite).toList();
    }
    return List.from(_products);
  }

  int get selectedProductIndex {
    return _products.indexWhere((Product product) {
      return product.id == _selProductId;
    });
  }

  String get selectedProductId {
    return _selProductId;
  }

  Product get selectedProduct {
    if (selectedProductId == null) {
      return null;
    }

    return _products.firstWhere((Product product) {
      return product.id == _selProductId;
    });
  }

  bool get displayFavoritesOnly {
    return _showFavorites;
  }

  Future<bool> addProduct(
      String title, String description, String image, double price) async {
    _isLoading = true;
    notifyListeners();
    final Map<String, dynamic> productData = {
      'title': title,
      'description': description,
      'image': 'https://upload.wikimedia.org/wikipedia/commons/6/68/Chocolatebrownie.JPG',
      'price': price.toString(),
      // 'userEmail': _authenticatedUser.email,
      // 'userId': _authenticatedUser.id
    };
    print("object =>"+ json.encode(productData));
    try {
      final http.Response response = await http.post(
          // 'http://192.168.1.3:3000/api/products',
          'https://radiant-peak-40358.herokuapp.com/api/products',
          body: productData);
      if (response.statusCode != 200 && response.statusCode != 201) {
        _isLoading = false;
        notifyListeners();
        return false;
      }
      // final Map<String, dynamic> responseData = json.decode(response.body);
      // final Product newProduct = Product(
      //     id: responseData['name'],
      //     title: title,
      //     description: description,
      //     image: image,
      //     price: price,
      //     // userEmail: _authenticatedUser.email,
      //     // userId: _authenticatedUser.id
      //     );
          final Product textAdd = Product(
            id: null,
            title: title,
            description: description,
            image: 'https://upload.wikimedia.org/wikipedia/commons/6/68/Chocolatebrownie.JPG',
            price: price,
            isFavorite: true);
      _products.add(textAdd);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> updateProduct(
      String title, String description, String image, double price) {
    _isLoading = true;
    notifyListeners();
    final Map<String, dynamic> updateData = {
      'title': title,
      'description': description,
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/6/68/Chocolatebrownie.JPG',
      'price': price,
      // 'userEmail': selectedProduct.userEmail,
      // 'userId': selectedProduct.userId
    };
    return http
        .put(
            'https://flutter-products.firebaseio.com/products/${selectedProduct.id}.json',
            body: json.encode(updateData))
        .then((http.Response reponse) {
      _isLoading = false;
      final Product updatedProduct = Product(
          id: selectedProduct.id,
          title: title,
          description: description,
          image: image,
          price: price,
          // userEmail: selectedProduct.userEmail,
          // userId: selectedProduct.userId
          );
      _products[selectedProductIndex] = updatedProduct;
      notifyListeners();
      return true;
    }).catchError((error) {
      _isLoading = false;
      notifyListeners();
      return false;
    });
  }

  Future<bool> deleteProduct() {
    _isLoading = true;
    final deletedProductId = selectedProduct.id;
    _products.removeAt(selectedProductIndex);
    _selProductId = null;
    notifyListeners();
    return http
        .delete(
            'https://flutter-products.firebaseio.com/products/${deletedProductId}.json')
        .then((http.Response response) {
      _isLoading = false;
      notifyListeners();
      return true;
    }).catchError((error) {
      _isLoading = false;
      notifyListeners();
      return false;
    });
  }

  Future<Null> fetchProducts() {
    _isLoading = true;
    notifyListeners();
    return http   
        // .get('http://192.168.1.3:3000/api/products/?pagesize=88&page=1')
        .get('https://radiant-peak-40358.herokuapp.com/api/products/?pagesize=88&page=1')
        .then<Null>((http.Response response) {
          // print('http.Response response' + json.decode(response.body));
            
//  List all_products = json.decode(response.body)['products'];
//              String message = json.decode(response.body)['message'];
//             print(all_products);
            
            final List<Product> fetchedProductList = [];
            final List productListData = json.decode(response.body)['products'];
            
            // print(productListData);
            if (productListData == null) {
              _isLoading = false;
              notifyListeners();
              return;
            }
      productListData.forEach(( productData) {
        // print(productData["price"]);
        final Product product = Product(
            id: productData["_id"],
            title: productData['name'],
            description: productData['description'],
            image: productData['image'],
            price: productData['price'].toDouble(),
            isFavorite: true
            // userEmail: productData['userEmail'],
            // userId: productData['userId']
            );

        fetchedProductList.add(product);
      });
        print(fetchedProductList.length);

      _products = fetchedProductList;
      _isLoading = false;
      notifyListeners();
      _selProductId = null;
    }).catchError((error) {
      _isLoading = false;
      notifyListeners();
      return;
    });
  }

  void toggleProductFavoriteStatus() {
    final bool isCurrentlyFavorite = selectedProduct.isFavorite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;
    final Product updatedProduct = Product(
        id: selectedProduct.id,
        title: selectedProduct.title,
        description: selectedProduct.description,
        price: selectedProduct.price,
        image: selectedProduct.image,
        // userEmail: selectedProduct.userEmail,
        // userId: selectedProduct.userId,
        isFavorite: newFavoriteStatus);
    _products[selectedProductIndex] = updatedProduct;
    notifyListeners();
  }

  void selectProduct(String productId) {
    _selProductId = productId;
    notifyListeners();
  }

  void toggleDisplayMode() {
    _showFavorites = !_showFavorites;
    notifyListeners();
  }
}

class UserModel extends ConnectedProductsModel {
  void login(String email, String password) {
    _authenticatedUser =
        User(id: 'fdalsdfasf', email: email, password: password);
        print(email);
        print(password);
  }

  void register(String name, String email, String phone, String password ) {
    // _authenticatedUser =
    //     User(id: 'fdalsdfasf', email: email, password: password);
        print(email);
        print(password);
        print(phone);
        print(name);
  }

 Future<Map<String, dynamic>> authenticate(String email, String password) async {
   print(email);
   print(password);
    _isLoading = true;
    notifyListeners();
    final Map<String, dynamic> authData = {
      'authEmail': email,
      'authPassword': password
    };
    print("=====> " + authData.toString());
    http.Response response = await http.post(
        'https://safe-reef-83338.herokuapp.com/api/auth/login',
        body: authData,
        // headers: {'Content-Type': 'application/json'},
      );

      print(response.body);

      _isLoading = false;
      notifyListeners();
      return {'success': "!hasError", 'message': "message"};
    }
    
/////////////////////////////////////////////////////////////////////////////////////////////////
/// 
///  'https://safe-reef-83338.herokuapp.com/api/auth/login', authData 
///
///
////////////////////////////////////////////////////////////////////////////////////////////////
// Timer _authTimer;
//   PublishSubject<bool> _userSubject = PublishSubject();

//   User get user {
//     return _authenticatedUser;
//   }

//   PublishSubject<bool> get userSubject {
//     return _userSubject;
//   }

  // Future<Map<String, dynamic>> authenticate(String email, String password,
  //     [AuthMode mode = AuthMode.Login]) async {
  //   _isLoading = true;
  //   notifyListeners();
  //   final Map<String, dynamic> authData = {
  //     'email': email,
  //     'password': password,
  //     'returnSecureToken': true
  //   };
  //   http.Response response;
  //   if (mode == AuthMode.Login) {
  //     response = await http.post(
  //       'https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=AIzaSyDRNWISSlMAV8cduZYT9sEVKhRx6qdwJcc',
  //       body: json.encode(authData),
  //       headers: {'Content-Type': 'application/json'},
  //     );
  //   } else {
  //     response = await http.post(
  //       'https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=AIzaSyDRNWISSlMAV8cduZYT9sEVKhRx6qdwJcc',
  //       body: json.encode(authData),
  //       headers: {'Content-Type': 'application/json'},
  //     );
  //   }

  //   final Map<String, dynamic> responseData = json.decode(response.body);
  //   bool hasError = true;
  //   String message = 'Something went wrong.';
  //   print(responseData);
  //   if (responseData.containsKey('idToken')) {
  //     hasError = false;
  //     message = 'Authentication succeeded!';
  //     _authenticatedUser = User(
  //         id: responseData['localId'],
  //         email: email,
  //         token: responseData['idToken']);
  //     setAuthTimeout(int.parse(responseData['expiresIn']));
  //     _userSubject.add(true);
  //     final DateTime now = DateTime.now();
  //     final DateTime expiryTime =
  //         now.add(Duration(seconds: int.parse(responseData['expiresIn'])));
  //     final SharedPreferences prefs = await SharedPreferences.getInstance();
  //     prefs.setString('token', responseData['idToken']);
  //     prefs.setString('userEmail', email);
  //     prefs.setString('userId', responseData['localId']);
  //     prefs.setString('expiryTime', expiryTime.toIso8601String());
  //   } else if (responseData['error']['message'] == 'EMAIL_EXISTS') {
  //     message = 'This email already exists.';
  //   } else if (responseData['error']['message'] == 'EMAIL_NOT_FOUND') {
  //     message = 'This email was not found.';
  //   } else if (responseData['error']['message'] == 'INVALID_PASSWORD') {
  //     message = 'The password is invalid.';
  //   }
  //   _isLoading = false;
  //   notifyListeners();
  //   return {'success': !hasError, 'message': message};
  // }

  // void autoAuthenticate() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final String token = prefs.getString('token');
  //   final String expiryTimeString = prefs.getString('expiryTime');
  //   if (token != null) {
  //     final DateTime now = DateTime.now();
  //     final parsedExpiryTime = DateTime.parse(expiryTimeString);
  //     if (parsedExpiryTime.isBefore(now)) {
  //       _authenticatedUser = null;
  //       notifyListeners();
  //       return;
  //     }
  //     final String userEmail = prefs.getString('userEmail');
  //     final String userId = prefs.getString('userId');
  //     final int tokenLifespan = parsedExpiryTime.difference(now).inSeconds;
  //     _authenticatedUser = User(id: userId, email: userEmail, token: token);
  //     _userSubject.add(true);
  //     setAuthTimeout(tokenLifespan);
  //     notifyListeners();
  //   }
  // }

  // void logout() async {
  //   _authenticatedUser = null;
  //   _authTimer.cancel();
  //   _userSubject.add(false);
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.remove('token');
  //   prefs.remove('userEmail');
  //   prefs.remove('userId');
  // }

  // void setAuthTimeout(int time) {
  //   _authTimer = Timer(Duration(seconds: time), logout);
  // }



}

class UtilityModel extends ConnectedProductsModel {
  bool get isLoading {
    return _isLoading;
  }
}
