import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MainHorizontalBarChart extends StatelessWidget {
  const MainHorizontalBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Performance',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            AspectRatio(
              aspectRatio: 1.5,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.center,
                  borderData: FlBorderData(show: false),
                  maxY: 25, // Max value of the X-axis (since it's flipped)
                  barTouchData: BarTouchData(enabled: true),
                  titlesData: FlTitlesData(
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            '${value.toInt()}k',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          );
                        },
                        reservedSize: 30,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 5,
                        getTitlesWidget: (value, meta) {
                          const style = TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          );
                          print(value);
                          Widget text;
                          switch (value.toInt() / 5) {
                            case 0:
                              text = const Text('Product A', style: style);
                              break;
                            case 1:
                              text = const Text('Product B', style: style);
                              break;
                            case 2:
                              text = const Text('Product C', style: style);
                              break;
                            case 3:
                              text = const Text('Product D', style: style);
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
                        reservedSize: 100,
                      ),
                    ),
                  ),
                  barGroups: _buildHorizontalBarGroups(),
                  gridData: const FlGridData(show: false),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<BarChartGroupData> _buildHorizontalBarGroups() {
    return [
      _makeGroupData(0, 10),
      _makeGroupData(1, 15),
      _makeGroupData(2, 12),
      _makeGroupData(3, 20),
    ];
  }

  BarChartGroupData _makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY:
              y, // This is the length of the bar from left to right (horizontal)
          color: Colors.green,
          width: 15,
          borderRadius: BorderRadius.circular(0),
          rodStackItems: [],
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 25, // The background bar's length (25 is maxY)
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
      ],
    );
  }
}
