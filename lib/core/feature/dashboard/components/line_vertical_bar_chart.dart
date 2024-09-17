import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineVerticalBarChart extends StatefulWidget {
  const LineVerticalBarChart({super.key});

  @override
  _LineVerticalBarChartState createState() => _LineVerticalBarChartState();
}

class _LineVerticalBarChartState extends State<LineVerticalBarChart> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Monthly Sales Data',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            AspectRatio(
              aspectRatio: 1.6,
              child: BarChart(
                BarChartData(
                  borderData: FlBorderData(show: false),
                  titlesData: _buildTitlesData(),
                  barGroups: _buildBarGroups(),
                  gridData: const FlGridData(show: false),
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipColor: (group) {
                        return group.barRods[0].color?.withOpacity(.4) ??
                            Colors.grey;
                      },
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          rod.toY.round().toString(),
                          const TextStyle(color: Colors.white),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  FlTitlesData _buildTitlesData() {
    return FlTitlesData(
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 18,
          interval: 10,
          getTitlesWidget: (value, meta) {
            return Text(
              value.toInt().toString(),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 12),
            );
          },
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 42,
          getTitlesWidget: (double value, TitleMeta meta) {
            final style =
                Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12);
            // print('value $value');
            switch (value.toInt()) {
              case 0:
                return Text('Jan', style: style);
              case 1:
                return Text('Feb', style: style);
              case 2:
                return Text('Mar', style: style);
              case 3:
                return Text('Apr', style: style);
              case 4:
                return Text('May', style: style);
              case 5:
                return Text('Jun', style: style);
              case 6:
                return Text('Jul', style: style);
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups() {
    return [
      BarChartGroupData(
          x: 0, barRods: [BarChartRodData(toY: 10, color: Colors.blue)]),
      BarChartGroupData(
          x: 1, barRods: [BarChartRodData(toY: 12, color: Colors.orange)]),
      BarChartGroupData(
          x: 2, barRods: [BarChartRodData(toY: 8, color: Colors.purple)]),
      BarChartGroupData(
          x: 3, barRods: [BarChartRodData(toY: 14, color: Colors.green)]),
      BarChartGroupData(
          x: 4, barRods: [BarChartRodData(toY: 6, color: Colors.red)]),
      BarChartGroupData(
          x: 5, barRods: [BarChartRodData(toY: 13, color: Colors.cyan)]),
      BarChartGroupData(
          x: 6, barRods: [BarChartRodData(toY: 13, color: Colors.pink)]),
    ];
  }
}
