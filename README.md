# Bodymood

디프만 10기 5조, 바디무드 프로젝트

애플 앱스토어: https://apps.apple.com/kr/app/bodymood/id1588818384
구글 플레이스토어: https://play.google.com/store/apps/details?id=com.depromeet.bodymood

# 이미지 에셋 관리

## Pre-requisite

`spider` 패키지를 통해 이미지 에셋을 관리한다.

```bash
$> pub global activate spider 
# or
$> flutter pub global activate spide
```

## 이미지 설정

`pubspec.yaml` 과 `spider.yaml` 에 원하는 에셋 경로 설정 후, 
`spider build` 를 통해 에셋 코드를 생성 후 사용. 자세한 내용은
[spider 설명](https://pub.dev/packages/spider) 참조

꾸준히 이미지 추가를 원하는 경우 `spider build --watch` 를 통해
자동 빌드 가능

# 사용한 특수 목적 패키지

기본적으로 널리 사용되는 패키지들에 대한 설명은 제외함

- `freezed`: enum과 const 를 대신해서 사용
- `riverpod`, `flutter_riverpod`: 상태관리 및 상태 전달을 위해 사용

## 카메라/파일 관련 고려중인 packages

- cameraawesome: 다양한 기능이 추가된 카메라
- image_downloader: 이미지 다운로드를 쉽게 함 
- photo_manager: 이미지 파일의 path 만 가져옴. gui 는 자유롭게 구현
- flutter_better_camera: 다양한 기능이 추가된 카메라
# 시범 아키텍처

Uber의 `Ribs` 아키텍쳐와 유사하게, 
`state`에 반응하는 `Interactor`, `state`를 전달하고 관리하는 `riverpod`,
순수히 UI를 담당하는 `gui/widget`, 
네비게이션만 담당하는 특수 목적 Interactor인 `RouteInteractor` 를 분리하여
사용하려 함. 

아직 `Interactor`가 정확하게 적용되지 않은 부분들이 있고, 
새로운 클래스를 만들어서 사용하는 것이 아니기 때문에, 코드나 폴더 구조가
지저분함. 추후 리팩터링을 거쳐서 수정해야 함. 

## 향후 아키텍쳐

완전 역할 분리형 아키텍쳐의 사용이 제대로 정립된 후, 
프레임워크 형태로 편히 구현하고 사용할 수 있도록 패키지로 변경. 
위젯이나 다른 파트의 의존성 관리를 위한 개별 컴포넌트도 구현 예정.

## WISeR

`Widget`, `Interactor`, `State`, `Entity`, `Router` 아키텍쳐 

