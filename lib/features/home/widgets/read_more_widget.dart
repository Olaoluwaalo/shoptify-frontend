import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ReadMoreWidget extends StatelessWidget {
  const ReadMoreWidget({
    super.key,
    required this.product,
  });

  final dynamic product;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      product.description,
      trimMode: TrimMode.Line,
      trimLines: 2,
      colorClickableText: Colors.pink,
      trimCollapsedText: 'Show more',
      trimExpandedText: 'Show less',
      moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    );
  }
}