import 'package:flutter/material.dart';
import 'mainDriver.dart';

class DriverLoginPage extends StatefulWidget {
  String mainStatus;

  DriverLoginPage({
    required this.mainStatus
  });

  @override
  _DriverLoginPageState createState() => _DriverLoginPageState();
}

class _DriverLoginPageState extends State<DriverLoginPage> {
  final TextEditingController driverIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    // Add listeners to text controllers to update button state
    driverIdController.addListener(updateButtonState);
    passwordController.addListener(updateButtonState);
  }

  void updateButtonState() {
    final driverIdFilled = driverIdController.text.isNotEmpty;
    final passwordValid = passwordController.text.length >= 8;

    setState(() {
      isButtonEnabled = driverIdFilled && passwordValid;
    });
  }

  @override
  void dispose() {
    // Dispose of text controllers to avoid memory leaks
    driverIdController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0.0,
        centerTitle: false,
        title: Text(
          'Driver Login',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.left,
        ),
        backgroundColor: Color(0xFF00D161),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Driver Login",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 0),
                  Text(
                    "Welcome Back Captain!",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF00D161),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            _buildTextField("Driver ID", controller: driverIdController),
            SizedBox(height: 15),
            _buildTextField("Password", isPassword: true, controller: passwordController),
            SizedBox(height: 15),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have trouble logging in? ',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Ink(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFF00D161),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Text(
                      'Contact BHEP',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF00D161),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: 334,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isButtonEnabled ? Color(0xFF00D161) : Color(0xFF00D161).withOpacity(0.5),
              ),
              child: TextButton(
                onPressed: isButtonEnabled
                    ? () {
                  // Handle login button press
                  widget.mainStatus = 'driver';
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyHomePageDriver(
                          initialIndex: 1,
                          mainStatus: widget.mainStatus
                      ),
                    ),
                  );
                }
                    : null,
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {bool isPassword = false, TextEditingController? controller}) {
    return Container(
      width: 334,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(
          color: Color.fromRGBO(165, 165, 165, 1),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: label,
            hintStyle: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              color: Color.fromRGBO(165, 165, 165, 1),
            ),
          ),
        ),
      ),
    );
  }
}
