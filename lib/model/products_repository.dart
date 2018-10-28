import 'product.dart';

class ProductsRepository {
  static List<Product> loadProducts(Category category) {
    const allProducts = <Product>[
      
      Product(
        id: 1,
        ranking: 3,
        category: Category.hotel,
        isFeatured: true,
        name: 'Gyeongju Hilton',
        himage: 'assets/hotel2.jpg',
        hlocation: '484-7 Bomun to Gyeongju-si Gyeongsangbuk-do KR',
        number: '054-745-7788',
        comment:
            'The Polonia Palace Hotel is a historic four-star hotel opened in 1913 and located in the heart of Warsaw on Jerusalem Avenue. It is the capital’s second oldest hotel after the Hotel Bristol, Warsaw. Together with the adjacent Metropol Hotel and the MDM Hotel, it is managed by the Syrena Hotel Group. It was declared an architectural monument of Poland\'s history and culture on July 1, 1965.',
      ),
      Product(
        id: 2,
        ranking: 4,
        category: Category.hotel,
        isFeatured: true,
        name: 'The Westin Grand Berlin',
        himage: 'assets/hotel3.jpg',
        hlocation: 'Friedrichstraße 158/164, 10117 Berlin',
        number: '+49 4930 20270',
        comment:
            'The Polonia Palace Hotel is a historic four-star hotel opened in 1913 and located in the heart of Warsaw on Jerusalem Avenue. It is the capital’s second oldest hotel after the Hotel Bristol, Warsaw. Together with the adjacent Metropol Hotel and the MDM Hotel, it is managed by the Syrena Hotel Group. It was declared an architectural monument of Poland\'s history and culture on July 1, 1965.',
      ),
      Product(
        id: 3,
        ranking: 2,
        category: Category.hotel,
        isFeatured: true,
        name: 'Marina Bay Sands Hotel',
        himage: 'assets/hotel4.jpg',
        hlocation: '10 Bayfront Ave, Singapore 018956',
        number: '+65 6688 8868',
        comment:
            'The Polonia Palace Hotel is a historic four-star hotel opened in 1913 and located in the heart of Warsaw on Jerusalem Avenue. It is the capital’s second oldest hotel after the Hotel Bristol, Warsaw. Together with the adjacent Metropol Hotel and the MDM Hotel, it is managed by the Syrena Hotel Group. It was declared an architectural monument of Poland\'s history and culture on July 1, 1965.',
      ),
      Product(
        id: 4,
        ranking: 3,
        category: Category.hotel,
        isFeatured: true,
        name: 'Carlton Hotel',
        himage: 'assets/hotel5.jpg',
        hlocation: '76 Bras Basah Rd, Singapore 189558',
        number: '+65 6338 8333',
        comment:
            'The Polonia Palace Hotel is a historic four-star hotel opened in 1913 and located in the heart of Warsaw on Jerusalem Avenue. It is the capital’s second oldest hotel after the Hotel Bristol, Warsaw. Together with the adjacent Metropol Hotel and the MDM Hotel, it is managed by the Syrena Hotel Group. It was declared an architectural monument of Poland\'s history and culture on July 1, 1965.',
      ),
      Product(
        id: 0,
        ranking: 5,
        category: Category.hotel,
        isFeatured: true,
        name: 'Park Regis Singaopre',
        himage: 'assets/hotel6.jpg',
        hlocation: '23 Merchant Rd, Singapore 058268',
        number: '+65 6818 8888',
        comment:
            'The Polonia Palace Hotel is a historic four-star hotel opened in 1913 and located in the heart of Warsaw on Jerusalem Avenue. It is the capital’s second oldest hotel after the Hotel Bristol, Warsaw. Together with the adjacent Metropol Hotel and the MDM Hotel, it is managed by the Syrena Hotel Group. It was declared an architectural monument of Poland\'s history and culture on July 1, 1965.',
      ),
      Product(
        id: 5,
        ranking: 3,
        category: Category.hotel,
        isFeatured: true,
        name: 'Polonia hotel',
        himage: 'assets/hotel1.jpg',
        hlocation: '''al. Jerozolimskie 45, 00-692 Warszawa, Poland''',
        number: '+48 22 318 28 00',
        comment:
            'The Polonia Palace Hotel is a historic four-star hotel opened in 1913 and located in the heart of Warsaw on Jerusalem Avenue. It is the capital’s second oldest hotel after the Hotel Bristol, Warsaw. Together with the adjacent Metropol Hotel and the MDM Hotel, it is managed by the Syrena Hotel Group. It was declared an architectural monument of Poland\'s history and culture on July 1, 1965.',
      ),
    ];
    if (category == Category.all) {
      return allProducts;
    } else {
      return allProducts.where((Product p) {
        return p.category == category;
      }).toList();
    }
  }
}
