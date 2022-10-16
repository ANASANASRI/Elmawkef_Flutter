import 'package:elmawkef_inc/app/controllers/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../controllers/signup.dart';

class SignUp extends GetResponsiveView<SignUpController> {
  @override
  final controller = Get.put(SignUpController(), permanent: true);
  ConnectivityController connectivityController =
      Get.put(ConnectivityController());

  String  name = '';

  // @override
  // Widget? desktop() {
  //   return Scaffold(
  //     body: Padding(
  //       padding: EdgeInsets.symmetric(
  //           horizontal: screen.width * 0.2, vertical: screen.height * 0.12),
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
  //                 width: screen.width * 0.5,
  //                 height: screen.height * 0.2,
  //                 child: Image.asset(
  //                   'assets/logo.png',
  //                   fit: BoxFit.contain,
  //                 ),
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.symmetric(vertical: screen.height * 0.01),
  //                 child: const Text(
  //                   'Sign up',
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
  //                   'Please enter your details to sign up and create an account.',
  //                   textAlign: TextAlign.center,
  //                   style: TextStyle(
  //                     fontSize: 18,
  //                   ),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.symmetric(vertical: screen.height * 0.03),
  //                 child: Column(
  //                   children: [
  //                     Form(
  //                       key: controller.formKey,
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: <Widget>[
  //                           TextFormField(
  //                             decoration: const InputDecoration(
  //                               border: UnderlineInputBorder(),
  //                               labelText: 'Your name',
  //                               prefixIcon: Icon(Icons.person),
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             height: screen.height * 0.025,
  //                           ),
  //                           InternationalPhoneNumberInput(
  //                             onInputChanged: (PhoneNumber number) {
  //                               controller.number = number;
  //                             },
  //                             selectorConfig: const SelectorConfig(
  //                               selectorType: PhoneInputSelectorType.DIALOG,
  //                             ),
  //                             ignoreBlank: false,
  //                             autoValidateMode: AutovalidateMode.disabled,
  //                             selectorTextStyle: TextStyle(color: Colors.black),
  //                             initialValue: controller.number,
  //                             textFieldController: controller.phoneController,
  //                             formatInput: false,
  //                             keyboardType:
  //                                 const TextInputType.numberWithOptions(
  //                                     signed: true, decimal: true),
  //                             inputBorder: const OutlineInputBorder(),
  //                             onSaved: (PhoneNumber number) {},
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.symmetric(vertical: screen.height * 0.03),
  //                 child: ElevatedButton(
  //                   onPressed: () async {
  //                     print("number is : ${controller.number.toString()}");
  //                   },
  //                   child: const Text("Next"),
  //                   style: ButtonStyle(
  //                     padding: MaterialStateProperty.all(
  //                       EdgeInsets.symmetric(horizontal: screen.width * 0.1),
  //                     ),
  //                     fixedSize: MaterialStateProperty.all(
  //                       Size(screen.width * 0.8, 48),
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
  //
  // @override
  // Widget? tablet() {
  //   return Scaffold(
  //     body: Padding(
  //       padding: EdgeInsets.symmetric(
  //           horizontal: screen.width * 0.2, vertical: screen.height * 0.12),
  //       child: SingleChildScrollView(
  //         child: Column(
  //           children: [
  //             SizedBox(
  //               width: screen.width * 0.5,
  //               height: screen.height * 0.2,
  //               child: Image.asset(
  //                 'assets/logo.png',
  //                 fit: BoxFit.contain,
  //               ),
  //             ),
  //             Padding(
  //               padding: EdgeInsets.symmetric(vertical: screen.height * 0.01),
  //               child: const Text(
  //                 'Sign up',
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
  //                 'Please enter your details to sign up and create an account.',
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                   fontSize: 18,
  //                 ),
  //               ),
  //             ),
  //             Padding(
  //               padding: EdgeInsets.symmetric(vertical: screen.height * 0.03),
  //               child: Column(
  //                 children: [
  //                   Form(
  //                     key: controller.formKey,
  //                     child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: <Widget>[
  //                         TextFormField(
  //                           decoration: const InputDecoration(
  //                               border: UnderlineInputBorder(),
  //                               labelText: 'Your name',
  //                               prefixIcon: Icon(Icons.person)),
  //                         ),
  //                         SizedBox(
  //                           height: screen.height * 0.025,
  //                         ),
  //                         InternationalPhoneNumberInput(
  //                           onInputChanged: (PhoneNumber number) {
  //                             controller.number = number;
  //                           },
  //                           selectorConfig: const SelectorConfig(
  //                             selectorType: PhoneInputSelectorType.DIALOG,
  //                           ),
  //                           ignoreBlank: false,
  //                           autoValidateMode: AutovalidateMode.disabled,
  //                           selectorTextStyle: TextStyle(color: Colors.black),
  //                           initialValue: controller.number,
  //                           textFieldController: controller.phoneController,
  //                           formatInput: false,
  //                           keyboardType: const TextInputType.numberWithOptions(
  //                               signed: true, decimal: true),
  //                           inputBorder: const OutlineInputBorder(),
  //                           onSaved: (PhoneNumber number) {
  //                             print(number.toString());
  //                           },
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Padding(
  //               padding: EdgeInsets.symmetric(vertical: screen.height * 0.03),
  //               child: ElevatedButton(
  //                 onPressed: () {
  //                   print(controller.number.toString());
  //                 },
  //                 child: const Text("Next"),
  //                 style: ButtonStyle(
  //                   padding: MaterialStateProperty.all(
  //                     EdgeInsets.symmetric(horizontal: screen.width * 0.1),
  //                   ),
  //                   fixedSize: MaterialStateProperty.all(
  //                     Size(screen.width * 0.8, 48),
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
            horizontal: screen.width * 0.06, vertical: screen.height * 0.12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: screen.width * 0.4,
                height: screen.height * 0.15,
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screen.height * 0.02),
                child: Text(
                  'Sign up'.tr,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screen.height * 0.02),
                child: Text(
                  'Please enter your details to sign up and create an account.'
                      .tr,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screen.height * 0.03),
                child: Column(
                  children: [
                    Form(
                      key: controller.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Your name'.tr,
                              prefixIcon: Icon(Icons.person),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (String? val) {
                              if (val == null || val.length < 3) {
                                return "Le nom est  pas valid".tr;
                              } else
                                return null;
                            },
                            onChanged: (String val){
                              name = val;
                            },
                          ),
                          SizedBox(
                            height: screen.height * 0.025,
                          ),
                          InternationalPhoneNumberInput(
                            onInputChanged: (PhoneNumber number) {
                              controller.number = number;
                            },
                            selectorConfig: const SelectorConfig(
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                              setSelectorButtonAsPrefixIcon: true,
                              leadingPadding: 20,
                            ),
                            ignoreBlank: false,
                            autoValidateMode: AutovalidateMode.disabled,
                            selectorTextStyle:
                                const TextStyle(color: Colors.black),
                            initialValue: controller.number,
                            textFieldController: controller.phoneController,
                            formatInput: false,
                            keyboardType: const TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            inputBorder: const OutlineInputBorder(),
                            onSaved: (PhoneNumber number) {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screen.height * 0.03),
                child:  ElevatedButton(
                  onPressed: () {
                    controller.verifyNumber(controller.number.toString(),
                        name);
                  },
                  child: Text("Next".tr),
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
              // GetBuilder<ConnectivityController>(
              //     builder: (builder) {
              //       if (connectivityController.connectionType.value == 0) {
              //         Get.snackbar(
              //           "GeeksforGeeks",
              //           "Hello everyone",
              //           icon: Icon(Icons.person, color: Colors.white),
              //           snackPosition: SnackPosition.BOTTOM,
              //           backgroundColor: Colors.green,
              //           borderRadius: 20,
              //           margin: EdgeInsets.all(15),
              //           colorText: Colors.white,
              //           duration: Duration(hours: 4),
              //           isDismissible: true,
              //           // dismissDirection: SnackDismissDirection.HORIZONTAL,
              //           forwardAnimationCurve: Curves.easeOutBack,
              //         );
              //         return Container();
              //       } else {
              //         Get.snackbar(
              //           "GeeksforGeeks",
              //           "Hello everyone",
              //           icon: Icon(Icons.person, color: Colors.white),
              //           snackPosition: SnackPosition.BOTTOM,
              //           backgroundColor: Colors.red,
              //           borderRadius: 20,
              //           margin: EdgeInsets.all(15),
              //           colorText: Colors.white,
              //           duration: Duration(seconds: 4),
              //           isDismissible: true,
              //           // dismissDirection: SnackDismissDirection.HORIZONTAL,
              //           forwardAnimationCurve: Curves.easeOutBack,
              //         );
              //         return Container();
              //       }
              //       return Container();
              //     },
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
