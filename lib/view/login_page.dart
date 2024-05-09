import 'package:bookreader/global_widget/typefield.dart';
import 'package:bookreader/view/homepage.dart';
import 'package:bookreader/view/registration_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: Login_page(),debugShowCheckedModeBanner: false,
  ));
}

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TypeField(
                    controller: name_cntrl,
                    validator: (username) {
                      if (username!.isEmpty) {
                        return "username is empty";
                      } else {
                        return null;
                      }
                    },
                    labelText: "Name",
                    prefixIcon: Icon(Icons.person)),
                SizedBox(
                  height: 15,
                ),
                TypeField(
                    controller: pass_cntrl,
                    validator: (password) {
                      if (password!.isEmpty || password.length < 6) {
                        return "password is empty / length should be >6";
                      } else {
                        return null;
                      }
                    },
                    labelText: "password",
                    prefixIcon: Icon(Icons.password)),
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
                     validateinput();
                   }else{
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("invalid inputs")));
                   }
                  },
                  child: Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                          builder: (context) => Registration_page()), (route) => false);
                    },
                    child: Text(
                      "Not a user ?? Register Here !!!",
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateinput() async{
    String uname = name_cntrl.text;
    String pwd = pass_cntrl.text;

    preferences =await SharedPreferences.getInstance();

    String stored_name=preferences.getString("username")!;
    String stored_pass=preferences.getString("password")!;

    if(stored_name==uname && stored_pass==pwd){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Home_page()));
    }
  }
}


