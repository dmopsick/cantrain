import 'package:cantrain/views/account_page.dart';
import 'package:cantrain/views/home_dashboard_page.dart';
import 'package:cantrain/views/records_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // The authenticated user object from FireBase
  final authUser = FirebaseAuth.instance.currentUser!;
  var isLoaded = false;
  int selectedBottomNavIndex = 0;
  final List<Widget> pages = [
    const HomeDashboardView(),
    const RecordsView(),
    const AccountView()
  ];

  @override
  void initState() {
    super.initState();
  }

  void navigate(int index) {
    setState(() {
      selectedBottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: pages[selectedBottomNavIndex],
      bottomNavigationBar: Container(
        color: Colors.blue.shade900,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            gap: 8,
            onTabChange: (index) {
              print(index);
              navigate(index);
            },
            backgroundColor: Colors.blue.shade900,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.blue.shade800,
            padding: EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home'
              ),
              GButton(
                icon: Icons.library_books,
                text: 'Records'
              ),
              GButton(
                icon: Icons.account_circle,
                text: 'Account'
              ),   
            ]
          ),
        ),
      ),

  );
      
  
  }
}

