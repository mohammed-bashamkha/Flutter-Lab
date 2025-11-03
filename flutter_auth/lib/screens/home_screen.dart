import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/authentication/login_screen.dart';
import 'package:flutter_auth/screens/services/auth.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Laravel Auth',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(child: Text('HomeScreen')),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Consumer<Auth>(
          builder: (context, auth, child) {
            if (!auth.authenticated) {
              return ListView(
                children: [
                  ListTile(
                    title: const Text('Login'),
                    leading: Icon(Iconsax.login_1_bold),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                  ),
                ],
              );
            } else {
              return ListView(
                padding: EdgeInsets.zero,
                children: [
                  UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/myprofile.png',
                      ),
                    ),
                    decoration: BoxDecoration(color: Colors.deepPurple),
                    accountName: Text(auth.user?.name ?? 'Guest'),
                    accountEmail: Text(auth.user?.email ?? 't6m1X@example.com'),
                  ),

                  ListTile(
                    title: const Text('Logout'),
                    leading: Icon(Iconsax.logout_1_bold),
                    onTap: () {
                      Provider.of<Auth>(context, listen: false).logout();
                    },
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
