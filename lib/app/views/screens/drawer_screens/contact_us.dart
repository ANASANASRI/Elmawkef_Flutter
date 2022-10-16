import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUs extends GetResponsiveView {
  final formKey = GlobalKey<FormState>();

  @override
  Widget? phone() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Text(
                          'We are always happy to hear from you !',
                          style: Get.textTheme.titleLarge
                              ?.copyWith(letterSpacing: 1.1),
                        ),
                      ),
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
                          hintText: 'Enter your  e-mail',
                          labelText: 'email@test.com',
                          floatingLabelBehavior: FloatingLabelBehavior.auto),
                      validator: (String? val) {
                        if (val == null || !GetUtils.isEmail(val)) {
                          return "email inValide".tr;
                        } else
                          return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 14),
                      child: Text(
                        'Title',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          hintText: 'Enter your Title',
                          labelText: 'i ask for ....',
                          floatingLabelBehavior: FloatingLabelBehavior.auto),
                      validator: (String? val) {
                        if (val == null || val.length <= 5) {
                          return "Title taille petite".tr;
                        } else
                          return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 14),
                      child: Text(
                        'Message',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      minLines: 6,
                      maxLines: null,
                      decoration: InputDecoration(
                          hintText: 'Enter your message Here',
                          floatingLabelBehavior: FloatingLabelBehavior.never),
                      validator: (String? val) {
                        if (val == null || val.length < 8) {
                          return "Message taille petite".tr;
                        } else
                          return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              Get.snackbar(
                                "Your message has send",
                                "Merci a voter message",
                              );
                              formKey.currentState?.reset();
                            }
                          },
                          child: Text("Send Message"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
