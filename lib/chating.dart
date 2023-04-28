import 'package:flutter/material.dart';

import 'chat_bubble.dart';

class CustomButton extends StatelessWidget {
  final String? userImage;
  final String? name;
  final AppBar? header;

  final TextStyle? textStyle;
  final Color? appBarColor;
  final List<ChatBubble>? chatMessage;
  var onPressed;
  final Widget child;
  var style;
  CustomButton(
      {Key? key,
      @required this.onPressed,
      required this.child,
      this.header,
      this.chatMessage,
      this.style,
      this.appBarColor,
      this.textStyle,
      this.userImage,
      this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header ??
          AppBar(
            backgroundColor: appBarColor ?? Colors.grey,
            title: userImage != null
                ? Row(
                    children: [
                      Image.asset(
                        userImage!,
                      )
                    ],
                  )
                : Text(
                    name ?? "",
                    style: textStyle ?? TextStyle(fontSize: 10),
                  ),
          ),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: chatMessage!.length,
        itemBuilder: (context, index) {
          return chatMessage![index];
        },
      ),
    );
  }
}
