import 'package:flutter/material.dart';
import 'rider_bottom_bar.dart'; // Assume this contains the bottom navigation bar
import 'rider_top.dart';      // Assume this contains the header/top part

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine the user's name (placeholder)
    const String userName = "สมชาย"; // Placeholder name

    // Define the gradient for the header background
    const LinearGradient headerGradient = LinearGradient(
      colors: [Color(0xFF00B09B), Color(0xFF96C93D)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    // Define the main color for the accept button
    const Color acceptButtonColor = Color(0xFF5CB85C); // Green color

    return Scaffold(
      // The top section (Header) is likely intended to be handled by rider_top.dart
      // but to match the image precisely, we will build the header directly in the Scaffold's body.
      // If rider_top.dart is meant to be a custom AppBar, you would use it there.
      // For this implementation, we use a custom structure inside the body.

      body: Column(
        children: <Widget>[
          // 1. Top Section (Header) - Matches the image's gradient and content
          Container(
            padding: const EdgeInsets.only(top: 40, bottom: 20, left: 16, right: 16),
            decoration: const BoxDecoration(
              gradient: headerGradient,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    // Profile Image
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/profile_placeholder.png'), // Replace with actual image asset
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(width: 15),
                    // Greeting and Name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'สวัสดีคุณ $userName',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Edit Profile Text
                        const Text(
                          'แก้ไขข้อมูลส่วนตัว',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 2. Main Content Area
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  // 'รายการสินค้าที่ต้องไปส่ง' Button/Card
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      child: const Text(
                        'รายการสินค้าที่ต้องไปส่ง',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Delivery/Job Card (The main blue-bordered item)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF2196F3), // Light Blue border
                        width: 2.5,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Left side (Icons and Line)
                        Column(
                          children: <Widget>[
                            // Icon for Pickup Location (Briefcase/Package)
                            const Icon(
                              Icons.folder_open, // Or a suitable package/briefcase icon
                              color: Color(0xFF757575),
                              size: 30,
                            ),
                            // Dotted line connecting pickup and dropoff
                            Container(
                              width: 1,
                              height: 40,
                              color: const Color(0xFF757575),
                            ),
                            // Icon for Dropoff Location (Location Pin)
                            const Icon(
                              Icons.location_on,
                              color: Colors.red, // Red for location
                              size: 30,
                            ),
                          ],
                        ),
                        const SizedBox(width: 15),

                        // Right side (Locations and Button)
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Pickup Location
                              const Text(
                                'คณะวิทยาการสารสนเทศ',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 35), // Space to align with the line

                              // Dropoff Location
                              const Text(
                                'หอพักเมธาพาลาโซ่ ตึก3',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 10),

                              // 'รับงาน' (Accept Job) Button
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Handle job acceptance logic
                                    print('Job accepted!');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: acceptButtonColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                  ),
                                  child: const Text(
                                    'รับงาน',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Add more space or content here if needed
                ],
              ),
            ),
          ),
        ],
      ),

      // 3. Bottom Navigation Bar
      bottomNavigationBar: const RiderBottomBar(), // Uses the provided widget
    );
  }
}

// Placeholder RiderBottomBar and RiderTop for the code to run without error
// Replace these with the actual content of your files if they are available
class RiderBottomBar extends StatelessWidget {
  const RiderBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    // This is a placeholder implementation matching the image's bottom bar
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF00B09B), // Main green/teal color
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'หน้าแรก',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'ประวัติการส่งสินค้า',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz),
          label: 'อื่นๆ',
        ),
      ],
      currentIndex: 0, // Set the current index to 'หน้าแรก'
      onTap: (index) {
        // Handle navigation taps
      },
    );
  }
}

// Since the header content is complex, I implemented it directly in DeliveryScreen.
// If you want to use RiderTop, you'll need to adjust its definition.
// For now, this placeholder is enough to run the code.
class RiderTop extends StatelessWidget {
  const RiderTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(); // Placeholder
  }
}

// To run this code, you'll need to define a main function and a MaterialApp:
/*
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const DeliveryScreen(),
    );
  }
}
*/