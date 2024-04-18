// ignore_for_file: non_constant_identifier_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/bloc/weather_block_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget GetWeatherIcon(var code) {
    var sizeOf = MediaQuery.of(context).size;
    switch (code) {
      case >= 200 && <= 231:
        return Center(
          child: Image.asset(
            'assets/5.png',
            height: sizeOf.height * 0.4,
          ),
        );
      case >= 300 && <= 321:
        return Center(
          child: Image.asset(
            'assets/3.png',
            height: sizeOf.height * 0.4,
          ),
        );
      case >= 500 && <= 531:
        return Center(
          child: Image.asset(
            'assets/2.png',
            height: sizeOf.height * 0.4,
          ),
        );
      case >= 600 && <= 622:
        return Center(
          child: Image.asset(
            'assets/4.png',
            height: sizeOf.height * 0.4,
          ),
        );
      case >= 701 && <= 781:
        return Center(
          child: Image.asset(
            'assets/5.png',
            height: sizeOf.height * 0.4,
          ),
        );
      case == 800:
        return Center(
          child: Image.asset(
            'assets/6.png',
            height: sizeOf.height * 0.4,
          ),
        );
      case >= 801 && <= 804:
        return Center(
          child: Image.asset(
            'assets/8.png',
            height: sizeOf.height * 0.4,
          ),
        );
      default:
        return Center(
          child: Image.asset(
            'assets/7.png',
            height: sizeOf.height * 0.4,
          ),
        );
    }
  }

  Widget GetMessage() {
    final Hour = DateTime.now().hour;
    var textstyle = const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    switch (Hour) {
      case >= 3 && <= 11:
        return Text(
          "Good Morning!",
          style: textstyle,
        );

      case >= 12 && <= 16:
        return Text(
          "Good Afternoon!",
          style: textstyle,
        );

      case >= 17 && <= 21:
        return Text(
          "Good Evening!",
          style: textstyle,
        );

      case >= 22 && <= 24 || >= 0 && <= 2:
        return Text(
          "Good Night!",
          style: textstyle,
        );

      default:
        return const Text(" ");
    }
  }

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

                            GetMessage(),

                            GetWeatherIcon(state.weather.weatherConditionCode),
                            // Center(
                            //   child: Image.asset(
                            //     'assets/5.png',
                            //     height: sizeOf.height * 0.4,
                            //   ),
                            // ),
                            Center(
                              child: Text(
                                "${state.weather.temperature!.celsius!.round()}°C",
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white38),
                              ),
                            ),
                            Center(
                              child: Text(
                                state.weather.weatherMain!.toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 25, color: Colors.white38),
                              ),
                            ),
                            Center(
                              child: Text(
                                DateFormat('EEEE dd •')
                                    .add_jm()
                                    .format(state.weather.date!),
                                style: const TextStyle(
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Sunrise"),
                                    Text(
                                      DateFormat('')
                                          .add_jm()
                                          .format(state.weather.sunrise!),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: sizeOf.width * 0.08,
                                ),
                                Image.asset(
                                  'assets/12.png',
                                  height: imgSz,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Sunset"),
                                    Text(
                                      DateFormat('')
                                          .add_jm()
                                          .format(state.weather.sunset!),
                                    ),
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Temp Max"),
                                    Text(
                                      "${state.weather.tempMax!.celsius!.round()}°C",
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: sizeOf.width * 0.08,
                                ),
                                Image.asset(
                                  'assets/14.png',
                                  height: imgSz,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Temp Min"),
                                    Text(
                                      "${state.weather.tempMin!.celsius!.round()}°C",
                                    ),
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
