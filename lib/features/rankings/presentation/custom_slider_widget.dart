import 'package:flutter/material.dart';
import 'package:likha_varv/features/rankings/domain/scoreline_service.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class CustomSliderWidget extends StatelessWidget {
  const CustomSliderWidget({
    Key? key,
    required this.possibleScore,
    required this.score,
    required this.service,
  }) : super(key: key);

  final int possibleScore;
  final int score;
  final ScorelineService service;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SfSliderTheme(
        data: SfSliderThemeData(
          thumbRadius: 13,
          thumbColor: Colors.amber,
          inactiveDividerColor: Colors.grey,
          activeDividerColor: Colors.amber,
          activeTrackColor: Colors.amber,
          inactiveTrackColor: Colors.lightBlue,
          inactiveDividerRadius: 6.0,
          activeDividerRadius: 6.0,
          overlayColor: Colors.transparent,
        ),
        child: SfSlider(
          min: 0,
          max: possibleScore,
          value: score,
          interval: (possibleScore / 8),
          showLabels: false,
          showTicks: false,
          showDividers: false,
          thumbIcon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                score.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          onChanged: (dynamic value) {},
        ),
      ),
    );
  }
}
