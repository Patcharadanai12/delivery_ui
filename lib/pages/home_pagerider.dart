import 'package:flutter/material.dart';
import 'rider_bottom_bar.dart'; // Import the bottom bar widget
import 'rider_top.dart';      // Import the header widget


class RiderTop extends StatelessWidget {
  final String userName;
  const RiderTop({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    // This is a placeholder implementation matching the image's top bar visual
    return Container(
      padding: const EdgeInsets.only(top: 40, bottom: 20, left: 16, right: 16),
      decoration: const BoxDecoration(
        // Matching the gradient from the image
        gradient: LinearGradient(
          colors: [Color(0xFF00B09B), Color(0xFF96C93D)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: <Widget>[
          // Profile Image (using a placeholder asset or color)
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            // Assuming the image is a placeholder and should be handled by the user's setup
            // backgroundImage: AssetImage('assets/profile_pic.png'), 
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'สวัสดีคุณ $userName', // Using the passed userName
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
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
    );
  }
}

// NOTE: class RiderBottomBar has been removed as requested, 
// assuming its implementation is now only in rider_bottom_bar.dart.

// ---------------------------------------------------------------------

class DeliveryJobScreen extends StatelessWidget {
  const DeliveryJobScreen({super.key});

  // Dummy user name for RiderTop
  final String _userName = "สมศักดิ์"; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // 1. Top Section - Handled by the imported widget
          RiderTop(userName: _userName),

          // 2. Main Content Area (Scrollable)
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  // 'รายการสินค้าที่ต้องไปส่ง' Card/Button
                  _buildJobListingHeader(),
                  const SizedBox(height: 20),

                  // The main delivery job card
                  _buildDeliveryJobCard(),

                  // Add more job cards here if needed
                ],
              ),
            ),
          ),
        ],
      ),

      // 3. Bottom Navigation Bar - Handled by the imported widget
      // This assumes RiderBottomBar is a StatelessWidget that returns the BottomNavigationBar
      bottomNavigationBar: const StatusBottomBar(), 
    );
  }

  // Helper widget to build the 'รายการสินค้าที่ต้องไปส่ง' part
  Widget _buildJobListingHeader() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        // Padding adjusted to match the visual size in the image
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFE0E0E0)), // Subtle border
        ),
        child: const Text(
          'รายการสินค้าที่ต้องไปส่ง',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
      ),
    );
  }

  // Helper widget to build the main job detail card
  Widget _buildDeliveryJobCard() {
    // Define the colors used in the card
    const Color cardBorderColor = Color(0xFF2196F3); // Blue border
    const Color iconColor = Color(0xFF757575);
    const Color acceptButtonColor = Color(0xFF5CB85C); // Green button

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: cardBorderColor,
          width: 2.5,
        ),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Left side: Icons and the vertical line
          Column(
            children: <Widget>[
              // Pickup Icon (Briefcase/Package)
              const Icon(Icons.folder_open, color: iconColor, size: 30),
              // Vertical Line (The path)
              Container(
                width: 1.5,
                height: 40, // Height to separate the two locations
                color: iconColor,
              ),
              // Dropoff Icon (Location Pin)
              const Icon(Icons.location_on, color: Colors.red, size: 30),
            ],
          ),
          const SizedBox(width: 15),

          // Right side: Locations and Button
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Pickup Location
                const Text(
                  'คณะวิทยาการสารสนเทศ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 30), // Space adjustment

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
                      // Action to accept the job
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: acceptButtonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      elevation: 0, // No shadow needed
                    ),
                    child: const Text(
                      'รับงาน',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
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
    );
  }
}