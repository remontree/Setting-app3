
import 'package:flutter/material.dart';
import '../widgets/oneui_list_tile.dart';
import 'mobile_hotspot_page.dart';

class TetheringPage extends StatelessWidget {
  const TetheringPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('모바일 핫스팟 및 테더링')),
      body: ListView(
        children: [
          const SizedBox(height: 8),
          Card(
            child: Column(
              children: [
                OneUIListTile(
                  title: '모바일 핫스팟',
                  subtitle: '오늘 사용량, 핫스팟 이름, 암호 등을 관리합니다',
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MobileHotspotPage())),
                ),
                OneUIListTile(
                  title: 'USB 테더링',
                  subtitle: '연결된 기기로 데이터 공유',
                  onTap: () {},
                ),
                OneUIListTile(
                  title: '블루투스 테더링',
                  subtitle: '블루투스로 데이터 공유',
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
