import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newone/Screens/Home/home.dart';
import 'package:newone/constant/colors.dart';
import 'package:newone/constant/style.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool isObscure = true;

  @override
  void initState() {
    isObscure = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBgColor,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 55, 8.0, 5.0),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      child: Image.asset(
                        "assets/image/avatar.jpg",
                        fit: BoxFit.cover,
                      ),
                      radius: 85,
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    buildUserNameInputField(),
                    const SizedBox(
                      height: 15.0,
                    ),
                    buildPasswordInputField(),
                    forgetPasswordButton(),
                    const SizedBox(
                      height: 35,
                    ),
                    loginButton(),
                    TextButton(
                        onPressed: () {
                          print("hiii");
                        },
                        child: const Text(
                          "New User?SignUp",
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget buildUserNameInputField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: usernameController,
      decoration: inputDecoration("Username", Icons.person),
      validator: (value) {
        if (value!.isEmpty) {
          return "* Required";
        } else
          return null;
      },
    );
  }

  Widget buildPasswordInputField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      obscureText: isObscure,
      controller: passwordController,
      decoration: InputDecoration(
          labelText: "Password",
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(
              isObscure ? Icons.visibility_off : Icons.visibility,
              color: isObscure ? Colors.grey : Colors.black,
            ),
            onPressed: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          )),
      validator: (value) {
        if (value!.isEmpty) {
          return "* Required";
        } else if (value.length < 6) {
          return "Password should be atleast 6 characters";
        } else if (value.length > 15) {
          return "Password should not be greater than 15 characters";
        } else
          return null;
      },
    );
  }

  Widget forgetPasswordButton() {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 20,
      width: size.width,
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget loginButton() {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      hoverColor: Colors.white,
      onTap: () {
        if (formkey.currentState!.validate()) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
          SnackBar(content: Text("Validate"));
        } else {
          SnackBar(content: Text("Not validate"));
        }
      },
      child: Container(
        height: size.height / 16,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: const Color(0xfffda0dd),
        ),
        child: const Center(
          child: Text(
            "Go",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
