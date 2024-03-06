// ignore_for_file: public_member_api_docs

import 'package:coding_challenge/core/utils/assets.dart';
import 'package:coding_challenge/core/utils/sized_x.dart';
import 'package:coding_challenge/core/widgets/custom_padding.dart';
import 'package:coding_challenge/features/splash/presentation/controllers/main_cubit/main_cubit.dart';
import 'package:coding_challenge/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class CustomBlueContainer extends StatelessWidget {
  const CustomBlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: CustomPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.genImagesPerson),
                      fit: BoxFit.cover,
                    ),
                    shape: OvalBorder(),
                  ),
                ),
                SizedX.w3,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            S.of(context).helloManuel,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          const Spacer(),
                          // change language
                          IconButton(
                            onPressed: () {
                              context.read<MainCubit>().changeLang(
                                    Intl.getCurrentLocale() == 'en'
                                        ? 'fr'
                                        : 'en',
                                  );
                            },
                            icon: const Icon(
                              Icons.language,
                            ),
                          ),
                        ],
                      ),
                      SizedX.h0p5,
                      Text(
                        S.of(context).whatAreYourPlansNforToday,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w300,
                              height: 0.13.h,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
