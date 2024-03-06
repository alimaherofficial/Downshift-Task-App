// ignore_for_file: public_member_api_docs

import 'package:coding_challenge/core/utils/assets.dart';
import 'package:coding_challenge/core/utils/sized_x.dart';
import 'package:coding_challenge/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class CustomLimeContainer extends StatelessWidget {
  const CustomLimeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFD04BA3),
            Color(0xFFD57968),
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(Assets.genIconsCupIcon),
                SizedX.w4,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).goProNoAds,
                      style: const TextStyle(
                        color: Color(0xFF071C55),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedX.h0p5,
                    Text(
                      S.of(context).noFussNoAdsForOnly1ANmonth,
                      style: const TextStyle(
                        color: Color(0xFF0C2971),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 15.w,
                height: 7.h,
                decoration: const BoxDecoration(color: Color(0xFF071C55)),
                child: const Center(
                  child: Text(
                    r'$1',
                    style: TextStyle(
                      color: Color(0xFFF2C94C),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
