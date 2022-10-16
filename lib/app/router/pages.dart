import 'package:elmawkef_inc/app/models/work.dart';
import 'package:elmawkef_inc/app/views/screens/auth/otp_screen.dart';
import 'package:elmawkef_inc/app/views/screens/auth/signup.dart';
import 'package:elmawkef_inc/app/views/screens/categories.dart';
import 'package:elmawkef_inc/app/views/screens/drawer_screens/contact_us.dart';
import 'package:elmawkef_inc/app/views/screens/drawer_screens/review.dart';
import 'package:elmawkef_inc/app/views/screens/navigation_stack.dart';
import 'package:elmawkef_inc/app/views/screens/profile.dart';
import 'package:elmawkef_inc/app/views/screens/services.dart';
import 'package:elmawkef_inc/app/views/screens/single_service.dart';
import 'package:elmawkef_inc/app/views/screens/splash_onboarding/onboarding.dart';
import 'package:elmawkef_inc/app/views/screens/splash_onboarding/splash.dart';
import 'package:get/get.dart';

import '../controllers/single_service.dart';
import 'routers.dart';

class Pages {
  static get route => <GetPage>[
        GetPage(
          name: AppRoutes.splash,
          page: () => Splash(),
        ),
        GetPage(
          name: AppRoutes.onboarding,
          page: () => OnboardingScreen(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(seconds: 1),
        ),
        GetPage(
          name: AppRoutes.signup,
          page: () => SignUp(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(seconds: 1),
          // middlewares: [Auth()],
        ),
        GetPage(
          name: AppRoutes.otp,
          page: () => OtpScreen(),
        ),
        GetPage(
          name: AppRoutes.home,
          page: () => DashboardPage(),
        ),
        GetPage(
          name: AppRoutes.allCategories,
          page: () => Categories(),
        ),
        GetPage(
          name: AppRoutes.services,
          page: () => Services(),
        ),
        GetPage(
          name: AppRoutes.profile,
          page: () => Profile(),
        ),
        GetPage(
          name: AppRoutes.contactUs,
          page: () => ContactUs(),
        ),
        GetPage(
          name: AppRoutes.review,
          page: () => Review(),
        ),
        GetPage(
          name: AppRoutes.service,
          page: () => SingleService(),
          arguments: WorkModel,
          binding: BindingsBuilder(() {
            Get.lazyPut<SingleServiceController>(
                () => SingleServiceController());
          }),
          transition: Transition.fadeIn,
          preventDuplicates: false,
        ),
      ];
}

/**
 * 1- Define
 *  GetPage(
    name: '/profile/:user',
    page: () => UserProfile(),
    ),

    2- Send Data
    Get.toNamed("/profile/34954");

    3- Get Param
    Get.parameters['user'])
 */
