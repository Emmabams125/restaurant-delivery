import 'package:delivery_app/models/food.dart';
import 'package:flutter/material.dart';

class MyFoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const MyFoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text food details
              Expanded(
                flex: 2, // Text occupies 2/3 of the Row
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5), // Add spacing between texts
                    Text(
                      '\$${food.price.toStringAsFixed(2)}',
                      // Price formatted with 2 decimal places
                      style: TextStyle(color: Colors.green),
                    ),
                    SizedBox(height: 5),
                    Text(
                      food.description,
                      overflow: TextOverflow.ellipsis,
                      // Handle long descriptions with ellipsis
                      maxLines: 2,
                      // Show max 2 lines for description
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10), // Space between text and image

              // Wrap the image in Flexible to avoid overflow
              Flexible(
                flex: 1, // Image occupies 1/3 of the Row
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    // Rounded corners for the image
                    child: Image.asset(
                      food.imagePath,
                      height: 120,
                      width: 120, // Constrain the image size
                      fit: BoxFit.cover, // Ensure the image fits well
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(color: Colors.grey), // Divider between food tiles
      ],
    );
  }
}
