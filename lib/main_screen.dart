import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MainScreen extends StatelessWidget {
  final ZoomDrawerController controller;
  const MainScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBar(
          backgroundColor: const Color.fromARGB(255, 251, 251, 251),
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(
              icon: const Icon(Icons.menu_open_outlined, color: Colors.black),
              onPressed: () {
                controller.toggle!();
              },
            ),
          ),
          title: const Text(
            "Chat with us",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                icon: const Icon(Icons.edit_note_outlined, color: Colors.black),
                onPressed: () {},
              ),
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            // Logo
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: CircleAvatar(
                radius: 40.r,
                backgroundColor: Colors.grey[300],
                child: const Text('Logo'),
              ),
            ),
          ],
        ),
        Column(
          children: [
            // Preformatted Questions Row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildQuestionButton("Preformatted Questions"),
                    _buildQuestionButton("Preformatted Questions"),
                    _buildQuestionButton("Preformatted Questions"),
                  ],
                ),
              ),
            ),
            // Chat Bubbles
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 15),
              child: Column(
                children: [
                  _buildUserChatBubble("You"),
                  SizedBox(
                    height: 15.h,
                  ),
                  _buildGPTChatBubble("Chat Gpt"),
                ],
              ),
            ),

            // Text Input
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(
                    color: Color.fromARGB(255, 142, 142, 142),
                  )),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  color: Color.fromARGB(0, 255, 255, 255)),
              child: Row(
                children: [
                  SizedBox(
                    height: 35.h,
                    width: MediaQuery.sizeOf(context).width - 60.w,
                    child: const TextField(
                      decoration: InputDecoration(
                          hintText: "How can we help you today?",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 142, 142, 142)),
                          fillColor: Color.fromARGB(255, 251, 251, 251),
                          filled: true),
                    ),
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
                    ),
                    icon: const Icon(Icons.arrow_upward),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  // Helper widget for preformatted question buttons
  Widget _buildQuestionButton(String text) {
    return Container(
      height: 70.h,
      margin: const EdgeInsets.only(right: 25),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
              color: const Color.fromARGB(255, 69, 69, 69).withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(4, 4)),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  // Helper widget for user chat bubble
  Widget _buildUserChatBubble(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Icon(
            Icons.person_2_outlined,
            color: const Color.fromARGB(255, 128, 128, 128),
            size: 30.r,
          ),
          const SizedBox(width: 20),
          Text(
            text,
            style: const TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 128, 128, 128)),
          ),
        ],
      ),
    );
  }

  // Helper widget for Chat GPT bubble
  Widget _buildGPTChatBubble(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Icon(
            Icons.chat_bubble,
            color: const Color.fromARGB(255, 128, 128, 128),
            size: 30.r,
          ),
          const SizedBox(width: 20),
          Text(
            text,
            style: const TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 128, 128, 128)),
          ),
        ],
      ),
    );
  }
}
