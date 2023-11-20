# faker-person-api

## Introduction

This application is made by Flutter. It helps retrieve persons from FakeAPI then displays them in UI.

## Prerequisite

To run the app, you need to setup Flutter in your machine. Please refer to [flutter.dev](https://docs.flutter.dev/get-started/install) for full setup

## Development

I use Flutter version 3.10.6 and Android studio to develop. You shouldn't see any warning in Dart Analysis when using this Flutter version

## Run the app

This app can be run on Android, iOS and Web

- **Install package dependencies**

  ```shell
  flutter pub get
  ```
  
Then you can run

  ```shell
  flutter run
  ```

and choose device you want to run.

You can also run test in this repo

  ```shell
  flutter test
  ```

it should show `All tests passed!` after running.

## Miscellaneous information

1/ The image link in faker api doesn't exist so the app cannot render image. App will render image when the link is correct.

2/ On bigger screen on mobile, first fetch with 10 items may not occupy the whole screen so I scroll down 1px on mobile so it can fetch next data. If I don't do that, users may confuse and not know they can keep scrolling for more data.

## Demo

You can find the demo for all platforms [here](https://drive.google.com/drive/folders/1wWSOzIBPO9ceQ7hyQD2C2tT4m_a_Uadc?usp=sharing)

## About me

I'm Hoa Hoang, a software engineer based in HCMC, Vietnam. I love to work and always seek for new challenge.
You can find more details about me [here](https://flutter-portfolio-e116e.web.app/)