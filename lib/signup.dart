import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:login_sqlite/jsonModel/json-model.dart';
import 'package:login_sqlite/login.dart';
import 'package:login_sqlite/sqllite.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final username = TextEditingController();
  final passwords = TextEditingController();
  final confirmPasswords = TextEditingController();
  bool isHidden = true;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Center(
        child: SingleChildScrollView(
          child:  Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Text("Create New Account",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              
                  Container(
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                    decoration: BoxDecoration(
              
                      borderRadius:  BorderRadius.circular(8),
                      color: Colors.deepPurple.withOpacity(.3)
                      
                    ),
                  
                    child: TextFormField(
                      controller: username,
                      validator: (value){
                        if(value!.isEmpty){
                          return "user name is require ";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        
                        label: Text("Username"),
                        border: InputBorder.none,
                        hintText: "Username",icon: Icon(Icons.person),
                        ),
                    ),
                  ),
                  SizedBox(height: 20,),
              
                  Container(
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                    decoration: BoxDecoration(
              
                      borderRadius:  BorderRadius.circular(8),
                      color: Colors.deepPurple.withOpacity(.3)
                      
                    ),
                  
                    child: TextFormField(
                      controller: passwords,
                      validator: (value){
                        if(value!.isEmpty){
                          return "passworlds is require";
                        }
                        return null;
                      },
                      obscureText: isHidden,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        label: Text("Passwords"),
                        border: InputBorder.none,
                        hintText: "Passwords",icon: Icon(Icons.lock),
                        suffix: IconButton(onPressed: (
                                  
                        ){
                          setState(() {
                            isHidden = !isHidden;
                          });
                          
                        },icon: Icon(isHidden ? Icons.visibility : Icons.visibility_off),)
                        ),
                    ),
                  ),
 SizedBox(height: 20,),
                   Container(
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                    decoration: BoxDecoration(
              
                      borderRadius:  BorderRadius.circular(8),
                      color: Colors.deepPurple.withOpacity(.3)
                      
                    ),
                  
                    child: TextFormField(
                      controller: confirmPasswords,
                      validator: (value){
                        if(value!.isEmpty){
                          return "passworlds is require";
                        }else if(passwords.text != confirmPasswords.text){
                          return "passwords not match";
                        }
                        return null;
                      },
                      obscureText: isHidden,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        label: Text("Confirm Password"),
                        border: InputBorder.none,
                        hintText: "Confirm Password",icon: Icon(Icons.lock),
                        suffix: IconButton(onPressed: (
                                  
                        ){
                          setState(() {
                            isHidden = !isHidden;
                          });
                          
                        },icon: Icon(isHidden ? Icons.visibility : Icons.visibility_off),)
                        ),
                    ),
                  ),
              
                  Container(
                    margin: EdgeInsets.only(top: 20,bottom: 10),
                    width: MediaQuery.sizeOf(context).width * .8,
                    decoration: BoxDecoration(color: Colors.deepPurple,borderRadius: BorderRadius.circular(8)),
                    child: TextButton(onPressed: (){
                      if(formKey.currentState!.validate()){
                          final db = DatabaseHelper();
                          db.
                          signup(Users(userName: username.text, userPassword: passwords.text)
                          ).whenComplete((){
Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));

                          });
                        
                      }
                      print("hello");
                    }, child: Text("SIGN UP",style: TextStyle(color: Colors.white)))),
              
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Aready have account?"),
                        TextButton(onPressed: (){
                          Navigator.of(context).pop();
                        }, child: Text("Login"))
                      ],
                    )
              
                ],
              ),
            ),
          )),
      ),
    );
  }
}