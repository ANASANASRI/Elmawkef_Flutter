import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:elmawkef_inc/app/controllers/home_page.dart';
import 'package:elmawkef_inc/app/controllers/profile.dart';
import 'package:elmawkef_inc/app/views/components/section_title.dart';
import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class Profile extends GetResponsiveView<ProfileController> {
  @override
  final controller = Get.put(ProfileController());

  // https://medium.com/flutter-community/create-custom-radio-input-in-flutter-8d94a273d374
  XFile? image;
  final homeController = Get.put(HomePageController());

  @override
  Widget? phone() {
    return Scaffold(
      appBar: AppBar(
        title: SectionTitle(
          text: 'Profile',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            // Card(
            //   elevation: 1,
            //   child: Padding(
            //     padding: const EdgeInsets.all(12.0),
            //     child: Row(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: <Widget>[
            //         Container(
            //           width: screen.width * 0.25,
            //           height: screen.height * 0.15,
            //           color: Colors.blue,
            //         ),
            //         const SizedBox(
            //           width: 16,
            //         ),
            //         Text(
            //           'John Doe',
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            FutureBuilder<String?>(
              future: homeController.getUserName(),
              builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                if (snapshot.connectionState == ConnectionState.none) {
                  return DrawerHeader(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: Get.width * 0.25,
                          height: Get.height * 0.15,
                          color: Colors.blue,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                    decoration:
                        BoxDecoration(color: Get.theme.colorScheme.primary),
                  );
                }
                if (snapshot.hasData) {
                  return UserAccountsDrawerHeader(
                    accountName: Text("${snapshot.data}"),
                    accountEmail: FutureBuilder<String?>(
                        future: homeController.getPhoneNumber(),
                        builder: (BuildContext context,
                            AsyncSnapshot<String?> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.none) {
                            return Text("06-XX-XXX-XX");
                          }
                          if (snapshot.hasData) {
                            Text("${snapshot.data}");
                          }
                          return Text("06-XX-XXX-XX");
                        }),
                    currentAccountPicture: TextAvatar(
                        shape: Shape.Circular,
                        size: 35,
                        textColor: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        upperCase: true,
                        backgroundColor: Colors.black,
                        numberLetters: 2,
                        text: "${snapshot.data}"),
                  );
                }
                return DrawerHeader(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: Get.width * 0.25,
                        height: Get.height * 0.15,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                  decoration:
                      BoxDecoration(color: Get.theme.colorScheme.primary),
                );
              },
            ),
            Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 14),
                        child: Text(
                          'Phone Number',
                          style: TextStyle(fontSize: 16),
                        ),
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
                        selectorTextStyle: const TextStyle(color: Colors.black),
                        initialValue: controller.number,
                        textFieldController: controller.phoneController,
                        formatInput: false,
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        inputBorder: const OutlineInputBorder(),
                        onSaved: (PhoneNumber number) {},
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 14),
                        child: Text(
                          'E-mail',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hintText: 'Enter your phone e-mail',
                            labelText: 'email@test.com',
                            floatingLabelBehavior: FloatingLabelBehavior.never),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        child: Text(
                          'Gender',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      GenderPickerWithImage(
                        showOtherGender: false,
                        verticalAlignedText: true,
                        selectedGender: Gender.Male,
                        selectedGenderTextStyle:
                        TextStyle(fontWeight: FontWeight.bold),
                        unSelectedGenderTextStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.normal),
                        onChanged: (Gender? gender) {
                          print(gender);
                        },
                        equallyAligned: true,
                        animationDuration: Duration(milliseconds: 300),
                        isCircular: true,
                        opacityOfGradient: 0.4,
                        padding: const EdgeInsets.all(3),
                        size: 80,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 14),
                        child: Text(
                          'Date of Birth',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      DateTimePicker(
                        firstDate: DateTime(DateTime.now().year - 120),
                        lastDate: DateTime.now(),
                        fieldLabelText: 'Date of Birth',
                        dateMask: 'd MMM, yyyy',
                        initialValue: DateTime.now().toString(),
                        onChanged: (val) {},
                        onSaved: (val) {},
                        dateHintText: 'Enter Date',
                      ),
                      Obx(
                            () => !controller.becomePro.value
                            ? Container()
                            : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 14),
                              child: Text(
                                'Category',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            DropdownButtonFormField(
                              isExpanded: true,
                                    value: controller.selectedValue.value
                                        .toString(),
                                    items: controller.categires
                                        .map((e) => DropdownMenuItem(
                                              child: Text('$e'),
                                              value: '$e',
                                            ))
                                        .toList(),
                                    onChanged: (String? value) {
                                      controller.selectedValue.value = value!;
                                    },
                                  ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 14),
                              child: Text(
                                'Experience',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    controller.inc();
                                  },
                                  child: Icon(
                                      Icons.exposure_plus_1_outlined),
                                ),
                                Obx(
                                      () => Text(
                                      '${controller.counter.value.toString()} Year',
                                      style: TextStyle(fontSize: 22.0)),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    controller.dec();
                                  },
                                  child: Icon(
                                      Icons.exposure_minus_1_outlined),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 14),
                              child: Text(
                                'description',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              minLines: 6,
                              maxLines: null,
                              decoration: InputDecoration(
                                  hintText: 'Enter your description',
                                  floatingLabelBehavior:
                                  FloatingLabelBehavior.never),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 36,
                      ),
                      Obx(
                            () => Center(
                          child: ElevatedButton(
                            onPressed: () {
                              if (!controller.becomePro.value) {
                                controller.becomePro.value = true;
                              } else {
                                controller.becomePro.value = false;
                              }
                            },
                            child: !controller.becomePro.value
                                ? Text('Become Pro')
                                : Text('Go back to normal User'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (!controller.editMode.value) {
            controller.editMode.value = true;
          } else {
            controller.editMode.value = false;
          }
        },
        child: Obx(() =>
            controller.editMode.value ? Icon(Icons.save) : Icon(Icons.edit)),
      ),
    );
  }
}
