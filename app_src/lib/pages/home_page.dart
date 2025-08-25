
import 'package:flutter/material.dart';
import '../widgets/oneui_list_tile.dart';
import 'connectivity_page.dart';
import 'edit_usage_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('설정')),
      body: ListView(
        children: [
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                const SizedBox(height: 6),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('연결', style: TextStyle(fontSize: 12, color: Colors.black54)),
                  ),
                ),
                OneUIListTile(
                  leading: const Icon(Icons.wifi_rounded),
                  title: 'Wi‑Fi',
                  subtitle: '사용 안 함',
                  onTap: () {},
                ),
                OneUIListTile(
                  leading: const Icon(Icons.bluetooth_rounded),
                  title: '블루투스',
                  subtitle: '꺼짐',
                  onTap: () {},
                ),
                OneUIListTile(
                  leading: const Icon(Icons.flight_rounded),
                  title: '비행기 탑승 모드',
                  subtitle: '모든 무선 네트워크 꺼짐',
                  onTap: () {},
                ),
                OneUIListTile(
                  leading: const Icon(Icons.sim_card_rounded),
                  title: 'SIM 관리자',
                  onTap: () {},
                ),
                OneUIListTile(
                  leading: const Icon(Icons.cell_tower_rounded),
                  title: '모바일 네트워크',
                  onTap: () {},
                ),
                OneUIListTile(
                  leading: const Icon(Icons.data_usage_rounded),
                  title: '데이터 사용',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ConnectivityPage(initialToDataUsage: true)));
                  },
                ),
                OneUIListTile(
                  leading: const Icon(Icons.wifi_tethering_rounded),
                  title: '모바일 핫스팟 및 테더링',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ConnectivityPage(initialToHotspot: true)));
                  },
                ),
                const SizedBox(height: 6),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('개발용', style: TextStyle(fontSize: 12, color: Colors.black54)),
                  ),
                ),
                OneUIListTile(
                  leading: const Icon(Icons.tune_rounded),
                  title: '사용량 데이터 편집',
                  subtitle: '데이터/핫스팟 사용량에 표시되는 앱과 수치를 변경합니다.',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const EditUsagePage()));
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
