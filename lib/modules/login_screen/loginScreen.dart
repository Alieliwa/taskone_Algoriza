import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskone/components/components.dart';
import 'package:taskone/components/widgets/customButton.dart';
import 'package:taskone/components/widgets/custromTextForm.dart';
import 'package:taskone/constant/constant.dart';
import 'package:taskone/modules/signupScreen/signupScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController PhoneController = new TextEditingController();
  bool _secirty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              //image
              Image.asset(
                "assets/images/background.png",
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              //Sign In Body
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25,),
                    Text('Welcome To Fashion Daily',
                        style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Colors.grey[600])),
                    SizedBox(height: 15,),
                    //Title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text('Sign in ',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 40,color: Colors.black)),
                        Row(
                          children: [
                             Text('Help',
                              style: TextStyle(
                                color: Colors.blue,fontSize: 17,fontWeight: FontWeight.w500

                              ),
                            ),
                            Icon(Icons.help,color: Colors.blue,size: 25,)


                          ],
                        )

                    ],),
                    SizedBox(height: 15,),
                    //phone
                    Form(
                        key: formkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextField(
                              FieldName: 'Phone Number',
                              controller: PhoneController,
                              hintText: 'Eg. 812345678',
                              isphone: true,
                              textInputType: TextInputType.phone,
                            ),

                          ],
                        )),
                    SizedBox(height: 15,),
                    //Signin
                    CustomButton(text: 'Sign in',color: Colors.blue, borderRadius: 5,onTap:(){
                      if (formkey.currentState!.validate()){
                      }

                    } ,),
                    SizedBox(height: 15,),
                    //OR
                    Row(
                      children: [
                        Expanded(
                          child: MyDivider()
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text('OR'),
                        ),
                        Expanded(
                          child:MyDivider(),
                        ),
                      ],),
                    SizedBox(height: 15,),
                    //Sign With Google
                    CustomButton(text:' Sign with by google',borderColor: Colors.blue,
                        onTap:(){},color: Colors.white,Fontcolor: Colors.blue,IsSocialMediaLoginButton: true,borderRadius: 10),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Doesn\'t has any account ?',style:TextStyle(fontWeight: FontWeight.w600,)),
                        CustomTextButton(text: 'Register here',textcolor: Colors.blue, onPressed:() {
                           NavigateTo(router: SignUpScreen(),context: context);
                        },),
                      ],
                    ),
                    SizedBox(height: 25,),
                    Text(
                      'Use the application according to policy rules, Any kind of violations will be subject to sanctions.',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ],
          )),
    ));
  }
}
