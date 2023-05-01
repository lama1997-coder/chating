import 'package:chating/triingle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ChatBubble extends StatelessWidget {
  final bool sender;
  final String? message;
  final String? time;
  const ChatBubble({required this.sender, super.key, this.message, this.time});

  @override
  Widget build(BuildContext context) {
    return sender
        ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Flexible(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade600,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(19),
                            bottomLeft: Radius.circular(19),
                            bottomRight: Radius.circular(19),
                          ),
                        ),
                        child: Text(
                          message ?? "",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),
                      ),
                      Text(time ?? "", style: TextStyle(color: Colors.blueGrey))
                    ],
                  ),
                ),
                CustomPaint(painter: Triangle(Colors.indigo.shade600)),
              ])
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: CustomPaint(
                  painter: Triangle(Colors.grey.shade300),
                ),
              ),
              Flexible(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(19),
                          bottomLeft: Radius.circular(19),
                          bottomRight: Radius.circular(19),
                        ),
                      ),
                      child: Text(
                        message ?? "",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                    Text(
                      time ?? "",
                      style: TextStyle(color: Colors.blueGrey),
                    )
                  ],
                ),
              ),
            ],
          );
  }
}
