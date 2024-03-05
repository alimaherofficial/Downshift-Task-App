// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      onPressed: onPressed,
      child: SizedBox(
        width: 7.h,
        height: 7.h,
        child: const Center(
          child: Text(
            '+',
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
