import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:go_roots/main_screen.dart';

void main() {
  runApp(const ChatUIApp());
}

class ChatUIApp extends StatelessWidget {
  const ChatUIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(360, 640),
      child: MaterialApp(
        home: Zoom(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

final _drawerController = ZoomDrawerController();

class Zoom extends StatelessWidget {
  const Zoom({super.key});

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _drawerController,
      style: DrawerStyle.defaultStyle,
      menuScreen: Scaffold(
        backgroundColor: const Color.fromRGBO(85, 92, 65, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(85, 92, 65, 1),
          leading: IconButton(
            onPressed: () {
              _drawerController.toggle!();
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: 40.r,
                    height: 40.r,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100.r))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(100.r)),
                      child: Image.network(
                        "https://plus.unsplash.com/premium_photo-1729708654660-8c14ff5e408c?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyfHx8ZW58MHx8fHx8",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Go Roots",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit_note_rounded,
                        color: Colors.white,
                      ))
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              const MenuItemWidget(
                title: "Chat with us",
                icon: Icons.chat_bubble,
              ),
              const MenuItemWidget(
                title: "Booking History",
                icon: Icons.label_important_outline_rounded,
              ),
              const MenuItemWidget(
                title: "Payment History",
                icon: Icons.swap_horiz_rounded,
              ),
              const MenuItemWidget(
                title: "Settings",
                icon: Icons.settings,
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.65,
                  child: const Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 35),
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          )),
                      Icon(Icons.calendar_month, color: Colors.white),
                    ],
                  )),
            ],
          ),
        ),
      ),
      mainScreen: const ChatScreen(),
      borderRadius: 24.0,
      showShadow: true,
      angle: 0.0,
      menuBackgroundColor: const Color.fromRGBO(85, 92, 65, 1),
      slideWidth: MediaQuery.of(context).size.width * 0.7,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  const MenuItemWidget({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 28.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: const Color.fromARGB(255, 255, 255, 255),
            size: 25.r,
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: const TextStyle(
                fontSize: 16, color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ],
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 251, 251, 251),
      body: MainScreen(
        controller: _drawerController,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.home_filled)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.calendar_today)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.favorite_border)),
            IconButton(
                onPressed: () {}, icon: const Icon(CupertinoIcons.clock)),
          ],
        ),
      ),
    );
  }
}
