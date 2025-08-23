import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';

// class CustomFoodItem extends StatelessWidget {
//   const CustomFoodItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       // 🔑 عشان يملأ المساحة الباقية من الـ Column
//       child: GridView.count(
//         crossAxisCount: 2,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//         padding: const EdgeInsets.all(8.0),
//         children: <Widget>[
//           foodCard(
//             "Cheese Burger",
//             4.9,
//             "20 - 30 mins",
//             "assets/imgs/food_exam.png",
//           ),
//           foodCard("Pasta", 4.9, "20 - 30 mins", "assets/imgs/food_exam.png"),
//           foodCard(
//             "Breakfast",
//             4.9,
//             "20 - 30 mins",
//             "assets/imgs/food_exam.png",
//           ),
//           foodCard("Fries", 4.9, "20 - 30 mins", "assets/imgs/food_exam.png"),
//           foodCard("Fries", 4.9, "20 - 30 mins", "assets/imgs/food_exam.png"),
//         ],
//       ),
//     );
//   }

//   Widget foodCard(
//     String title,
//     double rating,
//     String deliveryTime,
//     String imagePath,
//   ) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       elevation: 3,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           ClipRRect(
//             borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
//             child: Image.asset(
//               imagePath,
//               fit: BoxFit.cover,
//               height: 100,
//               width: double.infinity,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               title,
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Row(
//               children: <Widget>[
//                 const Icon(Icons.star, color: Colors.orange, size: 18),
//                 Text(' $rating'),
//                 const Spacer(),
//                 Text(deliveryTime),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// CustomFoodItem مع إضافة وظيفة الضغط
class CustomFoodItem extends StatelessWidget {
  const CustomFoodItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          foodCard(
            context,
            "Cheese Burger 🍔",
            4.9,
            "20 - 30",
            "assets/imgs/food_exam.png",
            "Burger With Meat is a typical food from our restaurant that is much in demand by many people, this is very recommended for you.",
          ),
          foodCard(
            context,
            "Pasta",
            4.9,
            "20 - 30",
            "assets/imgs/food_exam.png",
            "Delicious pasta with rich sauce and fresh ingredients.",
          ),
          foodCard(
            context,
            "Breakfast",
            4.9,
            "20 - 30",
            "assets/imgs/food_exam.png",
            "Fresh breakfast to start your day with energy.",
          ),
          foodCard(
            context,
            "Fries",
            4.9,
            "20 - 30",
            "assets/imgs/food_exam.png",
            "Crispy golden fries served hot and fresh.",
          ),
          foodCard(
            context,
            "Pizza",
            4.9,
            "20 - 30",
            "assets/imgs/food_exam.png",
            "Authentic Italian pizza with premium toppings.",
          ),
        ],
      ),
    );
  }

  Widget foodCard(
    BuildContext context,
    String title,
    double rating,
    String deliveryTime,
    String imagePath,
    String description,
  ) {
    return GestureDetector(
      onTap: () {
        // الانتقال لشاشة التفاصيل عند الضغط
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => MealDetailsScreen(
                  title: title,
                  rating: rating,
                  deliveryTime: deliveryTime,
                  imagePath: imagePath,
                  description: description,
                ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 100,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: <Widget>[
                  const Icon(Icons.star, color: Colors.orange, size: 18),
                  Text(' $rating'),
                  const Spacer(),
                  Text(deliveryTime),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// شاشة تفاصيل الوجبة
class MealDetailsScreen extends StatelessWidget {
  final String title;
  final double rating;
  final String deliveryTime;
  final String imagePath;
  final String description;

  const MealDetailsScreen({
    super.key,
    required this.title,
    required this.rating,
    required this.deliveryTime,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة الوجبة مع زر الرجوع
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Image.asset(imagePath, fit: BoxFit.cover),
                  ),
                ),
                // زر الرجوع
                Positioned(
                  top: 50,
                  left: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),

            // محتوى التفاصيل
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // عنوان الوجبة
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 15),

                  // التقييم والوقت
                  Row(
                    children: [
                      // الوقت
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          '$deliveryTime mins',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const Spacer(),
                      // التقييم
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            rating.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),

                  // عنوان الوصف
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // نص الوصف
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 100), // مساحة إضافية في الأسفل
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
