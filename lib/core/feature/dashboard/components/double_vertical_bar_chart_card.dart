import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:softnet_school_portal/core/utils/constants.dart';

class DoubleVerticalBarChart extends StatelessWidget {
  const DoubleVerticalBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                text: 'Expense',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: '\n Jan - Jul 2021',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            SizedBox(height: defaultPadding),
            AspectRatio(
              aspectRatio: 1.5,
              child: BarChart(
                BarChartData(
                  barGroups: _buildBarGroups(),
                  alignment: BarChartAlignment.spaceAround,
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          final style = Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontSize: 12, fontWeight: FontWeight.bold);
                          Widget text;
                          switch (value.toInt()) {
                            case 0:
                              text = Text('Jan', style: style);
                              break;
                            case 1:
                              text = Text('Feb', style: style);
                              break;
                            case 2:
                              text = Text('Mar', style: style);
                              break;
                            case 3:
                              text = Text('Apr', style: style);
                              break;
                            case 4:
                              text = Text('May', style: style);
                              break;
                            case 5:
                              text = Text('Jun', style: style);
                              break;
                            default:
                              text = const Text('');
                              break;
                          }
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: text,
                          );
                        },
                        reservedSize: 30,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 5,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          return Text(
                            '${value.toInt() * 100}k',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                          );
                        },
                        reservedSize: 40,
                      ),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                  ),
                  gridData: const FlGridData(show: false),
                  barTouchData: BarTouchData(enabled: true),
                ),
              ),
            ),
            Text('Trading up 12.9% from last week',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 12,
                    )),
          ],
        ),
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups() {
    return [
      _makeGroupData(0, 10),
      _makeGroupData(1, 12),
      _makeGroupData(2, 8),
      _makeGroupData(3, 14),
      _makeGroupData(4, 15),
      _makeGroupData(5, 9),
    ];
  }

  BarChartGroupData _makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: Colors.blue,
          width: 20,
          borderRadius: BorderRadius.zero,
          // backDrawRodData: BackgroundBarChartRodData(
          //   show: true,
          //   toY: 20, // Maximum value on the Y-axis
          //   color: Colors.grey.withOpacity(0.2), // Background bar
          // ),
        ),
        BarChartRodData(
          toY: y * .75,
          color: Colors.pink,
          width: 20,
          borderRadius: BorderRadius.zero,
        ),
      ],
    );
  }
}
