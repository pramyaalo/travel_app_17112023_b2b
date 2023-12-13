import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddNewStaff extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<AddNewStaff> {
  String memberId = '', UserName = '', Name = '';
  Future<http.Response>? __futureLogin;
  late String FirstName,
      LastName,
      Email,
      mobile,
      address1,
      address2,
      city,
      state,
      pincode,
      postal;
  String selectedOption = 'Active';
  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _address1Controller = TextEditingController();
  final TextEditingController _address2Controller = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _postalareaController = TextEditingController();

  String _userImage = '';
  String? ImagePath;
  //final ImagePicker _imagePicker = ImagePicker();

  /* Future<void> _loadmemberid() async {
    try {
      memberId = await Prefs.getStringValue(Prefs.PREFS_USER_ID);
      log("memberfhhjykkId" + memberId);
      UserName = await Prefs.getStringValue(Prefs.PREFS_USER_NAME);
      Name = await Prefs.getStringValue(Prefs.PREFS_NAME);
      __futureLogin =
          ResponseHandler.performPost("MemberSearch", 'MemberId=${memberId}');
      print('memberdfgfdgghId: ${memberId}');
      __futureLogin?.then((value) {
        print('Response dgrgebody: ${value.body}');

        String jsonResponse = ResponseHandler.parseData(value.body);

        print('JSON Redghyjsponse: ${jsonResponse}');
        try {
          //Map<String, dynamic> map = json.decode(jsonResponse);
          List<dynamic> decodedJson = json.decode(jsonResponse);
          Map<String, dynamic> firstUser = decodedJson[0];

          // print('CustomerId ${firstUser["CustomerId"]}');
          print('Firstname ${firstUser["Firstname"]}');
          setState(() {
            _firstNameController.text = firstUser['Firstname'].toString();
            _lastnameController.text = firstUser['Lastname'].toString();
            _emailController.text = firstUser['Email'].toString();
            _mobileController.text = firstUser['Phone'].toString();
            _address1Controller.text = firstUser['AddressLine1'].toString();
            _address2Controller.text = firstUser['AddressLine2'].toString();
            _cityController.text = firstUser['City'].toString();
            _pincodeController.text = firstUser['Zipcode'].toString();
            _stateController.text = firstUser['State'].toString();
            _postalareaController.text = firstUser['Country'].toString();
            _userImage = firstUser['photo'].toString();
            if (_userImage.startsWith('..')) {
              _userImage =
                  _userImage.substring(2); // Remove the first two characters
            } */ /* if (accType == '2') {
              selectedAccountType = 'Current';
            } else {
              selectedAccountType = 'Savings';
            }*/ /*
            // _emailController.text = jsonData['Email'];
            String Firstname = firstUser["Firstname"].toString();

            print('Firstname:$Firstname');
            print('Firstname: ${_firstNameController.text}');
            print('Lastname: ${_lastnameController.text}');
            print('Email: ${_emailController.text}');
            print('Phone: ${_mobileController.text}');

            print('_userImage: ${_userImage}');
            print('AddressLine1: ${_address1Controller.text}');
            print('AddressLine2: ${_address2Controller.text}');
            print('City: ${_cityController.text}');
            print('Zipcode: ${_pincodeController.text}');
            print('State: ${_stateController.text}');
            print('Country: ${_postalareaController.text}');
          });

          print('TransactionPassword: ${firstUser["TransactionPassword"]}');
          print('------------------');
        } catch (error) {
          Fluttertoast.showToast(msg: "Login Failed");
          log(error.toString());
        }
      });
    } catch (e) {
      print("Error: $e");
      Fluttertoast.showToast(msg: "An error occurred");
    }
  }*/

  Future _showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            titlePadding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFF007E01),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                  "Add Photo",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 100.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: GestureDetector(
                      child: Center(
                          child: Text("Gallery",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17))),
                      onTap: () {
                        //_openGallery();
                        Navigator.of(context).pop(); // Close the dialog
                      },
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Divider(color: Colors.grey, thickness: 1),
                  SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    child: Center(
                        child: Text("Take Photo",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17))),
                    onTap: () {
                      // _openCamera();
                      Navigator.of(context).pop(); // Close the dialog
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 15.0, bottom: 10.0),
                      decoration: BoxDecoration(
                        color: Color(0xFF007E01),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<String> imageToBase64(String imagePath) async {
    File imageFile = File(imagePath);

    List<int> imageBytes = await imageFile.readAsBytes();

    String base64Image = base64Encode(imageBytes);

    return base64Image;
  }

  /* Future<void> _uploadImageAndRegister() async {
    memberId = await Prefs.getStringValue(Prefs.PREFS_USER_ID);
    UserName = await Prefs.getStringValue(Prefs.PREFS_USER_NAME);
    Name = await Prefs.getStringValue(Prefs.PREFS_NAME);
    String imagePath = '../Images/Customers/1000012.jpg';
    String base64Image = await imageToBase64(imagePath);

    print(base64Image);
    try {
      log("memberIggghtd" + UserName!);
      FirstName = _firstNameController.text.toString();
      LastName = _lastnameController.text.toString();
      Email = _emailController.text.toString();
      mobile = _mobileController.text.toString();
      address1 = _address1Controller.text.toString();
      address2 = _address2Controller.text.toString();
      city = _cityController.text.toString();
      state = _stateController.text.toString();
      pincode = _pincodeController.text.toString();
      postal = _postalareaController.text.toString();

      __futureLogin = ResponseHandler.performPost(
          "MemberSave",
          'CustomerID=$memberId &FirstName=$FirstName&LastName=$LastName&DateofBirth=&Gender=1&Marital=1&address1=$address1'
              '&address2=$address2&city=$city&state=$state&zip=$pincode&country=India&Phone=$mobile&Email=$Email&Nominee=&Relation=&NomineeaAge=25&KeyValue=');
      */ /*   __futureLogin = ResponseHandler.performPost(
          "JoinnowSave",
          'CustomerID=0&PlacementID=1000000&FirstName=Pramya&LastName=A&DateofBirth=12/12/1990&Gender=1&Marital=1&AddressLine1=Colachel'
              '&AddressLine2=Ritapuram&city=Nagercoil&state=TN&Zipcode=629789&PostalArea=629159&Country="India"&Phone=8675784378&Email=aa@gmail.com'
              '&Username=CS1000000&Password=123456&TransactionPassword=123456&SponsorID=1000000&RankName=&AccountName='
              '&AccountNumber=&BankName=&Branch=&BankCode=&AccountType=&Relation=&status=1&NomineeaAge=25&Expiry=&KeyValue=/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAA0JCgsKCA0LCgsODg0PEyAVExISEyccHhcgLikxMC4pLSwzOko+MzZGNywtQFdBRkxOUlNSMj5aYVpQYEpRUk//2wBDAQ4ODhMREyYVFSZPNS01T09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0//wAARCAAGAAoDASIAAhEBAxEB/8QAFQABAQAAAAAAAAAAAAAAAAAAAAX/xAAfEAACAgEEAwAAAAAAAAAAAAABAgMEAAUREmEhIjH/xAAVAQEBAAAAAAAAAAAAAAAAAAACA//EABcRAQEBAQAAAAAAAAAAAAAAAAEAAhH/2gAMAwEAAhEDEQA/AJVPVF1B5Evh3ZQpQr87385EsS0xYlCwSAczt794xgKml7f/2Q==');*/ /*
      print('CustomerID=0');
      print('PlacementID=$memberId');
      print('FirstName=$FirstName');
      print('LastName=$LastName');
      print('Gender=1');
      print('Marital=1');
      print('address1=$address1');
      print('address2=$address2');
      print('city=$city');
      print('state=$state');
      print('Zipcode=$pincode');
      print('PostalArea=$postal');
      print('Country=India');
      print('Phone=$mobile');
      print('Email=$Email');
      print('Username=CS10000000');
      print('SponsorID=1000000');
      print('RankName=');
      print('AccountName=');
      print('AccountNumber=');
      print('BankName=');
      print('Branch=');
      print('BankCode=');
      print('AccountType=');
      print('Relation=');
      print('status=1');
      print('NomineeaAge=25');
      print('Expiry=');
      __futureLogin?.then((value) {
        print('Response body: ${value.body}');

        String jsonResponse = ResponseHandler.parseData(value.body);

        print('JSON Response: ${jsonResponse}');

        if (jsonResponse == "1") {
          Fluttertoast.showToast(msg: 'Joined successfully');
          //saveImageToPrefs();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Dashboard(
                    data: memberId,
                    data1: UserName,
                  )));
        } else if (jsonResponse == "Not Allowed") {
          Fluttertoast.showToast(msg: 'Unable to join');
        }
        */ /* try {
          //Map<String, dynamic> map = json.decode(jsonResponse);
          List<dynamic> decodedJson = json.decode(jsonResponse);
          print('decodedJson: ${decodedJson}');
        } catch (error) {
          Fluttertoast.showToast(msg: "Login Failed");
          log(error.toString());
        }*/ /*
      });
    } catch (e) {
      print("Error: $e");
      Fluttertoast.showToast(msg: "An error occurred");
    }

    Future<void> _saveImageAndGetKeyValue() async {
      if (_imageFile == null) {
        return; // No image selected
      }

      final bytes = await _imageFile!.readAsBytes();
      final imageEncoded = base64Encode(bytes);

      final String USER_AGENT = "Mozilla/5.0";

      try {
        final url =
        Uri.parse("https://lapay.app/webserviceimages.asmx/SaveImage");
        final response = await http.post(
          url,
          headers: {"User-Agent": USER_AGENT},
          body: {"KeyId": imageEncoded},
        );

        if (response.statusCode == 200) {
          // Successfully received the response
          final jsonData = json.decode(response.body) as Map<String, dynamic>;
          final keyValue = jsonData["keyId"] as int;
          setState(() {
            // _keyValue = keyValue.toString();
          });
        } else {
          // Handle error response
        }
      } catch (e) {
        // Handle exceptions
      }
    }
  }*/

  Future<void> _loadImage() async {
    final imagePath = await loadImageFromPrefs();
    print('imagefile$imagePath');
    setState(() {
      if (imagePath != null) {
        _userImage = (imagePath);
        print('imagepatg:$_userImage');
      }
    });
  }

  Future<String?> loadImageFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_image');
  }

  /* Future<String?> LoadFirstName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('firstName').toString();
  }

  Future<String?> LoadLastName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('lastName').toString();
  }

  Future<String?> LoadEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email').toString();
  }

  Future<String?> LoadMobile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('mobile').toString();
  }

  Future<String?> LoadAddress1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('address1').toString();
  }

  Future<String?> LoadAddress2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('address2').toString();
  }

  Future<String?> LoadCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('city').toString();
  }

  Future<String?> LoadState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('state').toString();
  }

  Future<String?> LoadPin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('pincode').toString();
  }

  Future<String?> LoadPostal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('postal').toString();
  }*/

  /* Future<void> _openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      final encodedImage = base64Encode(imageBytes);

      setState(() {
        _userImage = encodedImage;
        print('baseeeeeeb4:$_userImage');
      });
    }
  }*/

  @override
  void initState() {
    super.initState();
    //_loadImage();
    // _loadmemberid();
    //_loadImage();
  }

