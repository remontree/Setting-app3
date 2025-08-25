# Samsung-style Settings Clone (Flutter)

**프론트 전용 모사 앱** — 실제 시스템 설정을 변경하지 않으며, 다음 플로우를 그대로 재현합니다.

- 연결 → **데이터 사용** → **모바일 데이터 사용량**
- 연결 → **모바일 핫스팟 및 테더링** → **모바일 핫스팟** → **오늘 공유한 모바일 데이터** → (우측 상단 **그래프** 버튼) → **핫스팟 사용량**

최상단(홈) 페이지 맨 아래 **"사용량 데이터 편집"** 항목에서 앱/기기별 사용량 데이터를 수정하면 위 화면에 즉시 반영됩니다.

## GitHub Actions 로 APK 자동 빌드

이 저장소는 Flutter 프로젝트 전체 스캐폴드를 포함하지 않고, CI 가 다음 순서로 동작합니다:

1. `flutter create settings_clone` 으로 CI 내에서 안드로이드 프로젝트 스켈레톤 생성
2. 이 저장소의 `app_src/` 에 있는 `lib/`, `assets/`, `pubspec.yaml` 을 프로젝트에 복사
3. `flutter pub get` / `flutter_launcher_icons` 실행
4. `flutter build apk --release`
5. **Actions** 탭에서 `app-release-apk` 아티팩트로 APK 다운로드

로컬에서 바로 실행하고 싶다면:
```bash
flutter create settings_clone --platforms=android --project-name settings_clone --org com.example --overwrite
rsync -av app_src/lib/ settings_clone/lib/
rsync -av app_src/assets/ settings_clone/assets/
cp app_src/pubspec.yaml settings_clone/pubspec.yaml
cd settings_clone
flutter pub get
flutter pub run flutter_launcher_icons:main
flutter run
```

## 아이콘
- `assets/icons/app_icon.png`를 사용하여 런처 아이콘을 생성합니다. 삼성 설정앱 스타일의 파란 원 + 흰 기어 형태로 제작하였으며, 상표권을 존중하기 위해 완전 동일 복제는 지양합니다.

## 주의
- 실제 설정값을 수정하지 않습니다 (프론트 모사).
- 차트는 `fl_chart`를 사용합니다.
