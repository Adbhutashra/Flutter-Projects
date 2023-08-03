import 'package:flutter/material.dart';

class UIScreen extends StatefulWidget {
  const UIScreen({super.key});

  @override
  State<UIScreen> createState() => _UIScreenState();
}

class _UIScreenState extends State<UIScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BackgroundImageFb1(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Adbhut Ashra", style: TextStyle(color: Colors.white),)
        ],
      ),imageUrl: "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/backgrounds%2Fcasey-horner-G2jAOMGGlPE-unsplash.jpg?alt=media&token=54d2effa-1220-4bc2-b03c-caed9feb22db" ),
    );
  }
}



class BackgroundImageFb1 extends StatelessWidget {
  final Widget child;
  final String imageUrl;
  const BackgroundImageFb1(
      {required this.child, required this.imageUrl, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Place as the child widget of a scaffold
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
