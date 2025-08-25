
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/settings_model.dart';
import 'hotspot_usage_chart_page.dart';

class HotspotTodaySharedPage extends StatelessWidget {
  const HotspotTodaySharedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final total = context.select<SettingsModel, double>((m) => m.hotspotTotal);
    final entries = context.select<SettingsModel, List<UsageEntry>>((m) => m.hotspotData);
    return Scaffold(
      appBar: AppBar(
        title: const Text('오늘 공유한 모바일 데이터'),
        actions: [
          IconButton(
            tooltip: '그래프',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => const HotspotUsageChartPage()));
            },
            icon: const Icon(Icons.bar_chart_rounded),
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              title: const Text('총 사용량'),
              subtitle: Text('${total.toStringAsFixed(0)} MB'),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                for (final e in entries)
                  ListTile(
                    title: Text(e.appName),
                    subtitle: Text('${e.megabytes.toStringAsFixed(0)} MB'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
