import 'dart:io';

class ShoppingMall {
  int totalPrice = 0;
  Map<String, int> cart = {};

  menu_bar() {
    print('-' * 93);
    print(
      "[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 장바구니 초기화 / [5] 프로그램 종료",
    );
    print('-' * 93);
    String? input = stdin.readLineSync();
    return input;
  }

  Map<String, int> productList = {
    'shirts': 45000,
    'dresses': 30000,
    'tshirts': 35000,
    'pants': 38000,
    'socks': 5000,
  };
  late List<String> Products = productList.keys.toList();
  late List<int> Prices = productList.values.toList();

  void showProducts() {
    for (int i = 0; i < Products.length; i++) {
      print('${Products[i]} / ${Prices[i]}원');
    }
  }

  addToCart(productName, productCount) {
    cart[productName] = int.parse(productCount);
    totalPrice += productList[productName]! * int.parse(productCount);
    return totalPrice;
  }
}

class Product {
  String? name = '';
  int? price = 0;
}

void main() {
  ShoppingMall shoppingMall = ShoppingMall();
  bool isRunning = true;
  while (isRunning) {
    String? input = shoppingMall.menu_bar();
    switch (input) {
      case '1':
        shoppingMall.showProducts();
        break;
      case '2':
        print('상품 이름을 입력해 주세요 !');
        String? productName = stdin.readLineSync();
        print('상품 개수를 입력해 주세요 !');
        String? productCount = stdin.readLineSync();
        if (shoppingMall.productList.containsKey(productName) == false) {
          print('입력값이 올바르지 않아요 !');
          break;
        } else if ((int.tryParse(productCount!) == null)) {
          print('입력값이 올바르지 않아요 !');
          break;
        } else if (int.parse(productCount) <= 0) {
          print('0개보다 많은 개수의 상품만 담을 수 있어요 !');
          break;
        } else {
          shoppingMall.addToCart(productName, productCount);
          print('장바구니에 상품이 담겼어요 !');
          break;
        }
      case '3':
        if (shoppingMall.cart.isEmpty) {
          print('장바구니에 담긴 상품이 없습니다.');
        } else {
          print(
            '장바구니에 ${shoppingMall.cart.keys.join(', ')}가 담겨있네요. 총 ${shoppingMall.totalPrice}원 입니다!',
          );
        }
        break;
      case '4':
        if (shoppingMall.cart.isNotEmpty) {
          print('장바구니를 초기화합니다.');
          shoppingMall.cart.clear();
          shoppingMall.totalPrice = 0;
        } else {
          print('이미 장바구니가 비어있습니다.');
        }
        break;
      case '5':
        while (true) {
          print('정말 종료하시겠습니까? (Y/N)');
          String? confirm = stdin.readLineSync();
          if (confirm == 'Y' || confirm == 'y') {
            print('이용해 주셔서 감사합니다 ~ 안녕히 가세요 !');
            isRunning = false;
            break;
          } else if (confirm == 'N' || confirm == 'n') {
            print('종료하지 않습니다.');
            break;
          } else {
            print('Y 또는 N으로 입력해 주세요.');
          }
        }
        break;
      default:
        print('지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..');
    }
  }
}
