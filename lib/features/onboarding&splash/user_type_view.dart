import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/foundation.dart';
import 'package:supplier/app.dart';
import 'package:supplier/core/cubit/app_config_cubit.dart';
import 'package:supplier/core/utils/constants/color_consatnts.dart';
import 'package:supplier/core/utils/constants/route_constants.dart';
import 'package:supplier/core/utils/styles/text_styles.dart';
import 'package:supplier/core/utils/widgets/spacers.dart';
import 'package:supplier/features/onboarding&splash/widgets/logo_animation.dart';
import 'package:supplier/features/onboarding&splash/widgets/role_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserTypeView extends StatelessWidget {
  const UserTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return ConditionalBuilder(
        condition: (screenHeight>900 || screenWidth >450),
        builder: (context) => const DesktopView(),
        fallback: (context) => const MobileView(),
    );
  }
}

class MobileView extends StatelessWidget {
  const MobileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConsatnts.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: ListView(
            children: [
              Transform.translate(
                offset: Offset(0, -72.h),
                child: const LogoAnimation(),
              ),
              const VerticalSpacer(space: 10),
              Text(
                "REGISTRATION ROLE",
                textAlign: TextAlign.center,
                style: applySemiBoldStyle(
                  fontSize: 16,
                  fontColor: ColorConsatnts.black,
                ),
              ),
              const VerticalSpacer(space: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoleContainer(
                    onTap: () {

                      AppConfigCubit.isSupplier = false;
                      Navigator.popAndPushNamed(
                          context, RouteConstants.logInView);
                    },
                    title: 'FIND SUPPLIER',
                    discription: '(Person / Company)',
                    imagePath: 'assets/images/role1.jpeg',
                  ),
                  const HorizontalSpacer(space: 18),
                  RoleContainer(
                    onTap: () {
                      AppConfigCubit.isSupplier = true;

                      Navigator.popAndPushNamed(
                          context, RouteConstants.supplierLogInView);
                    },
                    title: "I AM A SUPPLIER",
                    discription: '(Printing Press / Company / Agency).',
                    imagePath: 'assets/images/role2.jpeg',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DesktopView extends StatelessWidget {
  const DesktopView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConsatnts.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: ListView(
            children: [
              Transform.translate(
                offset:kIsWeb? Offset(0, -5.h) : Offset(0, -72.h),
                child: const LogoAnimation(),
              ),
              const VerticalSpacer(space: 10),
              Text(
                "REGISTRATION ROLE2",
                textAlign: TextAlign.center,
                style: applySemiBoldStyle(
                  fontSize: 16,
                  fontColor: ColorConsatnts.black,
                ),
              ),
              const VerticalSpacer(space: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoleContainer(
                    onTap: () {
                      AppConfigCubit.isSupplier = false;
                      Navigator.popAndPushNamed(
                          context, RouteConstants.logInView);
                    },
                    title: 'FIND SUPPLIER',
                    discription: '(Person / Company)',
                    imagePath: 'assets/images/role1.jpeg',
                  ),
                  const HorizontalSpacer(space: 18),
                  RoleContainer(
                    onTap: () {
                      AppConfigCubit.isSupplier = true;

                      Navigator.popAndPushNamed(
                          context, RouteConstants.supplierLogInView);
                    },
                    title: "I AM A SUPPLIER",
                    discription: '(Printing Press / Company / Agency).',
                    imagePath: 'assets/images/role2.jpeg',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
