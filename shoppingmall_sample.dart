import 'dart:io';

class ShoppingMall {
  int totalPrice = 0;
  menu_bar() {
    print('-' * 93);
    print(
      "[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료",
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
    int count = int.parse(productCount);
    int price = productList[productName]!;
    totalPrice += price * count;
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
        print('장바구니에 ${shoppingMall.totalPrice}원 어치를 담으셨네요 !');
        break;
      case '4':
        print('이용해 주셔서 감사합니다 ~ 안녕히 가세요 !');
        isRunning = false;
        break;
      default:
        print('지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..');
    }
  }
}
