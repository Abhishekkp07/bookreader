import 'package:bookreader/global_widget/typefield.dart';
import 'package:bookreader/view/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Registration_page extends StatefulWidget {
  const Registration_page({super.key});

  @override
  State<Registration_page> createState() => _Registration_pageState();
}

class _Registration_pageState extends State<Registration_page> {
  var name_cntrl = TextEditingController();
  var pass_cntrl = TextEditingController();
  var formkey = GlobalKey<FormState>();
  late SharedPreferences preferences;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Center(
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TypeField(
                  labelText: "Name",
                  controller: name_cntrl,
                  prefixIcon: Icon(Icons.person),
                  validator: (username) {
                    if (username!.isEmpty) {
                      return "username is empty";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TypeField(
                  labelText: "Password",
                  controller: pass_cntrl,
                  prefixIcon: Icon(Icons.password),
                  validator: (password) {
                    if (password!.isEmpty || password.length < 6) {
                      return "password is empty / length should be >6";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                MaterialButton(
                  height: 55,
                  minWidth: 180,
                  shape: StadiumBorder(),
                  color: Colors.blue,
                  onPressed: () {
                    var valid=formkey.currentState!.validate();
                    if(valid==true){
                      storeData();
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("invalid inputs")));
                    }
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void storeData() async{
    String name= name_cntrl.text;
    String pass=pass_cntrl.text;

    preferences=await SharedPreferences.getInstance();

    preferences.setString('username', name);
    preferences.setString('password', pass);

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Login_page()));
  }
}