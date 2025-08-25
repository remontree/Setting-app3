
import 'package:flutter/material.dart';
import '../widgets/oneui_list_tile.dart';
import 'hotspot_today_shared_page.dart';

class MobileHotspotPage extends StatelessWidget {
  const MobileHotspotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('모바일 핫스팟')),
      body: ListView(
        children: [
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                SwitchListTile(
                  value: false,
                  onChanged: (_) {},
                  title: const Text('모바일 핫스팟'),
                  subtitle: const Text('꺼짐'),
                ),
                const Divider(height: 1),
                OneUIListTile(
                  title: '오늘 공유한 모바일 데이터',
                  subtitle: '연결 기기별 사용량',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const HotspotTodaySharedPage()));
                  },
                ),
                OneUIListTile(
                  title: '핫스팟 이름 및 암호',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
