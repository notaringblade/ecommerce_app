import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;
  final List images;
  final String description;
  final List features;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
    required this.images,
    this.description = "no data was provided but the manufacturer",
    this.features = const ["No Data Was Provided By The Manufacturer"],
  });
  // this.reviews

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        category,
        imageUrl,
        price,
        isRecommended,
        isPopular,
        images,
        description,
        features
      ];

  static List<Product> products = [
    const Product(
      name: 'shoe',
      category: 'shoes',
      imageUrl:
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      price: 20,
      isRecommended: true,
      isPopular: false,
      description: "This Is Shoe Description",
      images: [
        'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
        'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
        'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
      ],
      features: [
        "Feature 1",
        "Feature 2",
        "Feature 3",
        "Feature 4",
        "Feature 5",
      ],
      
    ),
    const Product(
        name: 'watch',
        category: 'watches',
        imageUrl:
            "https://images.unsplash.com/photo-1595923533867-ff8a01335ff9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8d3Jpc3R3YXRjaHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
        price: 40.5,
        isRecommended: false,
        isPopular: true,
        description: "This is the Watch Description",
        images: [
          'https://images.unsplash.com/photo-1595923533867-ff8a01335ff9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8d3Jpc3R3YXRjaHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1595923533867-ff8a01335ff9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8d3Jpc3R3YXRjaHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
        ]),
    const Product(
        name: 'headphones',
        category: 'electronics',
        imageUrl:
            "https://images.unsplash.com/photo-1546435770-a3e426bf472b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8aGVhZHBob25lc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
        price: 69.5,
        isRecommended: true,
        isPopular: true,
        description: "This is the Watch Description",
        images: [
          "https://images.unsplash.com/photo-1546435770-a3e426bf472b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8aGVhZHBob25lc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
        ]),
    const Product(
        name: 'phone',
        category: 'phones',
        imageUrl:
            'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-14-model-unselect-gallery-2-202209_GEO_EMEA?wid=2560&hei=1440&fmt=p-jpg&qlt=80&.v=1660744859118',
        price: 699.9,
        isRecommended: true,
        isPopular: false,
        description: "This is the Phone Description",
        images: [
          'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-14-model-unselect-gallery-2-202209_GEO_EMEA?wid=2560&hei=1440&fmt=p-jpg&qlt=80&.v=1660744859118',
          'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-14-model-unselect-gallery-2-202209_GEO_EMEA?wid=2560&hei=1440&fmt=p-jpg&qlt=80&.v=1660744859118',
          'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-14-model-unselect-gallery-2-202209_GEO_EMEA?wid=2560&hei=1440&fmt=p-jpg&qlt=80&.v=1660744859118',
          'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-14-model-unselect-gallery-2-202209_GEO_EMEA?wid=2560&hei=1440&fmt=p-jpg&qlt=80&.v=1660744859118',
        ]),
    const Product(
        name: 'Mac',
        category: 'computers',
        imageUrl:
            "https://media.istockphoto.com/photos/modern-laptop-with-empty-screen-on-white-background-mockup-design-picture-id1182241805?b=1&k=20&m=1182241805&s=612x612&w=0&h=8LGcGIlPCE1pEOKOqrN4WP-UsXobLqc4EnqC71niFrc=",
        price: 999.0,
        isRecommended: false,
        isPopular: true,
        description: "This is the Laptop Description",
        images: [
          "https://media.istockphoto.com/photos/modern-laptop-with-empty-screen-on-white-background-mockup-design-picture-id1182241805?b=1&k=20&m=1182241805&s=612x612&w=0&h=8LGcGIlPCE1pEOKOqrN4WP-UsXobLqc4EnqC71niFrc=",
          "https://media.istockphoto.com/photos/modern-laptop-with-empty-screen-on-white-background-mockup-design-picture-id1182241805?b=1&k=20&m=1182241805&s=612x612&w=0&h=8LGcGIlPCE1pEOKOqrN4WP-UsXobLqc4EnqC71niFrc=",
          "https://media.istockphoto.com/photos/modern-laptop-with-empty-screen-on-white-background-mockup-design-picture-id1182241805?b=1&k=20&m=1182241805&s=612x612&w=0&h=8LGcGIlPCE1pEOKOqrN4WP-UsXobLqc4EnqC71niFrc=",
        ]),
    const Product(
        name: 'rolex',
        category: 'watches',
        imageUrl:
          'https://content.rolex.com/dam/2022-11/upright-bba-with-shadow/m126900-0001.png?impolicy=v6-upright&imwidth=420',
        price: 40.5,
        isRecommended: false,
        isPopular: true,
        description: "This is the Watch Description",
        images: [
          'https://content.rolex.com/dam/2022-11/upright-bba-with-shadow/m126900-0001.png?impolicy=v6-upright&imwidth=420',
          'https://content.rolex.com/dam/2022-11/upright-bba-with-shadow/m126900-0001.png?impolicy=v6-upright&imwidth=420',
          'https://content.rolex.com/dam/2022-11/upright-bba-with-shadow/m126900-0001.png?impolicy=v6-upright&imwidth=420',

        ]),
    const Product(
        name: 'ROG',
        category: 'computers',
        imageUrl: "https://rog.asus.com/media/1578096205427.webp",
        price: 999.0,
        isRecommended: false,
        isPopular: true,
        description: "This is the Laptop Description",
        images: [
          "https://rog.asus.com/media/1578096205427.webp",
          "https://rog.asus.com/media/1578096205427.webp",
          "https://rog.asus.com/media/1578096205427.webp",
          "https://rog.asus.com/media/1578096205427.webp",
        ]),

        const Product(
        name: 'ROG',
        category: 'computers',
        imageUrl: "https://rog.asus.com/media/1578096205427.webp",
        price: 999.0,
        isRecommended: false,
        isPopular: true,
        description: "This is the Laptop Description",
        images: [
          "https://rog.asus.com/media/1578096205427.webp",
          "https://rog.asus.com/media/1578096205427.webp",
          "https://rog.asus.com/media/1578096205427.webp",
          "https://rog.asus.com/media/1578096205427.webp",
        ]),
      
  ];
}
