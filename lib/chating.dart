import 'package:flutter/material.dart';

import 'chat_bubble.dart';

class CustomButton extends StatelessWidget {
  final String? userImage;
  final String? name;
  final AppBar? header;

  final TextStyle? textStyle;
  final Color? appBarColor;
  final List<ChatBubble>? chatMessage;
  final Widget child;
  var style;
  CustomButton(
      {Key? key,
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: chatMessage!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return chatMessage![index];
              },
            ),
          ),
          Container(
            color: Colors.grey,
            width: double.infinity,
            child: Row(
              children: [
                Icon(Icons.share),
                Expanded(
                    child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "write text", fillColor: Colors.white),
                )),
                Icon(Icons.send),
              ],
            ),
          )
        ],
      ),
    );
  }
}
