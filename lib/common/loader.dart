import 'package:e_commerce/core/constants/colors.dart';
import 'package:flutter/material.dart';

class OverLayLoader extends StatelessWidget {
  const OverLayLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.6),
      child: const Center(
        child: CircularProgressIndicator(color: EColors.primaryColor,),
      ),
    );
  }
}
