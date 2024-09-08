// screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  final List<String> bannerImages = [
    'https://via.placeholder.com/1080x400.png?text=Banner+1',
    'https://via.placeholder.com/1080x400.png?text=Banner+2',
    'https://via.placeholder.com/1080x400.png?text=Banner+3',
  ];

  final List<Map<String, String>> categories = [
    {
      'name': 'Men',
      'image': 'https://via.placeholder.com/150x150.png?text=Men'
    },
    {
      'name': 'Women',
      'image': 'https://via.placeholder.com/150x150.png?text=Women'
    },
    {
      'name': 'Kids',
      'image': 'https://via.placeholder.com/150x150.png?text=Kids'
    },
    {
      'name': 'Accessories',
      'image': 'https://via.placeholder.com/150x150.png?text=Accessories'
    },
  ];

  final List<Map<String, String>> featuredProducts = [
    {
      'name': 'Product 1',
      'price': '\$50.00',
      'image': 'https://via.placeholder.com/150x150.png?text=Product+1'
    },
    {
      'name': 'Product 2',
      'price': '\$70.00',
      'image': 'https://via.placeholder.com/150x150.png?text=Product+2'
    },
    {
      'name': 'Product 3',
      'price': '\$30.00',
      'image': 'https://via.placeholder.com/150x150.png?text=Product+3'
    },
    {
      'name': 'Product 4',
      'price': '\$90.00',
      'image': 'https://via.placeholder.com/150x150.png?text=Product+4'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clothing Store'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner/Carousel
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
              ),
              items: bannerImages.map((imageUrl) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
            ),

            // Category Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Handle category selection
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(categories[index]['image']!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(categories[index]['name']!),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Featured Products Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Featured Products',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              physics:
                  NeverScrollableScrollPhysics(), // Prevent scrolling inside GridView
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: featuredProducts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context,
                        '/product-detail'); // Navigate to product detail
                  },
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(10)),
                            image: DecorationImage(
                              image: NetworkImage(
                                  featuredProducts[index]['image']!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                featuredProducts[index]['name']!,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text(
                                featuredProducts[index]['price']!,
                                style: TextStyle(color: Colors.green),
                              ),
                              SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle add to cart
                                },
                                child: Text('Add to Cart'),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  textStyle: TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Wishlist'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          // Handle navigation
          if (index == 1) Navigator.pushNamed(context, '/wishlist');
          if (index == 2) Navigator.pushNamed(context, '/cart');
          if (index == 3) Navigator.pushNamed(context, '/profile');
        },
      ),
    );
  }
}
