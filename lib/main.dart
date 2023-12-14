import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:travel_app_17112023_b2b/utils/response_handler.dart';
import 'package:travel_app_17112023_b2b/utils/shared_preferences.dart';

import 'Dashboard.dart';
import 'Models/LoginModel.dart';

void main() {
  runApp(MaterialApp(home: LoginScreen()));
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String MemberId = '';
  String UserName = '';
  String base64Image = '';
  bool _showPassword = false;
  Future<http.Response>? __futureLogin;

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _forgetpasswordUsercontroller =
      TextEditingController();
  Future<void> _forgotPassword() async {
    try {
      MemberId = await Prefs.getStringValue(Prefs.PREFS_USER_ID);
      log("MemberId" + MemberId);
      UserName = await Prefs.getStringValue(Prefs.PREFS_USER_NAME);

      __futureLogin = ResponseHandler.performPost(
          "ForgotPassword", 'Username=${_forgetpasswordUsercontroller.text}');

      __futureLogin?.then((value) {
        print('Response body: ${value.body}');

        String jsonResponse = ResponseHandler.parseData(value.body);

        print('JSON Response: ${jsonResponse}');
        try {
          List<dynamic> decodedJson = json.decode(jsonResponse);
          Map<String, dynamic> firstUser = decodedJson[0];

          print('CustomerId ${firstUser["CustomerId"]}');
          print('Balance ${firstUser["Balance"]}');
          setState(() {});

          print('TransactionPassword: ${firstUser["TransactionPassword"]}');
          print('------------------');
        } catch (error) {
          log(error.toString());
        }
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF1d5e72), // Dark green color
    ));
    return Container(
        color: const Color(0xFF1d5e72),
        child: Center(
          child: Card(
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            color: Color(0xFF1d5e72),
            elevation: 16.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          width: 100,
                          image: AssetImage("assets/images/loginoho.jpg"))
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: Divider()),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "Login to B2B Account",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Montserrat",
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(child: Divider())
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                              hintText: "Username",
                              hintStyle: TextStyle(
                                fontFamily: "Montserrat",
                                color: Colors.white,
                              ),
                              icon: Icon(
                                Icons.people,
                                color: Colors.white,
                              )),
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 15,
                            color: Colors.white,
                          ),
                          controller: _userNameController,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextField(
                          controller: _passwordController,
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 15,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: const TextStyle(
                              fontFamily: "Montserrat",
                              color: Colors.white,
                            ),
                            icon: const Icon(
                              Icons.password,
                              color: Colors.white,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: _togglePasswordVisibility,
                              child: _showPassword
                                  ? const Icon(
                                      Icons.visibility,
                                      color: Colors.white,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: Colors.white,
                                    ),
                            ),
                          ),
                          obscureText: _showPassword,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Forgot password?",
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: Colors.yellow),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          height: 40,
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  CircularProgressIndicator(
                                      color: Colors
                                          .yellow), // Place the CircularProgressIndicator on top
                                  SfRadialGauge(
                                    axes: <RadialAxis>[
                                      RadialAxis(
                                        minimum: 0,
                                        maximum: 360,
                                        showAxisLine: false,
                                        showLabels: false,
                                        showTicks: false,
                                        radiusFactor: 0.55,
                                        pointers: <GaugePointer>[
                                          RangePointer(
                                            value: 330,
                                            width: 0.25,
                                            cornerStyle: CornerStyle.bothCurve,
                                            sizeUnit: GaugeSizeUnit.factor,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              );

                              print(
                                  'JSON Response: ${_userNameController.text}');
                              __futureLogin = ResponseHandler.performPost(
                                  "B2bLogin",
                                  'Username=' +
                                      _userNameController.text +
                                      '&Password=' +
                                      _passwordController.text);
                              __futureLogin?.then((value) {
                                print('Response body: ${value.body}');

                                String jsonResponse =
                                    ResponseHandler.parseData(value.body);

                                print('JSON Respertttonse: ${jsonResponse}');

                                /*   try {
                          // Decode JSON
                          Map<String, dynamic>? decodedJsonMap =
                              json.decode(jsonResponse);

                          LoginModel fm =
                              LoginModel.fromJson(decodedJsonMap?[0]);
                          print('Name: ${fm.Name}');

                          */ /*  Prefs.saveStringValue(
                              Prefs.PREFS_USER_TYPE, fm.UserType);
                          Prefs.saveStringValue(
                              Prefs.PREFS_USER_TYPE_ID, fm.UserTypeId);
                          Prefs.saveStringValue(Prefs.PREFS_USER_ID, fm.UserID);
                          MemberId = fm.UserID;
                          print('USERID' + MemberId);
                          Prefs.saveStringValue(
                              Prefs.PREFS_USER_NAME, fm.Username);
                          UserName = fm.Username;

                          Prefs.saveStringValue(Prefs.PREFS_NAME, fm.Name);
                          Prefs.saveStringValue(
                              Prefs.PREFS_PASSWORD, fm.Password);
                          Prefs.saveStringValue(
                              Prefs.PREFS_TRANSACTION_PASSWORD,
                              fm.TransactionPassword);
                          Prefs.saveStringValue(Prefs.PREFS_MOBILE, fm.Mobile);
                          Prefs.saveStringValue(Prefs.PREFS_TIME_IN, fm.Timein);
                          Prefs.saveStringValue(
                              Prefs.PREFS_TIME_OUT, fm.Timeout);

                          Prefs.saveStringValue(Prefs.PREFS_TWO, fm.Two);
                          Prefs.saveStringValue(Prefs.PREFS_PHOTO, fm.Photo);
                          base64Image = fm.Photo;
                          print('object$base64Image');
                          Prefs.saveStringValue(Prefs.PREFS_PAYPAL, fm.Paypal);
                          Prefs.saveStringValue(Prefs.PREFS_PAYZA, fm.Payza);
                          Prefs.saveStringValue(
                              Prefs.PREFS_DATE_CREATED, fm.Datecreated);
                          Prefs.saveStringValue(
                              Prefs.PREFS_CURRENCY, fm.Currency);*/ /*

                          Future<void> saveImageToPrefs() async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.setString('user_image', base64Image!);
                          }

                          saveImageToPrefs();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Dashboard(),
                            ),
                          );
                        } catch (error) {
                          log(error.toString());
                        }*/
                                try {
                                  Map<String, dynamic>? decodedJsonMap =
                                      json.decode(jsonResponse);

                                  if (decodedJsonMap != null &&
                                      decodedJsonMap.containsKey("Table")) {
                                    if (decodedJsonMap["Table"] is List) {
                                      List<dynamic> tableList =
                                          decodedJsonMap["Table"];

                                      if (tableList.isNotEmpty) {
                                        LoginModel fm =
                                            LoginModel.fromJson(tableList[0]);
                                        print('Name: ${fm.Name}');
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Dashboard(),
                                          ),
                                        );
                                      } else {
                                        print('Error: Decoded list is empty.');
                                      }
                                    } else {
                                      print(
                                          'Error: "Table" key is not a list.');
                                    }
                                  } else {
                                    print(
                                        'Error: "Table" key not found in the decoded JSON.');
                                  }
                                } catch (e) {
                                  print('Error decoding JSON: $e');
                                }
                              });
                              log('buttonPress' + _userNameController.text);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.yellow,
                              ),
                            ),
                            child: Text('LOGIN',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "New to BOQOL Travel? ",
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: Colors.white),
                            ),
                            Text(
                              "Join now ",
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: Colors.yellow),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class PasswordField extends StatefulWidget {
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  void togglePasswordVisibility() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 15),
      decoration: InputDecoration(
        hintText: 'Enter Password',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(1.0),
        ),
        suffixIcon: GestureDetector(
          onTap: togglePasswordVisibility,
          child: showPassword
              ? Icon(Icons.visibility)
              : Icon(Icons.visibility_off),
        ),
      ),
      obscureText: showPassword,
    );
  }
}
