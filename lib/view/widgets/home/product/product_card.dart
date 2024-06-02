import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:we_devs_assignment/helpers/colors.dart';
import 'package:we_devs_assignment/helpers/styles.dart';
import 'package:we_devs_assignment/utils/util.dart';

import '../../../../model/product.dart';

class ProductCard extends StatelessWidget {
  Product product;

  ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: WHITE,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 7,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              child: CachedNetworkImage(
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl: product.images[0].src,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Image.asset(
                  'assets/images/placeholder.jpeg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: myStyleSourceRoboto(fontSize: 18, fontWeight: FontWeight.w400, color: BLACK),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      if (double.parse(product.price) <
                          double.parse(product.regularPrice))
                        Text(
                          '\$${product.regularPrice}',
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      const SizedBox(width: 8),
                      Text(
                        '\$${product.price}',
                        style: myStyleSourceRoboto(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  RatingBar(
                      ignoreGestures: true,
                      maxRating: 5,
                      initialRating: convertStringToDouble(product.averageRating),
                      allowHalfRating: true,
                      itemSize: 20,
                      ratingWidget: RatingWidget(
                          full: const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          half: const Icon(
                            Icons.star_half,
                            color: Colors.amber,
                          ),
                          empty: const Icon(Icons.star_border_rounded)),
                      onRatingUpdate: (double value) {})
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
