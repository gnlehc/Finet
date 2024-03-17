import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
void main() {
  runApp(MaterialApp(home: BottomNavBar(selectedIndex: 0, onItemSelected: (int index) {  },)));
}

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final void Function(int index) onItemSelected;

  const BottomNavBar({Key? key, required this.selectedIndex, required this.onItemSelected})
      : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset('assets/img/navbar/homeInactive.png', width: 24),
          activeIcon: Image.asset('assets/img/navbar/homeActive.png', width: 24),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/img/navbar/accountsInactive.png', width: 24),
          activeIcon: Image.asset('assets/img/navbar/accountsActive.png', width: 24),
          label: 'Accounts',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/img/navbar/expensesInactive.png',width: 24),
          activeIcon: Image.asset('assets/img/navbar/expensesActive.png',width: 24),
          label: 'Expenses',
        ),
      
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color.fromARGB(255, 0, 93, 223),
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
    );
  }
}
