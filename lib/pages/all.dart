import 'package:flutter/material.dart';
import 'top_bar.dart';
import 'bottom_bar.dart';
import 'products.dart';
import 'EditPro.dart'; 
import 'pre_order.dart'; // **สำคัญ: เพิ่ม Import สำหรับหน้า pre_order**
import 'Product_status.dart';

// เปลี่ยนจาก StatelessWidget เป็น StatefulWidget
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // สถานะสำหรับเก็บ Index ของ BottomBar
  
  // ฟังก์ชันสำหรับจัดการการแตะที่ BottomNavigationBar
  void _onItemTapped(int index) {
    if (index == 1) { // Index 1: 'ประวัติการส่งสินค้า' (Products)
      // ใช้ Navigator.push เพื่อนำทางไปยังหน้า Products
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Products()), 
      );
      // เมื่อกลับมาที่หน้า Home เราให้ปุ่ม 'หน้าแรก' ถูกเลือกอยู่ (Index 0)
      setState(() {
        _currentIndex = 0; 
      });
    } else if (index == 2) { // Index 2: 'อื่นๆ' (EditPro)
      // ใช้ Navigator.push เพื่อนำทางไปยังหน้า EditPro
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const EditPro()), 
      );
      // เมื่อไปหน้า EditPro เราให้ปุ่ม 'หน้าแรก' ถูกเลือกอยู่ (Index 0)
      setState(() {
        _currentIndex = 0; 
      });
    } else {
      // Index 0: 'หน้าแรก' (อยู่บนหน้านี้แล้ว)
      setState(() {
        _currentIndex = index;
      });
    }
  }

  // ฟังก์ชันสำหรับสร้างปุ่มเมนูแต่ละอัน (รูปข้างๆข้อความ)
  Widget _buildWideMenuButton(String imagePath, String label) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // ปรับสีให้ดูดีขึ้น
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 50), // ใช้รูปไอคอนของคุณ
          const SizedBox(width: 8), // ระยะห่างระหว่างรูปและข้อความ
          Flexible( // ห่อข้อความด้วย Flexible เพื่อป้องกัน Text Overflow ในพื้นที่จำกัด
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis, // ป้องกันข้อความล้น
            ),
          ),
        ],
      ),
    );
  }

  // ฟังก์ชันสร้างปุ่มสี่เหลี่ยม
  Widget _buildSquareMenuButton(String imagePath, String label) {
    return Container(
      height: 100, // กำหนด height ยังคงได้ เพื่อควบคุมความสูงให้เท่ากัน
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white, // ปรับสีให้ดูดีขึ้น
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 40), // ใช้รูปไอคอนของคุณ
          const SizedBox(height: 8),
          Flexible( // ห่อข้อความด้วย Flexible เพื่อป้องกัน Text Overflow
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
              overflow: TextOverflow.ellipsis, // ป้องกันข้อความล้น
              maxLines: 2, // กำหนดจำนวนบรรทัดสูงสุด
            ),
          ),
        ],
      ),
    );
  }
  
  // โค้ด _buildPromoItem, _buildPromoItem2, _buildPromoItem3 

  Widget _buildPromoItem(String text) {
    return Expanded( // ใช้ Expanded เพื่อให้จัดวางใน Row ได้ดีขึ้น
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: const Color(0xFFE6F6F2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            const Icon(Icons.local_shipping, color: Color(0xFF07AA7C), size: 30),
            const SizedBox(height: 4),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildPromoItem2(String text) {
      return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: const Color(0xFFE6F6F2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            const Icon(Icons.motorcycle, color: Color(0xFF07AA7C), size: 30),
            const SizedBox(height: 4),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildPromoItem3(String text) {
      return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: const Color(0xFFE6F6F2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            const Icon(Icons.archive, color: Color(0xFF07AA7C), size: 30),
            const SizedBox(height: 4),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ส่วนที่ 1: บาร์ด้านบน
            const TopBar(),

            // ส่วนที่ 2: เมนูหลัก (ใช้ GestureDetector เพื่อให้ปุ่มที่กำหนดมีฟังก์ชันการคลิก ถ้าต้องการ)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // แถวบน (ปุ่มยาว 2 ปุ่ม)
                  Row(
                    children: [
                      // ห่อด้วย Expanded และ GestureDetector
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // **<<------ ส่วนที่แก้ไข: นำทางไปหน้า PreOrderScreen ------>>**
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ShippingOrderScreen()), // สมมติชื่อคลาสคือ PreOrderScreen
                            );
                            print('สั่งสินค้า clicked: Navigating to PreOrder'); 
                          },
                          child: _buildWideMenuButton(
                            'assets/image/order.png',
                            'สั่งสินค้า',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10), // ระยะห่างระหว่างปุ่ม
                      Expanded(
                        child: GestureDetector(
                          onTap: () {

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder:(context) => const OrderTrackingScreen()),
                            );
                            // โค้ดสำหรับปุ่ม 'สถานะพัสดุ'
                            print('สถานะพัสดุ clicked');
                          },
                          child: _buildWideMenuButton(
                            'assets/image/order2.png',
                            'สถานะพัสดุ',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10), // ระยะห่างระหว่างแถว
                  // แถวล่าง (ปุ่มสั้น 3 ปุ่ม)
                  Row(
                    children: [
                      // ห่อด้วย Expanded และ GestureDetector
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            print('พัสดุที่ต้องรับ clicked');
                          },
                          child: _buildSquareMenuButton(
                            'assets/image/order3.png',
                            'พัสดุที่ต้องรับ',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            print('คุยกับไรเดอร์ clicked');
                          },
                          child: _buildSquareMenuButton(
                            'assets/image/order4.png',
                            'คุยกับไรเดดอร์',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            print('ส่วนลดแพ็กเกจ clicked');
                          },
                          child: _buildSquareMenuButton(
                            'assets/image/order5.png',
                            'ส่วนลดแพ็กเกจ',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ส่วนที่ 3: แบนเนอร์โปรโมชัน (โค้ดเดิม)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Center the entire column
                  children: [
                    const Text(
                      'โปรส่งของ',
                      textAlign: TextAlign.center, // Center the header text
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 224, 167, 91),
                      ),
                    ),

                    const SizedBox(height: 8),
                    const Text(
                      'คุ้มสุดๆ',
                      textAlign: TextAlign.center, // Center the header text
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 202, 122, 16),
                      ),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      textAlign:
                          TextAlign.center, // Center the RichText content
                      text: const TextSpan(
                        style: TextStyle(
                          fontFamily: 'Kanit',
                          fontSize: 22,
                          color: Color(0xFF07AA7C),
                        ),
                        children: [
                          TextSpan(
                            text: 'ส่งฟรี ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: '50 บาท',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'เมื่อส่งภายในระยะทางที่กำหนด',
                      textAlign: TextAlign.center, // Center the header text
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87
                      ),
                    ),
                    const SizedBox(height: 20),
                    // ส่วนไอคอนย่อย 3 อันด้านล่าง
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildPromoItem('ส่งฟรี!'),
                        _buildPromoItem2('โปรคุ้มค่า!'),
                        _buildPromoItem3('ถึงหน้าบ้านคุณ!'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20), // เพิ่มระยะห่างด้านล่าง
          ],
        ),
      ),
      // ส่วนที่ 4: บาร์ด้านล่าง
      bottomNavigationBar: BottomBar(
        // ** ส่ง Index และฟังก์ชันจัดการการแตะไปให้ BottomBar **
        currentIndex: _currentIndex, 
        onItemSelected: _onItemTapped, 
      ),
    );
  }
}