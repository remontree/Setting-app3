
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/settings_model.dart';
import '../widgets/oneui_list_tile.dart';
import 'mobile_data_usage_page.dart';

class DataUsagePage extends StatelessWidget {
  const DataUsagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final total = context.select<SettingsModel, double>((m) => m.mobileDataTotal);
    return Scaffold(
      appBar: AppBar(title: const Text('데이터 사용')),
      body: ListView(
        children: [
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: Row(
                    children: [
                      const Icon(Icons.data_usage_rounded),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('이번 청구 기간', style: TextStyle(fontSize: 12, color: Colors.black54)),
                            const SizedBox(height: 6),
                            Text('${total.toStringAsFixed(0)} MB 사용됨', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                OneUIListTile(
                  title: '모바일 데이터 사용량',
                  subtitle: '앱별 사용량 보기',
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MobileDataUsagePage())),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Column(
              children: const [
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('기타 옵션', style: TextStyle(fontSize: 12, color: Colors.black54)),
                  ),
                ),
                SizedBox(height: 8),
                ListTile(
                  title: Text('데이터 경고 및 제한'),
                  trailing: Icon(Icons.chevron_right_rounded),
                ),
                ListTile(
                  title: Text('백그라운드 데이터'),
                  trailing: Icon(Icons.chevron_right_rounded),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
