import 'package:code/Controller/Loginpagecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loginpage extends GetView<LoginPageController> {
  Loginpage({Key? key}) : super(key: key);

  final formfield = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    LoginPageController controller = Get.put(LoginPageController());
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.indigo[800],
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            controller.logincall();
            // _loginCall();
            // if (formfield.currentState!.validate()) {
            //   Navigator.pushAndRemoveUntil(
            //       context,
            //       MaterialPageRoute(builder: (_) => viewbottom()),
            //       ModalRoute.withName("/Home"));
            // }
          },
          child: const Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return GetBuilder<LoginPageController>(
        init: LoginPageController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(color: Colors.white),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Form(
                    key: formfield,
                    child: Column(
                      children: [
                        Text("Welcome",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.indigo[800],
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Image.asset(
                            'asset/nadi_logo.gif',
                            width: 200,
                            height: 200,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: controller.usercontroller,
                          decoration: InputDecoration(
                            labelText: "User Name",
                            labelStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.black26,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Username';
                            }
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Obx(() => TextFormField(
                              controller: controller.passwordcontroller,
                              obscureText: controller.pass.value,
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                      fontSize: 15, color: Colors.black26),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      controller.pass.toggle();
                                    },
                                    child: Icon(controller.pass.value
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  )),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Password';
                                } else if (controller
                                        .passwordcontroller.text.length <
                                    4) {
                                  return 'Password Should be more than 4 characters';
                                }
                              },
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "Forgot Password ?",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        loginButton,
                        SizedBox(
                          height: 40,
                        ),
                        Text("Version 1.5")
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
