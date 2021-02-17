import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:my_autocare/Authentication/otp_screen.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Container(
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Image.asset("images/loginlogo.png", height: 100,
                      width: 200,),
                    SizedBox(height: 20),
                    Text("Welcome",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
                    SizedBox(height: 5,),
                    Text("Login for a personalized experience",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500 ),),
                  ],
                ),
              ),


              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,

                        ),
                        child: InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number)
                          {
                            print(number.phoneNumber);
                          },
                          onInputValidated: (bool value)
                          {
                            print(value);
                          },
                          selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle: TextStyle(color: Colors.black),
                          inputDecoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              hintText: "Phone Number"
                          ),
                          initialValue: number,
                          textFieldController: controller,
                          formatInput: false,
                          keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                          onSaved: (PhoneNumber number) {
                            print('On Saved: $number');
                          },
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (BuildContext context) => new Otp(
                                    email: "shara.app@gmail.com",
                                  )));
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child:
                            Text("Send OTP",style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            ),)),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 55,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: Colors.redAccent
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(25, 4, 4, 4),
                                      child: Image.asset("images/google.png",
                                        height: 30,
                                        width: 30,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text("Google",style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18
                                      ),),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 55,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: Colors.redAccent
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(25, 4, 4,4),
                                      child: Image.asset("images/facebook.png",
                                        height: 30,
                                        width: 30,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text("FaceBook",style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),



              Container(
                child: Column(
                  children: [
                    Text("By Continuing you agree to MyAutocare",
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16,fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Terms & Condition",style: TextStyle(
                            color: Colors.red,fontWeight: FontWeight.bold
                        ),),
                        Text(" and ",style: TextStyle(color: Colors.grey[600]),),
                        Text("Privacy Policy",style: TextStyle(
                            color: Colors.red,fontWeight: FontWeight.bold
                        ),),
                      ],
                    )

                  ],
                ),
              )


            ],
          )
      ),
    );
  }
}