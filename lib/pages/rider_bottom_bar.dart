import 'package:flutter/material.dart';

class StatusBottomBar extends StatelessWidget {
  // หากคุณต้องการให้ BottomBar ทำงานได้จริง คุณควรรับค่า onTap และ currentIndex เข้ามา
  // ตัวอย่างนี้ถูกแก้ไขเพื่อให้ 'หน้าแรก' ถูกเลือกเป็นค่าเริ่มต้น (currentIndex = 0)
  final int currentIndex;
  final Function(int)? onItemSelected; // เพิ่ม optional callback

  const StatusBottomBar({
    super.key,
    this.currentIndex = 0, // ⚠️ ตั้งค่าเริ่มต้นเป็น 0 (หน้าแรก)
    this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
            icon: Icon(Icons.motorcycle),
            label: 'ข้อมูลการส่งของ', // Index 1
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'ออกจากระบบ', // Index 2
          ),
        ],
        // ⚠️ บรรทัดนี้คือจุดที่ต้องแก้ไข
        currentIndex: currentIndex, // ใช้ค่าที่รับเข้ามา หรือค่าเริ่มต้นเป็น 0
        onTap: onItemSelected, // เพิ่มการจัดการเมื่อมีการกดปุ่ม
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

// ---------------------------------------------------------------------

// หากคุณไม่ต้องการใช้ constructor ที่เพิ่มเข้ามา ให้เปลี่ยนโค้ดเป็นแบบนี้:
/*
class StatusBottomBar extends StatelessWidget {
  const StatusBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // ... (โค้ด BoxDecoration เดิม) ...
      child: BottomNavigationBar(
        // ... (โค้ด items เดิม) ...
        currentIndex: 0, // 👈 เปลี่ยนจาก 1 เป็น 0 ที่นี่
        // ... (โค้ด style อื่นๆ เดิม) ...
      ),
    );
  }
}
*/