// Function to open the gallery and select an image
  /* Future<void> _openGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      final encodedImage = base64Encode(imageBytes);

      setState(() {
        _userImage = encodedImage;
        print('baseeeeeeb4:$_userImage');
      });
    }
  }*/

  final _formKey = GlobalKey<FormState>();
  String _selectedOption = 'Self';
  bool _obscureText = true;

  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    // Create a MemoryImage from the decoded bytes
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1d5e72),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            ' Manage Staff',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0, bottom: 10),
            child: Image.asset(
              'assets/images/loginoho.jpg', // Replace 'your_image.png' with your image asset path
              width: 70,
              height: 50,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        /*   child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(top: 20)),
            Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                  width: 130,
                  height: 100,
                  */ /*  child: base64Image != null
                      ? CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    backgroundImage: MemoryImage(
                      base64Decode(base64Image!),
                    ),
                  )*/ /*
                  child: Image.asset(
                      'assets/images/profile.png'), // Display nothing if base64Image is null
                ),
                IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.grey, // Set the icon color to dark grey
                  ),
                  onPressed: () {
                    _showSelectionDialog(context);
                  },
                  color: Color(
                      0xFFD3D3D3), // Set the background color to light grey
                )
              ],
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Nick Name0'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 45,
                      width: 310,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                          hintText: 'Referral ID',
                          prefixIcon: Image.asset(
                            "assets/images/id_icon.png",
                            alignment: Alignment.center,
                            cacheHeight: 21,
                            cacheWidth: 20,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 16.0),
            SizedBox(
              height: 80,
              width: 310,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(
                    5.0,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 10),
                      child: const Text(
                        'Status',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 'Active',
                              groupValue: selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  selectedOption = value as String;
                                });
                              },
                            ),
                            Text('Active'),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 'InActive',
                              groupValue: selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  selectedOption = value as String;
                                });
                              },
                            ),
                            Text('InActive'),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Visibility(
              visible: selectedOption ==
                  'Franchise', // Show the field when 'Franchise' is selected
              maintainState: true,
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 45, // Set the desired height
                  width: 310, // Set the desired width
                  child: TextField(
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: InputDecoration(
                      hintText: 'Location',
                      prefixIcon: Image.asset(
                        "assets/images/locationjpg.jpg",
                        alignment: Alignment.center,
                        cacheHeight: 21,
                        cacheWidth: 20,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 45,
                      width: 310,
                      child: TextField(
                        controller: _firstNameController,
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                          hintText: 'First Name',
                          prefixIcon: Image.asset(
                            "assets/images/name_icon.png",
                            alignment: Alignment.center,
                            cacheHeight: 21,
                            cacheWidth: 20,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 45,
                      width: 310,
                      child: TextField(
                        controller: _lastnameController,
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                          hintText: 'Last Name',
                          prefixIcon: Image.asset(
                            "assets/images/name_icon.png",
                            alignment: Alignment.center,
                            cacheHeight: 21,
                            cacheWidth: 20,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 16.0),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 25.0),
                    Container(
                      width: 100,
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 40, // Adjust the width as needed
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: 'MM',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0), // Add some space between fields
                    Container(
                      height: 45,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 40, // Adjust the width as needed
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: 'DD',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0), // Add some space between fields
                  ],
                )
              ],
            ),
            SizedBox(height: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 45,
                      width: 310,
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Image.asset(
                            "assets/images/emailpngresized.png",
                            alignment: Alignment.center,
                            cacheHeight: 21,
                            cacheWidth: 20,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 45,
                      width: 310,
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        controller: _mobileController,
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                          hintText: 'Mobile',
                          prefixIcon: Image.asset(
                            "assets/images/mobile_icon.png",
                            alignment: Alignment.center,
                            cacheHeight: 21,
                            cacheWidth: 20,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 45,
                      width: 310,
                      child: TextField(
                        controller: _address1Controller,
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                          hintText: 'Address Line 1',
                          prefixIcon: Image.asset(
                            "assets/images/address_icon.png",
                            alignment: Alignment.center,
                            cacheHeight: 21,
                            cacheWidth: 20,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 45,
                      width: 310,
                      child: TextField(
                        controller: _address2Controller,
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                          hintText: 'Address Line 2',
                          prefixIcon: Image.asset(
                            "assets/images/address_icon.png",
                            alignment: Alignment.center,
                            cacheHeight: 21,
                            cacheWidth: 20,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 45,
                      width: 310,
                      child: TextField(
                        controller: _cityController,
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                          hintText: 'City',
                          prefixIcon: Image.asset(
                            "assets/images/city_icon.png",
                            alignment: Alignment.center,
                            cacheHeight: 21,
                            cacheWidth: 20,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 45,
                      width: 310,
                      child: TextField(
                        controller: _stateController,
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                          hintText: 'State',
                          prefixIcon: Image.asset(
                            "assets/images/state_icon.png",
                            alignment: Alignment.center,
                            cacheHeight: 21,
                            cacheWidth: 20,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 45,
                      width: 310,
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        controller: _pincodeController,
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                          hintText: 'Pin Code',
                          prefixIcon: Image.asset(
                            "assets/images/zipcode_icon.webp",
                            alignment: Alignment.center,
                            cacheHeight: 21,
                            cacheWidth: 20,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 45,
                      width: 310,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                          hintText: 'Postal Area',
                          prefixIcon: Image.asset(
                            "assets/images/locationjpg.jpg",
                            alignment: Alignment.center,
                            cacheHeight: 21,
                            cacheWidth: 20,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Login Information',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 45,
                      width: 310,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Image.asset(
                            "assets/images/password_icon.png",
                            alignment: Alignment.center,
                            cacheHeight: 21,
                            cacheWidth: 20,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 45,
                      width: 310,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          prefixIcon: Image.asset(
                            "assets/images/password_icon.png",
                            alignment: Alignment.center,
                            cacheHeight: 21,
                            cacheWidth: 20,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 45,
                      width: 310,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                          hintText: 'Transaction Password',
                          prefixIcon: Image.asset(
                            "assets/images/password_icon.png",
                            alignment: Alignment.center,
                            cacheHeight: 21,
                            cacheWidth: 20,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 45,
                      width: 310,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                          hintText: 'Confirm Transaction Password',
                          prefixIcon: Image.asset(
                            "assets/images/password_icon.png",
                            alignment: Alignment.center,
                            cacheHeight: 21,
                            cacheWidth: 20,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                ),
                Text('Accept Terms and Conditions'),
              ],
            ),
            SizedBox(
              width: 320,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF007E01), // Set the background color here
                ),
                onPressed: () {},
                child: Text(
                  'CREATE ACCOUNT',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
            ),
            SizedBox(height: 25.0),
          ],
        ),*/
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 50,
                  child: Stack(
                      alignment: Alignment.bottomRight,
                      children: <Widget>[
                        SizedBox(height: 20),
                        Container(
                          width: 130,
                          height: 100,

                          child: Image.asset(
                              'assets/images/profile.png'), // Display nothing if base64Image is null
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.camera_alt,
                            color:
                                Colors.black, // Set the icon color to dark grey
                          ),
                          onPressed: () {
                            _showSelectionDialog(context);
                          },
                          color: Color(
                              0xFFD3D3D3), // Set the background color to light grey
                        )
                      ])),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'PERSONAL DETAILS',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Nick Name',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 45,
              width: 320,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.edit, color: Colors.black54, size: 20),
                  hintText: 'Enter Nick Name',
                  contentPadding: EdgeInsets.only(top: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Pin Code',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 45,
              width: 320,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.edit, color: Colors.black54, size: 20),
                  hintText: 'Enter PinCode',
                  contentPadding: EdgeInsets.only(top: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Status',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 45,
              width: 320,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.grey,
                  )),
              child: Row(
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 'Active',
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value as String;
                          });
                        },
                      ),
                      Text('Active'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 'InActive',
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value as String;
                          });
                        },
                      ),
                      Text('InActive'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Customer Type',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 45,
              width: 320,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButton<String>(
                isExpanded: true, // Set this property to true
                underline: Container(),
                items: ['Option 1', 'Option 2', 'Option 3']
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (String? value) {
                  // Handle dropdown change
                },
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Staff Name',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 45,
              width: 320,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.edit, color: Colors.black54, size: 20),
                  hintText: 'Enter StaffName',
                  contentPadding: EdgeInsets.only(top: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Address',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 45,
              width: 320,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.edit, color: Colors.black54, size: 20),
                  hintText: 'Enter Address',
                  contentPadding: EdgeInsets.only(top: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Country',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 45,
              width: 320,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButton<String>(
                isExpanded: true, // Set this property to true
                underline: Container(),
                items: ['Option 1', 'Option 2', 'Option 3']
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (String? value) {
                  // Handle dropdown change
                },
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Customer Name',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 45,
              width: 320,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButton<String>(
                isExpanded: true, // Set this property to true
                underline: Container(),
                items: ['Option 1', 'Option 2', 'Option 3']
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (String? value) {
                  // Handle dropdown change
                },
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Staff Code',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 45,
              width: 320,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.edit, color: Colors.black54, size: 20),
                  hintText: 'Enter Staff Code',
                  contentPadding: EdgeInsets.only(top: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'City',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 45,
              width: 320,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.edit, color: Colors.black54, size: 20),
                  hintText: 'Enter City',
                  contentPadding: EdgeInsets.only(top: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Joined Date',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 45,
              width: 320,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.edit, color: Colors.black54, size: 20),
                  hintText: 'Enter Joined date',
                  contentPadding: EdgeInsets.only(top: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'CONTACT DETAILS',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Phone No 1 ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 45,
              width: 320,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.edit, color: Colors.black54, size: 20),
                  hintText: 'Enter phone Number 1',
                  contentPadding: EdgeInsets.only(top: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Phone No 2 ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 45,
              width: 320,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.edit, color: Colors.black54, size: 20),
                  hintText: 'Enter phone Number 2',
                  contentPadding: EdgeInsets.only(top: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'EMail ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 45,
              width: 320,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.edit, color: Colors.black54, size: 20),
                  hintText: 'Enter Email',
                  contentPadding: EdgeInsets.only(top: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Enquiry Type',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 45,
              width: 320,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButton<String>(
                isExpanded: true, // Set this property to true
                underline: Container(),
                items: ['Option 1', 'Option 2', 'Option 3']
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (String? value) {
                  // Handle dropdown change
                },
              ),
            ),
            SizedBox(height: 25),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'USER CREDENTIALS',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Login Name',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 45,
              width: 320,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.edit, color: Colors.black54, size: 20),
                  hintText: 'Enter LoginName',
                  contentPadding: EdgeInsets.only(top: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Password',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 45,
              width: 320,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.edit, color: Colors.black54, size: 20),
                  hintText: 'Enter Password',
                  contentPadding: EdgeInsets.only(top: 5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    /*  Navigator.push(
                                    context,
                                    MaterialPageRoute(0000
                                        builder: (BuildContext context) =>
                                            ReferandEarn()));*/
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.yellow, // Button color
                    onPrimary: Colors.black, // Text color
                  ),
                  child: SizedBox(
                      width: 130,
                      height: 45,
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      )),
                ),
                SizedBox(
                  width: 4,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Button color
                    onPrimary: Colors.white, // Text color
                  ),
                  child: SizedBox(
                      width: 130,
                      height: 45,
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      )),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

void _pickImageFromCamera() async {
  // Add camera image picking logic here
  // For example, you can use the camera package to open the camera and pick an image
  // Then, open the camera and take a picture or record a video
  // After capturing the image, you can display it in the CircleAvatar
}

void main() {
  runApp(MaterialApp(
    home: AddNewStaff(),
  ));
}
