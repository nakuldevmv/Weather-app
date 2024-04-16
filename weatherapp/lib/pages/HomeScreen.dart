import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/weather_block_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.of(context).size;
    var imgSz = sizeOf.height * 0.08; //define the size of bottom small images
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
          padding: const EdgeInsets.fromLTRB(40, 0.8 * kToolbarHeight, 40, 10),
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
                Align(
                  alignment: const AlignmentDirectional(0, 0.5),
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 124, 157, 255)),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.transparent),
                  ),
                ),
                BlocBuilder<WeatherBlockBloc, WeatherBlockState>(
                  builder: (context, state) {
                    if (state is WeatherBlockSuccess) {
                      return SizedBox(
                        height: sizeOf.height,
                        width: sizeOf.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "📍 ${state.weather.areaName}",
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "A Message Here",
                              style: TextStyle(fontSize: 30),
                            ),
                            Center(
                              child: Image.asset(
                                'assets/5.png',
                                height: sizeOf.height * 0.4,
                              ),
                            ),
                            const Center(
                              child: Text(
                                "Temp here",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white38),
                              ),
                            ),
                            const Center(
                              child: Text(
                                "Climate here",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white38),
                              ),
                            ),
                            const Center(
                              child: Text(
                                "Date Here",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white38),
                              ),
                            ),
                            SizedBox(
                              height: sizeOf.height * 0.05,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/11.png',
                                  height: imgSz,
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Sunrise"),
                                    Text("Data Here")
                                  ],
                                ),
                                SizedBox(
                                  width: sizeOf.width * 0.08,
                                ),
                                Image.asset(
                                  'assets/12.png',
                                  height: imgSz,
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Sunset"),
                                    Text("data here"),
                                  ],
                                ),
                              ],
                            ),
                            const Divider(
                              thickness: 0.1,
                              color: Colors.white,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'assets/13.png',
                                  height: imgSz,
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Temp Max"),
                                    Text("Data Here")
                                  ],
                                ),
                                SizedBox(
                                  width: sizeOf.width * 0.08,
                                ),
                                Image.asset(
                                  'assets/14.png',
                                  height: imgSz,
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Temp Min"),
                                    Text("data here"),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                )
              ],
            ),
          )),
    );
  }
}
