import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challenge/shared/shared.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          padding: const EdgeInsets.only(
            top: 70,
            bottom: 16,
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              Styles.bold(
                'Home',
                fontSize: 32,
                textAlign: TextAlign.center,
              ),
              const YMargin(31),
              Expanded(
                child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          (orientation == Orientation.portrait) ? 2 : 3),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          height: 163,
                          width: 163,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage('${Constants.bgIcon}3'.toPng),
                            ),
                          ),
                        ),
                        const YMargin(10),
                        Styles.semiBold(
                          'Woman in Oversized Suit',
                          fontSize: 14,
                          color: AppColors.white,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
