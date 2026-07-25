import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_colors.dart';

class WeeklyDistanceChart extends StatelessWidget {
  const WeeklyDistanceChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.card),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.005),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Weekly Distance",
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const Gap(AppSpacing.xs),

          Text(
            "Your running distance over the last 7 days",
            style: Theme.of(context).textTheme.bodySmall,
          ),

          const Gap(AppSpacing.sm),

          SizedBox(
            height: 220,
            child: LineChart(
              _chartData(context),
              duration: const Duration(milliseconds: 2000),
            ),
          ),
        ],
      ),
    );
  }

  LineChartData _chartData(BuildContext context) {
    return LineChartData(
      minY: 0,
      maxY: 10,

      lineTouchData: LineTouchData(
        enabled: true,

        touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((spot) {
              return LineTooltipItem(
                '${spot.y.toStringAsFixed(1)} km',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              );
            }).toList();
          },
        ),
      ),

      borderData: FlBorderData(show: false),

      gridData: FlGridData(
        drawVerticalLine: false,
        horizontalInterval: 2,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.grey.withValues(alpha: 0.2),
            strokeWidth: 1,
          );
        },
      ),

      titlesData: FlTitlesData(
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),

        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            interval: 2,
            getTitlesWidget: (value, meta) {
              return Text(
                '${value.toInt()} km',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
              );
            },
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

              return Text(days[value.toInt()]);
            },
          ),
        ),
      ),
      lineBarsData: [
        LineChartBarData(
          isCurved: true,

          color: AppColors.primary,

          barWidth: 4,

          isStrokeCapRound: true,

          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, bardata, index) {
              return FlDotCirclePainter(
                radius: 4,
                color: AppColors.primary,
                strokeWidth: 2,
                strokeColor: Colors.white,
              );
            },
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.primary.withValues(alpha: 0.20),
                AppColors.primary.withValues(alpha: 0.02),
              ],
            ),
          ),

          spots: const [
            FlSpot(0, 3),
            FlSpot(1, 5),
            FlSpot(2, 2),
            FlSpot(3, 7),
            FlSpot(4, 4),
            FlSpot(5, 8),
            FlSpot(6, 6),
          ],
        ),
      ],
    );
  }
}
