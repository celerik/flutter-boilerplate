## Getting Started

This project is a starting point for a Flutter application.

This boilerplate includes:

- Internationalization
- Auth with cognito
- Shared preferences storage
- Bloc pattern for state management
- Custom widgets

## Running the app

Make sure you have installed the flutter sdk (check here to install and setup: https://flutter.dev/docs/get-started/install):

- Run this command to check if flutter is installed in you machine: ``` flutter doctor ```
- To install the packages ``` flutter pub get ```

After running the project make sure you have emulator on (iOS or Android):

- To run the project ``` flutter run ```

After running these commands the app will be shown on the emulator.

Note: The project is also configured to run on windows, web and macOS, however additional configuration is required.

## Test

To run the test just run the following command:

``` flutter test ```

## Splash screen

To add a splash screen follow the next steps:

- Add your custom image inside the assets/images folder.
- Replace the image route inside the pubspec.yaml in the flutter_native_splash statement.
- In the flutter_native_splash you can change a lot of properties (see: https://pub.dev/packages/flutter_native_splash).
- Run ``` flutter pub get ```.
- Run ``` flutter pub run flutter_native_splash:create ``` to create the assets and the configuration.
for the splash screen for the different options (Android, iOS, etc).
- Finally run your application and you will see the splash screen created.

## Additional files

### Cognito credentials

This project uses cognito to do the authentication part. To use this service add
a file called ```cognito_credentials.dart``` in the lib folder, then inside the file copy and
paste this configuration: 

```dart
const poolId = "POOLID";
const appId = "APPID";
```

Change the POOLI and APPID variables with your specific user pool configuration. Finally, 
run ```flutter pug get```, and then your project should be working on your device or emulator.

### Enviroment File

Create file in path directory ".env", example file with name ".env_example"


## Support

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
