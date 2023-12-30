import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'mainDriver.dart';

// Driver model
class Driver {
  final int id;
  final String fullName;
  final String phoneNo;
  final String password;
  final String photoPath;

  Driver({required this.id, required this.fullName, required this.phoneNo, required this.password, required this.photoPath});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'phoneNo': phoneNo,
      'password': password,
      'photoPath': photoPath,
    };
  }

  static Driver fromMap(Map<String, dynamic> map) {
    return Driver(
      id: map['id'],
      fullName: map['fullName'],
      phoneNo: map['phoneNo'],
      password: map['password'],
      photoPath: map['photoPath'],
    );
  }
}

// Database helper
class DatabaseHelper {
  static Future<Database> getDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'driver_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE drivers(id INTEGER PRIMARY KEY, fullName TEXT, phoneNo TEXT, password TEXT, photoPath TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertDriver(Driver driver) async {
    final db = await getDatabase();
    await db.insert(
      'drivers',
      driver.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> initializeDatabaseWithDummyData() async {
    final db = await getDatabase();
    List<Driver> drivers = [
      Driver(id: 1000, fullName: 'Mohd Harris bin Mohd Ali', phoneNo: '+603-9769 1334', password: 'harris1000', photoPath: 'driver-1000.png'),
      Driver(id: 1010, fullName: 'Ayub bin Somudi', phoneNo: '+603-9769 1334', password: 'ayub1010', photoPath: 'driver-1010.png'),
      // ... Add all other drivers in a similar fashion
      Driver(id: 1060, fullName: 'Mohd Norafrizan bin Mohd Normazi', phoneNo: '+603-9769 1334', password: 'afrizan1060', photoPath: 'driver-1060.png'),
    ];

    for (var driver in drivers) {
      await insertDriver(driver);
    }
  }
}

// DriverLoginPage widget
class DriverLoginPage extends StatefulWidget {
  String mainStatus;

  DriverLoginPage({required this.mainStatus});

  @override
  _DriverLoginPageState createState() => _DriverLoginPageState();
}

class _DriverLoginPageState extends State<DriverLoginPage> {
  final TextEditingController driverIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isButtonEnabled = false;
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    driverIdController.addListener(updateButtonState);
    passwordController.addListener(updateButtonState);
    DatabaseHelper.initializeDatabaseWithDummyData();
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
                  SizedBox(height: 10), // Added missing SizedBox
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
            SizedBox(height: 30),
            Container(
              width: double.infinity, // Makes the button expand to the full width
              height: 50,
              child: ElevatedButton(
                onPressed: isButtonEnabled ? () {
                  // TODO: Implement your login logic here
                  print('Continue button pressed');
                } : null,
                style: ElevatedButton.styleFrom(
                  primary: isButtonEnabled ? Color(0xFF00D161) : Colors.grey, // Button color
                  onPrimary: Colors.white, // Text color
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
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
          obscureText: isPassword ? !isPasswordVisible : false,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: label,
            hintStyle: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 17,
              color: Color.fromRGBO(165, 165, 165, 1),
            ),
            suffixIcon: isPassword ? IconButton(
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
            ) : null,
          ),
        ),
      ),
    );
  }
}
