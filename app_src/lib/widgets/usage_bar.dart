
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../models/settings_model.dart';

class UsageBarChart extends StatelessWidget {
  const UsageBarChart({super.key, required this.entries, this.height = 220});

  final List<UsageEntry> entries;
  final double height;

  @override
  Widget build(BuildContext context) {
    final maxMb = entries.isEmpty
        ? 1.0
        : entries.map((e) => e.megabytes).reduce((a, b) => a > b ? a : b);
    return SizedBox(
      height: height,
      child: BarChart(
        BarChartData(
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 40)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final i = value.toInt();
                  if (i < 0 || i >= entries.length) return const SizedBox.shrink();
                  final label = entries[i].appName;
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      label.length > 6 ? '${label.substring(0, 6)}…' : label,
                      style: const TextStyle(fontSize: 10),
                    ),
                  );
                },
              ),
            ),
          ),
          barGroups: [
            for (int i = 0; i < entries.length; i++)
              BarChartGroupData(
                x: i,
                barRods: [
                  BarChartRodData(
                    toY: entries[i].megabytes,
                    width: 18,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ],
              )
          ],
          minY: 0,
          maxY: (maxMb * 1.2),
        ),
      ),
    );
  }
}
