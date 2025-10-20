import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'all.dart';
import 'package:delivery_ui/rider/rider_home.dart';



// ส่วนที่เกี่ยวกับ Firebase ถูกลบออกไป:
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// --- สร้างหน้าจำลองขึ้นมาเพื่อทดสอบการทำงาน ---

// ---------------------------------------------

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // เปลี่ยนชื่อ Controller ให้สื่อความหมายมากขึ้น
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordObscured = true;
  bool _isLoading = false;

  Future<void> _signIn() async {
    // if (_loginController.text.isEmpty || _passwordController.text.isEmpty) {
    //   _showErrorDialog('กรุณากรอกข้อมูลให้ครบถ้วน');
    //  return;
    // }

    setState(() {
      _isLoading = true;
    });

    try {
     
      // ตัวอย่าง: การจำลองการหน่วงเวลาเพื่อแสดงสถานะกำลังโหลด
      await Future.delayed(const Duration(seconds: 2));

      final loginInput = _loginController.text.trim();
      
      // ตัวอย่างการจำลองการตรวจสอบเงื่อนไขการเข้าสู่ระบบ:
      // หากผู้ใช้ป้อน 'rider' และรหัสผ่าน '123' ให้เข้าสู่หน้า Rider
      // หากผู้ใช้ป้อน 'customer' และรหัสผ่าน '123' ให้เข้าสู่หน้า Customer
      if (loginInput == 'rider' && _passwordController.text.trim() == '123') {
           Navigator.pushReplacement(
             context,
             MaterialPageRoute(builder: (context) => const DeliveryHomePage()),
           );
      } else if (loginInput == 'customer' && _passwordController.text.trim() == '123') {
           Navigator.pushReplacement(
             context,
             MaterialPageRoute(builder: (context) => const HomeScreen()),
           );
      } else {
        // จำลองข้อผิดพลาดหากไม่ตรงเงื่อนไข
        throw Exception('MockAuthException: เบอร์โทรศัพท์/อีเมล หรือรหัสผ่านไม่ถูกต้อง');
      }

    } catch (e) {
      // จับข้อผิดพลาดที่ถูกจำลอง
      String message;
      if (e.toString().contains('MockAuthException')) {
        message = 'เบอร์โทรศัพท์/อีเมล หรือรหัสผ่านไม่ถูกต้อง';
      } else {
        message = 'เกิดข้อผิดพลาดในการเข้าสู่ระบบ: ${e.toString()}';
      }
      _showErrorDialog(message);
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('เกิดข้อผิดพลาด', style: GoogleFonts.prompt()),
        content: Text(message, style: GoogleFonts.prompt()),
        actions: <Widget>[
          TextButton(
            child: Text('ตกลง', style: GoogleFonts.prompt()),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green, Color.fromARGB(255, 27, 155, 120)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Text(
                'TRACK-SURE',
                textAlign: TextAlign.center,
                style: GoogleFonts.alumniSansInlineOne(
                  fontSize: 65,
                  color: Colors.white,
                  letterSpacing: 3,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'เข้าสู่ระบบ',
                        style: GoogleFonts.prompt(
                          fontSize: 42,
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 40),
                      TextField(
                        controller: _loginController,
                        style: GoogleFonts.prompt(),
                        keyboardType: TextInputType.text, // รับได้ทั้งตัวหนังสือและตัวเลข
                        decoration: InputDecoration(
                          labelText: 'เบอร์โทรศัพท์/อีเมล', // แก้ label
                          labelStyle: GoogleFonts.prompt(color: Colors.green[800]),
                          prefixIcon: Icon(Icons.person, color: Colors.green[800]),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.green, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _passwordController,
                        obscureText: _isPasswordObscured,
                        style: GoogleFonts.prompt(),
                        decoration: InputDecoration(
                          labelText: 'รหัสผ่าน',
                          labelStyle: GoogleFonts.prompt(color: Colors.green[800]),
                          prefixIcon: Icon(Icons.lock, color: Colors.green[800]),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordObscured
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordObscured = !_isPasswordObscured;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.green, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // เพิ่ม Logic สำหรับลืมรหัสผ่าน
                          },
                          child: Text(
                            'ลืมรหัสผ่าน?',
                            style: GoogleFonts.prompt(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _isLoading ? null : _signIn,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          textStyle: GoogleFonts.prompt(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text('เข้าสู่ระบบ'),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ถ้าคุณยังไม่ได้เป็นสมาชิก?',
                            style: GoogleFonts.prompt(),
                          ),
                          TextButton(
                            onPressed: () {
                              //Navigator.push(
                                //context,
                                //MaterialPageRoute(
                                 // builder: (context) => const RegistrationPage(),
                                //),
                              //);
                            },
                            child: Text(
                              'สมัครสมาชิก',
                              style: GoogleFonts.prompt(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}