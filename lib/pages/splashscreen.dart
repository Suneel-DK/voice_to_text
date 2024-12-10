import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hana_weather/pages/homepage.dart';
import 'package:page_transition/page_transition.dart';

class splashscreen extends StatelessWidget {
  const splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        PageTransition(
            child: HomePage(),
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 1000)),
      );
    });
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(0.00, 0.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 200, 0, 10),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 300,
                  height: 300,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 200, 0, 0),
              child: Text(
                'Powered by Hanami UX',
                style: GoogleFonts.roboto(color: Colors.black, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
