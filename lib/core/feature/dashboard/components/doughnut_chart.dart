import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:softnet_school_portal/data/model/pie_chart_section_data_model.dart';

class DoughnutChart extends StatefulWidget {
  const DoughnutChart({super.key, required this.listOfPieSectionData});
  final List<PieChartSectionDataModel> listOfPieSectionData;

  @override
  State<DoughnutChart> createState() => _DoughnutChartState();
}

class _DoughnutChartState extends State<DoughnutChart> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return PieChart(
      swapAnimationCurve: Curves.easeInOut,
      PieChartData(
        sections: _buildPieChartSections(widget.listOfPieSectionData),
        centerSpaceRadius: 50,
        sectionsSpace: 0,
        startDegreeOffset: -90,
        borderData: FlBorderData(show: false),
        pieTouchData: PieTouchData(
          touchCallback: (FlTouchEvent event, pieTouchResponse) {
            setState(() {
              if (!event.isInterestedForInteractions ||
                  pieTouchResponse == null ||
                  pieTouchResponse.touchedSection == null) {
                touchedIndex = -1;
                return;
              }
              touchedIndex =
                  pieTouchResponse.touchedSection!.touchedSectionIndex;
            });
          },
        ),
      ),
    );
  }

  List<PieChartSectionData> _buildPieChartSections(
      List<PieChartSectionDataModel> listOfPieSectionData) {
    return listOfPieSectionData.asMap().entries.map((data) {
      final isTouched = data.key == touchedIndex;
      final radius = isTouched ? 40.0 : 30.0;
      return PieChartSectionData(
        color: data.value.color,
        value: data.value.value,
        title: '${data.value.value}%',
        radius: radius,
        showTitle: isTouched ? true : false,
        titleStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
      );
    }).toList();
  }
}
