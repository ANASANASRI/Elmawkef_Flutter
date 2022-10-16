import 'package:elmawkef_inc/app/controllers/otp.dart';
import 'package:elmawkef_inc/app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends GetResponsiveView<OtpController> {
  @override
  final controller = Get.put(OtpController(), permanent: true);

  // @override
  // Widget? desktop() {
  //   return Scaffold(
  //     body: Padding(
  //       padding: EdgeInsets.symmetric(
  //           horizontal: screen.width * 0.18, vertical: screen.height * 0.12),
  //       child: SingleChildScrollView(
  //         child: Container(
  //           padding: const EdgeInsets.all(18),
  //           decoration: BoxDecoration(
  //             color: Get.isDarkMode ? Colors.black12 : Colors.grey.shade200,
  //             borderRadius: const BorderRadius.all(
  //               Radius.circular(18),
  //             ),
  //             boxShadow: const [
  //               BoxShadow(
  //                 color: Colors.black45,
  //                 blurRadius: 4,
  //                 offset: Offset(1, 1), //
  //                 spreadRadius: 0.5, // Shadow position
  //               ),
  //             ],
  //           ),
  //           child: Column(
  //             children: [
  //               SizedBox(
  //                 width: screen.width * 0.28,
  //                 height: screen.height * 0.18,
  //                 child: Image.asset(
  //                   'assets/logo.png',
  //                   fit: BoxFit.contain,
  //                 ),
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.symmetric(vertical: screen.height * 0.01),
  //                 child: const Text(
  //                   'Verify',
  //                   style: TextStyle(
  //                     fontSize: 42,
  //                     fontWeight: FontWeight.w500,
  //                   ),
  //                   textAlign: TextAlign.center,
  //                 ),
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.symmetric(vertical: screen.height * 0.01),
  //                 child: const Text(
  //                   'Please enter the verification code sent to your phone number',
  //                   textAlign: TextAlign.center,
  //                   style: TextStyle(
  //                     fontSize: 18,
  //                   ),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.symmetric(vertical: screen.height * 0.03),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Form(
  //                       key: controller.formKey,
  //                       child: Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: PinCodeTextField(
  //                           appContext: screen.context,
  //                           pastedTextStyle: TextStyle(
  //                             color: Colors.green.shade600,
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                           backgroundColor: Colors.transparent,
  //                           length: 6,
  //                           obscureText: false,
  //                           animationType: AnimationType.fade,
  //                           pinTheme: PinTheme(
  //                             shape: PinCodeFieldShape.box,
  //                             borderRadius: BorderRadius.circular(8),
  //                             fieldHeight: screen.height * 0.08,
  //                             fieldWidth: screen.width * 0.09,
  //                           ),
  //                           cursorColor: Colors.black,
  //                           autoFocus: true,
  //                           animationDuration:
  //                               const Duration(milliseconds: 300),
  //                           enableActiveFill: true,
  //                           controller: controller.otpController,
  //                           keyboardType: TextInputType.number,
  //                           onCompleted: (v) {
  //                             //do something or move to next screen when code complete
  //                           },
  //                           onChanged: (value) {},
  //                         ),
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: 14,
  //                     ),
  //                     TextButton(
  //                       onPressed: () {},
  //                       child: const Text(
  //                         "Resend your code",
  //                         style: TextStyle(
  //                           color: AppColors.primary,
  //                           fontSize: 16,
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.symmetric(vertical: screen.height * 0.02),
  //                 child: ElevatedButton(
  //                   onPressed: () {},
  //                   child: const Text("Confirm"),
  //                   style: ButtonStyle(
  //                     padding: MaterialStateProperty.all(
  //                       EdgeInsets.symmetric(horizontal: screen.width * 0.1),
  //                     ),
  //                     fixedSize: MaterialStateProperty.all(
  //                       Size(screen.width * 0.4, 48),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // @override
  // Widget? tablet() {
  //   return Scaffold(
  //     body: Padding(
  //       padding: EdgeInsets.symmetric(
  //           horizontal: screen.width * 0.18, vertical: screen.height * 0.12),
  //       child: SingleChildScrollView(
  //         child: Column(
  //           children: [
  //             SizedBox(
  //               width: screen.width * 0.28,
  //               height: screen.height * 0.18,
  //               child: Image.asset(
  //                 'assets/logo.png',
  //                 fit: BoxFit.contain,
  //               ),
  //             ),
  //             Padding(
  //               padding: EdgeInsets.symmetric(vertical: screen.height * 0.01),
  //               child: const Text(
  //                 'Verify',
  //                 style: TextStyle(
  //                   fontSize: 42,
  //                   fontWeight: FontWeight.w500,
  //                 ),
  //                 textAlign: TextAlign.center,
  //               ),
  //             ),
  //             Padding(
  //               padding: EdgeInsets.symmetric(vertical: screen.height * 0.01),
  //               child: const Text(
  //                 'Please enter the verification code sent to your phone number',
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                   fontSize: 18,
  //                 ),
  //               ),
  //             ),
  //             Padding(
  //               padding: EdgeInsets.symmetric(vertical: screen.height * 0.03),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Form(
  //                     key: controller.formKey,
  //                     child: PinCodeTextField(
  //                       appContext: screen.context,
  //                       pastedTextStyle: TextStyle(
  //                         color: Colors.green.shade600,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                       length: 6,
  //                       obscureText: false,
  //                       animationType: AnimationType.fade,
  //                       pinTheme: PinTheme(
  //                         shape: PinCodeFieldShape.box,
  //                         borderRadius: BorderRadius.circular(8),
  //                         fieldHeight: screen.height * 0.07,
  //                         fieldWidth: screen.width * 0.095,
  //                         inactiveFillColor: Colors.white,
  //                         selectedFillColor: Colors.white,
  //                         activeFillColor: Colors.white,
  //                       ),
  //                       cursorColor: Colors.black,
  //                       animationDuration: Duration(milliseconds: 300),
  //                       enableActiveFill: true,
  //                       controller: controller.otpController,
  //                       keyboardType: TextInputType.number,
  //                       onCompleted: (v) {
  //                         //do something or move to next screen when code complete
  //                       },
  //                       onChanged: (value) {},
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     height: 14,
  //                   ),
  //                   TextButton(
  //                     onPressed: () {},
  //                     child: const Text(
  //                       "Resend your code",
  //                       style: TextStyle(
  //                         color: AppColors.primary,
  //                         fontSize: 16,
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Padding(
  //               padding: EdgeInsets.symmetric(vertical: screen.height * 0.02),
  //               child: ElevatedButton(
  //                 onPressed: () {},
  //                 child: const Text("Confirm"),
  //                 style: ButtonStyle(
  //                   padding: MaterialStateProperty.all(
  //                     EdgeInsets.symmetric(horizontal: screen.width * 0.1),
  //                   ),
  //                   fixedSize: MaterialStateProperty.all(
  //                     Size(screen.width * 0.5, 48),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget? phone() {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screen.width * 0.2, vertical: screen.height * 0.12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: screen.width * 0.24,
                height: screen.height * 0.15,
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screen.height * 0.01),
                child:  Text(
                  'Verify'.tr,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screen.height * 0.01),
                child:  Text(
                  'Please enter the verification code sent to your phone number'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screen.height * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      key: controller.formKey,
                      child: PinCodeTextField(
                        appContext: screen.context,
                        pastedTextStyle: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                        autoFocus: true,
                        enablePinAutofill: true,
                        length: 6,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(8),
                          fieldHeight: screen.height * 0.06,
                          fieldWidth: screen.width * 0.09,
                          inactiveFillColor: Colors.white,
                          selectedFillColor: Colors.white,
                          activeFillColor: Colors.white,
                        ),
                        backgroundColor: Colors.transparent,
                        cursorColor: Colors.black,
                        textStyle: const TextStyle(
                          color: Colors.black54,
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        keyboardAppearance: Brightness.dark,
                        controller: controller.otpController,
                        keyboardType: TextInputType.number,
                        onCompleted: (v) {
                          //do something or move to next screen when code complete
                        },
                        onChanged: (value) {},
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child:  Text(
                        "Resend your code".tr,
                        style: TextStyle(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screen.height * 0.02),
                child: ElevatedButton(
                  onPressed: () {
                    controller.verifyOTP();
                  },
                  child:  Text("Confirm"),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: screen.width * 0.1),
                    ),
                    fixedSize: MaterialStateProperty.all(
                      Size(screen.width * 0.8, 48),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
