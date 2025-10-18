import 'package:flutter/material.dart';


// ----------------------------------------------------
// BottomBar: Navigation Bar (พร้อม Gradient Background)
// ----------------------------------------------------
class BottomBar extends StatelessWidget {
  // เพิ่มพารามิเตอร์ใหม่
  final int currentIndex;
  final Function(int)? onItemSelected;

  const BottomBar({
    super.key,
    required this.currentIndex, // ต้องรับค่า index ปัจจุบันเข้ามาด้วย
    this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // ใช้ Gradient ตามที่กำหนด
        gradient: LinearGradient(
          colors: [Color(0xFF07AA7C), Color(0xFF11598D)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าแรก', // Index 0
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'ประวัติการส่งสินค้า', // Index 1
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'อื่นๆ', // Index 2
          ),
        ],
        // ใช้ onItemSelected (ที่ถูกส่งมาจากหน้าหลัก) เป็น onTap handler
        onTap: onItemSelected, 
        
        // ใช้ currentIndex ที่รับเข้ามา เพื่อให้ปุ่มที่ถูกเลือกถูกไฮไลท์
        currentIndex: currentIndex, 
        selectedItemColor: Colors.white, // ไอคอน/ข้อความที่ถูกเลือกเป็นสีขาว
        unselectedItemColor: Colors.white.withOpacity(0.7), // ไอคอน/ข้อความที่ไม่ได้เลือกเป็นสีขาวจาง
        backgroundColor: Colors.transparent, // ทำให้โปร่งใสเพื่อแสดง Gradient
        elevation: 0, // เอาเงาออก
        type: BottomNavigationBarType.fixed, // ป้องกันการขยับของไอคอน
      ),
    );
  }
}
