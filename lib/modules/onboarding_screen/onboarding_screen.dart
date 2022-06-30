import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:taskone/components/components.dart';
import 'package:taskone/components/widgets/customButton.dart';
import 'package:taskone/constant/constant.dart';
import 'package:taskone/modules/login_screen/loginScreen.dart';
import 'package:taskone/modules/onboarding_screen/onBoardingItem.dart';
import 'package:taskone/modules/signupScreen/signupScreen.dart';
import 'package:taskone/style/size_config.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController =PageController();
  bool isLast=true;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double? width = SizeConfig.screenW;

    return Scaffold(
        body:Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
             const SizedBox(height: 70,),
             isLast ? Row(
               children: [
                 Spacer(),
                 CustomButton(text: 'Skip',width: 80,borderRadius: 50,color: HexColor("#faf2e7"),borderColor:HexColor("#faf2e7"),Fontcolor: Colors.black, onTap:(){
                   boardController.jumpToPage(2);
                 } ,)
               ],
             ) :SizedBox(height: 40,),
              Expanded(
                flex: 3,
                child: PageView.builder(
                  controller: boardController,
                  onPageChanged: (int index){
                    if(index == boarding.length-1){
                      setState(() {
                         isLast=false;
                      });
                    }
                    else {
                      setState(() {
                         isLast=true;
                      });
                    }
                  },
                  itemBuilder: ((context, index) => BuildBoardingItem(boarding[index])),
                  itemCount: boarding.length,
                ),
              ),
              const SizedBox(height: 10,),
              Expanded(
                flex: 1,
                child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            SmoothPageIndicator(
                              controller: boardController,
                              count: boarding.length,
                              effect:   SlideEffect(
                                  spacing:  5.0,
                                  radius:  8.0,
                                  dotWidth:  20.0,
                                  dotHeight:  7.0,
                                  dotColor: HexColor('#dadada'),
                                  activeDotColor:  HexColor('#ce5c4c'),
                              ),
                            ),
                          ]
                      ),
                      const SizedBox(height: 25,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: CustomButton(text: 'Get Started', borderRadius: 15,onTap:(){
                        NavigateTo(context: context,router: LoginScreen());

                        } ,),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account ?',style:TextStyle(fontWeight: FontWeight.w600,)),
                          CustomTextButton(text: 'Sign Up', onPressed:() {
                            NavigateTo(router: SignUpScreen(),context: context);

                          },),

                        ],
                      ),




                    ]
                ),
              ),
            ],),
        )
    );
  }
}
