import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soscar/const.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:soscar/profileScreen.dart/chat.dart';
import 'package:soscar/profileScreen.dart/map.dart';
import 'package:soscar/profileScreen.dart/profile.dart';
import 'package:soscar/profileScreen.dart/wallet.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class ProfileBase extends StatefulWidget {
  ProfileBase({Key key}) : super(key: key);

  @override
  _ProfileBaseState createState() => _ProfileBaseState();
}

class _ProfileBaseState extends State<ProfileBase> {
  ProfileScreens _currentScreen = ProfileScreens.Maps;

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: Container(
          width: AppData.width.w,
          height: AppData.height.h,
          color: Colors.white,
          child: Stack(
            children:[

              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 100.h,
                  width: AppData.width.w,
                  color: AppColors.mainColor,
                ),
              ),

              SafeArea(
                top: false,
                child: SizedBox(
                  height:AppData.height.h,
                  width:AppData.width.w,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _currentScreen == ProfileScreens.Maps?
                        MapPage():
                        _currentScreen == ProfileScreens.Chat?
                        ChatPage():
                        _currentScreen == ProfileScreens.Wallet?
                        Wallet():
                        _currentScreen == ProfileScreens.Profile?
                        Profile():
                        Container()

                      ],
                    ),
                  ),
                ),
              ),

              SafeArea(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TitledBottomNavigationBar(
                    inactiveStripColor:AppColors.mainColor,
                    inactiveColor: Colors.white,
                    activeColor: Colors.white,
                    currentIndex: _selectedIndex, // Use this to update the Bar giving a position
                    onTap: (val){
                      if(val == 0){
                        setState(() {
                          _currentScreen = ProfileScreens.Maps;
                          _selectedIndex = val;                      
                        });
                      }
                      else if(val == 1){
                        setState(() {
                          _currentScreen = ProfileScreens.Chat;
                          _selectedIndex = val;                      
                        });
                      }
                      else if(val == 2){
                        setState(() {
                          _currentScreen = ProfileScreens.Wallet;
                          _selectedIndex = val;                      
                        });
                      }
                      else if(val == 3){
                        setState(() {
                          _currentScreen = ProfileScreens.Profile;
                          _selectedIndex = val;                      
                        });
                      }
                    },
                    items: [
                        TitledNavigationBarItem(backgroundColor:AppColors.mainColor, title: Text('Map'), icon: Icons.map),
                        TitledNavigationBarItem(backgroundColor:AppColors.mainColor, title: Text('Chat'), icon: Icons.chat_outlined),
                        TitledNavigationBarItem(backgroundColor:AppColors.mainColor, title: Text('Wallet'), icon: Icons.money),
                        TitledNavigationBarItem(backgroundColor:AppColors.mainColor, title: Text('Profile'), icon: Icons.person_outline),
                    ]
                  )
                ),
              ),
              
            ]
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    if(_currentScreen == ProfileScreens.Maps){
      return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you want to exit an App'),
          actions: <Widget>[
            GestureDetector(
              onTap: () => Navigator.of(context).pop(false),
              child: Text("NO"),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () => Navigator.of(context).pop(true),
              child: Text("YES"),
            ),
          ],
        ),
      ) ??
          false;
    }else{
      setState(() {
         _currentScreen = ProfileScreens.Maps;     
      });
      return false;
    }   
  }
}

enum ProfileScreens{
  Maps,
  Chat,
  Wallet,
  Profile
}