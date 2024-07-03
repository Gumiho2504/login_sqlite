import 'package:flutter/material.dart';
import 'package:login_sqlite/home-page.dart';
import 'package:login_sqlite/jsonModel/json-model.dart';
import 'package:login_sqlite/signup.dart';
import 'package:login_sqlite/sqllite.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final username = TextEditingController();
  final passwords = TextEditingController();
  bool isHidden = true;
  bool isLogin = false;
  final formKey = GlobalKey<FormState>();
  final database = DatabaseHelper();
 login() async {
   var res = await database.login(Users(userName: username.text, userPassword: passwords.text));
   if(res == true){
    if(!mounted) return;
    Navigator.of(context).push(MaterialPageRoute(
builder: (context) => HomePage()
    ));
   }else{
    setState(() {
      isLogin = true;
    });
    
   }
 }

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
              Container(
                child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcEAaXhXtfx1ybRrwl9RoSY3cE3iRga8entA&usqp=CAU",fit: BoxFit.cover,)),
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
              
                  Container(
                    margin: EdgeInsets.only(top: 20,bottom: 10),
                    width: MediaQuery.sizeOf(context).width * .8,
                    decoration: BoxDecoration(color: Colors.deepPurple,borderRadius: BorderRadius.circular(8)),
                    child: TextButton(onPressed: (){
                      
                      if(formKey.currentState!.validate()){
              login();
                      }
                      print("hello");
                    }, child: Text("Login",style: TextStyle(color: Colors.white)))),
              
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have account?"),
                        TextButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SignUpPage()));
                        }, child: Text("SIGN UP"))
                      ],
                    ),

      isLogin ?   const   Text("User or Password is Incorrect",style: TextStyle(color: Colors.red),) : const SizedBox(),
              
                ],
              ),
            ),
          )),
      ),
    );
  }
}