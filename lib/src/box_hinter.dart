import 'package:box_hinter/src/utils/box_hinter_typedef.dart';
import 'package:flutter/material.dart';

class BoxHinter extends StatefulWidget {
  const BoxHinter({
    Key? key,
    this.height = 120.0,
    this.width,
    this.color1,
    this.color2,
    this.title = "Hint box",
    this.titleColor,
    this.subtitle = "This is a hint box",
    this.subtitleColor,
    required this.onPressed,
    required this.onTap,
    this.padding,
    this.titleStyle,
    this.subtitleStyle,
    required this.image,
    this.titleSize = 20.0,
    this.contentSize = 15.0,
    this.userUnderstand = "got it!",
    this.userDoesNotUnderstand = "I need more help!"
  }) : super(key: key);

  final double? width;
  final double height;
  final Color? color1;
  final Color? color2;
  final String title;
  final Color? titleColor;
  final String subtitle;
  final Color? subtitleColor;
  final HinterBoxCallback? onPressed;
  final HinterBoxCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final ImageProvider image;
  final double titleSize;
  final double contentSize;
  final String userUnderstand;
  final String userDoesNotUnderstand;

  @override
  _BoxHinterState createState() => _BoxHinterState();
}

class _BoxHinterState extends State<BoxHinter> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap!() ?? (){},
      child: Container(
        width: widget.width??MediaQuery.of(context).size.width * 0.9,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
              colors: [widget.color1??const Color(0xFFCB1841), widget.color2??const Color(0xFF2604DE)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    widget.title,
                    style: widget.titleStyle ?? TextStyle(
                      color: widget.titleColor,
                      fontSize: widget.titleSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    widget.subtitle,
                    style: widget.subtitleStyle ?? TextStyle(
                      color: widget.subtitleColor,
                      fontSize: widget.contentSize,
                      // fontFamily: 'Montserrat',
                    ),
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: closeWindow,
                      child: Text(widget.userUnderstand),
                    ),
                    TextButton(
                      onPressed: widget.onPressed!() ?? (){},
                      child: Text(widget.userDoesNotUnderstand),
                    ),
                  ],
                )
              ],
            ),
            Expanded(
                child: Image(image: widget.image)
            )
          ],
        ),
      ),
    );

  }
  void closeWindow(){
    Navigator.of(context).pop();
  }
}
