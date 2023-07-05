import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnreadCountView extends StatelessWidget {
  const UnreadCountView({
    Key? key,
    this.count = 0,
    this.size = 13,
    this.margin,
    this.isConversation = false,
    this.isBottomBar = false,
    this.notDisturb = false,
  }) : super(key: key);
  final int count;
  final double size;
  final bool notDisturb;
  final bool isBottomBar;
  final bool isConversation;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: count > 0,
      child: isBottomBar
          ? bottomBarUnread()
          : Container(
              alignment: Alignment.center,
              margin: margin,
              padding: paddingHandler(),
              constraints: isConversation
                  ? null
                  : BoxConstraints(maxHeight: size, minWidth: size),
              decoration:
                  isConversation ? _isConversationDecoration : _decoration,
              child: isConversation ? _isConversationText : _text,
            ),
    );
  }

  Widget bottomBarUnread() {
    return Container(
      // width: count < 10 ? 36.w : null,
      padding: EdgeInsets.symmetric(
          horizontal: count < 10 ? 3.5.w : 2.w, vertical: 1.w),
      decoration: BoxDecoration(
          color: Color(0xFFEB5050),
          border: Border.all(color: Colors.white, width: 1.w),
          borderRadius: BorderRadius.all(Radius.circular(18.w))),
      child: Text(
        '${count}',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 10.sp,
          color: const Color(0xFFFFFFFF),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  EdgeInsets? paddingHandler() {
    if (isConversation) {
      return EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h);
    }
    return count > 99 ? EdgeInsets.symmetric(horizontal: 4.w) : null;
  }

  Text get _isConversationText => Text(
        '${count > 99 ? '99+' : count}',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12.sp,
          color: const Color(0xFFFFFFFF),
        ),
        textAlign: TextAlign.center,
      );

  Text get _text => Text(
        '${count > 99 ? '99+' : count}',
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 8.sp,
          color: const Color(0xFFFFFFFF),
        ),
        textAlign: TextAlign.center,
      );

  Decoration get _isConversationDecoration => BoxDecoration(
        color: notDisturb ? Color(0xFFB9BDC6) : Color(0xFF1A8CFF),
        shape: count > 99 ? BoxShape.rectangle : BoxShape.circle,
        borderRadius: count > 99 ? BorderRadius.circular(18.r) : null,
        boxShadow: [
          BoxShadow(
            color: Color(0x26C61B4A),
            offset: Offset(1.15.w, 1.15.h),
            blurRadius: 57.58.r,
          ),
          BoxShadow(
            color: Color(0x1AC61B4A),
            offset: Offset(2.3.w, 2.3.h),
            blurRadius: 11.52.r,
          ),
          BoxShadow(
            color: Color(0x0DC61B4A),
            offset: Offset(4.61.w, 4.61.h),
            blurRadius: 17.28.r,
          ),
        ],
      );

  Decoration get _decoration => BoxDecoration(
        color: Color(0xFFFF3366),
        shape: count > 99 ? BoxShape.rectangle : BoxShape.circle,
        borderRadius: count > 99 ? BorderRadius.circular(10.r) : null,
        boxShadow: [
          BoxShadow(
            color: Color(0x26C61B4A),
            offset: Offset(1.15.w, 1.15.h),
            blurRadius: 57.58.r,
          ),
          BoxShadow(
            color: Color(0x1AC61B4A),
            offset: Offset(2.3.w, 2.3.h),
            blurRadius: 11.52.r,
          ),
          BoxShadow(
            color: Color(0x0DC61B4A),
            offset: Offset(4.61.w, 4.61.h),
            blurRadius: 17.28.r,
          ),
        ],
      );
}
