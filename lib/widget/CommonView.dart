import 'package:flutter/material.dart';
import '../common/AColors.dart';

class CommonView {
  static Widget text(String text, double size, Color color, {FontWeight? fontWeight}) {
    return Text(text, textAlign: TextAlign.center, style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight ?? FontWeight.normal));
  }

  static Widget button(String text, Function() onPressed, {int? width, int? height}) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AColors.c262626),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            shadowColor: MaterialStateProperty.all(AColors.c262626),
            elevation: MaterialStateProperty.all(2),
            padding: MaterialStateProperty.all(const EdgeInsets.only(left: 25, right: 25, top: 12, bottom: 12)),
            textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 15, color: Colors.white)),
            shape: MaterialStateProperty.all(const StadiumBorder())),
        child: Container(
            constraints: const BoxConstraints(
              minWidth: 100,
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
            )));
  }

  static Widget input({String? hintText, String? tips, bool? obscureText, int? maxLength, TextEditingController? controller}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      if (tips != null) Text(tips, style: const TextStyle(fontSize: 15, color: Colors.black54)),
      if (tips != null) const SizedBox(height: 10.0),
      Container(
          alignment: Alignment.centerLeft,
          decoration: ShapeDecoration(color: AColors.cefefef, shape: const StadiumBorder()),
          child: TextField(
              maxLength: maxLength,
              keyboardType: TextInputType.text,
              controller: controller,
              obscureText: obscureText ?? false,
              style: const TextStyle(color: Colors.black, fontSize: 15),
              decoration: InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(top: 5, bottom: 5, left: 25, right: 25),
                  hintText: hintText ?? "",
                  hintStyle: TextStyle(color: AColors.ca6aaad, fontSize: 15))))
    ]);
  }

  static Widget title(BuildContext context, {String? title, bool? isShowBack = true, Function()? backFunction, Color? backgroundColor}) {
    return Container(
      color: backgroundColor,
      child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: SizedBox(
              height: 60,
              child: Stack(
                children: [
                  if (title != null)
                    Align(
                      alignment: Alignment.center,
                      child: Text(title!, style: const TextStyle(fontSize: 15, color: Colors.black)),
                    ),
                  if (isShowBack == true)
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: InkWell(onTap: backFunction, child: const Image(image: AssetImage("images/nii_logo_50.png"))),
                        )),
                ],
              ))),
    );
  }

  static Widget scrollView(Widget child) {
    return CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: Center(child: child),
      )
    ]);
  }
}
