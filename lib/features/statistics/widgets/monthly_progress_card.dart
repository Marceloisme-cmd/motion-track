import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';

class MonthlyProgressCard extends StatelessWidget {
  const MonthlyProgressCard({super.key});

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
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Monthly Progress",
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const Gap(AppSpacing.xs),

          Text(
            "Compare your running distance over of the last 6 months",
            style: Theme.of(context).textTheme.bodySmall,
          ),

          const Gap(AppSpacing.md),

          SizedBox(
            height: 220,

            child: BarChart(
              _chartData(context),
              duration: const Duration(milliseconds: 1000),
            ),
          ),
        ],
      ),
    );
  }

  BarChartData _chartData(BuildContext context) {
    return BarChartData(
      maxY: 100,

      borderData: FlBorderData(show: false),

      barTouchData: BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            return BarTooltipItem(
              '${rod.toY.toStringAsFixed(0)} km',
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),

      gridData: FlGridData(
        drawVerticalLine: false,
        horizontalInterval: 20,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.grey.withValues(alpha: 0.2),
            strokeWidth: 1,
          );
        },
      ),
      barGroups: [
        _barData(0, 48),
        _barData(1, 72),
        _barData(2, 55),
        _barData(3, 81),
        _barData(4, 67),
        _barData(5, 95),
      ],
      titlesData: FlTitlesData(
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),

        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),

        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 36,
            interval: 20,
            getTitlesWidget: (value, meta) {
              return Text(
                value.toInt().toString(),
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
              const months = ['Jan', 'Feb', 'Mar', 'apr', 'mei', 'Jun'];

              final index = value.toInt();

              if (index < 0 || index >= months.length) {
                return const SizedBox.shrink();
              }

              return Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  months[value.toInt()],
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  BarChartGroupData _barData(int x, double value) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: AppColors.primary,
          width: 18,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6),
            topRight: Radius.circular(6),
          ),
        ),
      ],
    );
  }
}
