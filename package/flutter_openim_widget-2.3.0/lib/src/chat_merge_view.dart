import 'package:flutter/material.dart';
import 'package:flutter_openim_widget/flutter_openim_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatMergeMsgView extends StatelessWidget {
  const ChatMergeMsgView(
      {Key? key,
      required this.title,
      required this.summaryList,
      required this.isReceived})
      : super(key: key);
  final String title;
  final List<String> summaryList;
  final bool isReceived;

  List<Widget> _children() {
    var list = <Widget>[];
    list
      ..add(Text(
        title,
        style: TextStyle(
          color: isReceived ? Color.fromARGB(255, 2, 2, 2) : Color(0xFFffffff),
          fontSize: 15.sp,
        ),
      ))
      ..add(Padding(
        padding: EdgeInsets.only(bottom: 8.h, top: 8.h),
        child: Divider(
          color: isReceived
              ? Color.fromARGB(61, 74, 74, 74)
              : Color.fromARGB(61, 235, 235, 235),
          height: 0.5.h,
        ),
      ));
    for (var s in summaryList) {
      list.add(ChatAtText(
        text: s.trim(),
        textStyle: TextStyle(
          color: isReceived ? Color(0xFF000000) : Color(0xFFffffff),
          fontSize: 11.sp,
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 200.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: _children(),
      ),
    );
  }
}
