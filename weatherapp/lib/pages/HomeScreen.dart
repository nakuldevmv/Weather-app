import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
          child: SizedBox(
            height: sizeOf.height,
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(2, -0.3),
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.cyan),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-2, -0.3),
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 105, 238, 255)),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, -1.2),
                  child: Container(
                    height: 150,
                    width: 400,
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color.fromARGB(255, 255, 154, 66)),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.transparent),
                  ),
                ),
                SizedBox(
                  height: sizeOf.height,
                  width: sizeOf.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "📍 Location Here",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "A Message Here",
                        style: TextStyle(fontSize: 30),
                      ),
                      Image.asset('assets/1.png'),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
