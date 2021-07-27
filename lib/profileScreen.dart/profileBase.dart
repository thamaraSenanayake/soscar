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
    return Scaffold(
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

                // GNav(
                //   onTabChange: (val){

                //     if(val == 0){
                //       setState(() {
                //         _currentScreen = ProfileScreens.Maps;
                //         _selectedIndex = val;                      
                //       });
                //     }
                //     else if(val == 1){
                //       setState(() {
                //         _currentScreen = ProfileScreens.Chat;
                //         _selectedIndex = val;                      
                //       });
                //     }
                //     else if(val == 2){
                //       setState(() {
                //         _currentScreen = ProfileScreens.Wallet;
                //         _selectedIndex = val;                      
                //       });
                //     }
                //     else if(val == 3){
                //       setState(() {
                //         _currentScreen = ProfileScreens.Profile;
                //         _selectedIndex = val;                      
                //       });
                //     }
                //   },
                //   selectedIndex: _selectedIndex,
                //   backgroundColor: AppColors.mainColor,
                //   rippleColor: Colors.white, // tab button ripple color when pressed
                //   // hoverColor: Colors.grey[700], // tab button hover color
                //   haptic: true, // haptic feedback
                //   tabBorderRadius: 10.r, 
                //   tabActiveBorder: Border.all(color: Colors.white, width: 1), // tab button border
                //   tabBorder: Border.all(color: AppColors.mainColor, width: 1), // tab button border
                //   // tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
                //   curve: Curves.easeOutExpo, // tab animation curves
                //   duration: Duration(milliseconds: 300), // tab animation duration
                //   gap: 8, // the tab button gap between icon and text 
                //   color: Colors.white, // unselected icon color
                //   activeColor: AppColors.mainColor, // selected icon and text color
                //   iconSize: 24.h, // tab button icon size
                //   tabBackgroundColor: Colors.white, // selected tab background color
                //   padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.r), // navigation bar padding
                //   tabs: [
                //     GButton(
                //       leading: SizedBox(
                //         child: SvgPicture.asset(
                //           "assets/icon/map.svg",
                //           color: _selectedIndex == 0?AppColors.mainColor:Colors.white,
                //         ),
                //         height: 60.h,
                //         width: 60.w,
                //       ),
                //       text: 'Place', 
                //       icon: null,//Icons.location_on,
                //     ),
                //     GButton(
                //       leading: SizedBox(
                //         child: SvgPicture.asset(
                //           "assets/icon/comments.svg",
                //           color: _selectedIndex == 1?AppColors.mainColor:Colors.white,
                //         ),
                //         height: 60.h,
                //         width: 60.w,
                //       ),
                //       icon: null,//Icons.comment,
                //       text: 'Chat',
                //     ),
                //     GButton(
                //       leading: SizedBox(
                //         child: SvgPicture.asset(
                //           "assets/icon/wallet.svg",
                //           color: _selectedIndex == 2?AppColors.mainColor:Colors.white,
                //         ),
                //         height: 60.h,
                //         width: 60.w,
                //       ),
                //       icon: null,//Icons.money,
                //       text: "Wallet",
                //     ),
                //     GButton(
                //       leading: SizedBox(
                //         child: SvgPicture.asset(
                //           "assets/icon/user.svg",
                //           color: _selectedIndex == 3?AppColors.mainColor:Colors.white,
                //         ),
                //         height: 60.h,
                //         width: 60.w,
                //       ),
                //       icon: null,//Icons.person,
                //       text: 'Profile',
                //     )
                //   ]
                // ),  
              ),
            ),
            
          ]
        ),
      ),
    );
  }
}

enum ProfileScreens{
  Maps,
  Chat,
  Wallet,
  Profile
}