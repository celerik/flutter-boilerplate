<img src="https://www.celerik.com/wp-content/uploads/2019/12/celerik-1.svg" alt="Celerik"  width="300" height="80"/>

# Welcome to Argonovo!

---

## Getting Started

Argonovo is a camera app (Android/iOS) that captures images and videos with metadata, intending to keep footage not tampered with so that they adhere to legal requirements.

This project started as a fork of Celerik's Flutter boilerplate which includes:

- Internationalization
- Shared preferences storage
- Bloc pattern for state management
- Custom widgets

---

## Running the App

Make sure you have installed the flutter SDK (check here to install and setup: https://flutter.dev/docs/get-started/install):

- Run this command to check if flutter is installed in your machine: ``` flutter doctor ```
- To install the packages ``` flutter pub get ```

Before running the project, make sure you have generated required files using:

- ``` flutter packages pub run build_runner build --delete-conflicting-outputs ```

Besides, check you have an emulator running Android or iOS. Then, execute:

- ``` flutter run ```

After running these commands the app will be shown on the emulator.

---

## Test

To run project tests just run the following command:

``` flutter test ```

To check tests coverage in HTML format, install the next dependency:

``` brew install lcov ```

And then, execute the next command:

``` flutter test --coverage ```
``` genhtml coverage/lcov.info -o coverage/html ```

---

## Folder and File Structure

In the files tree presented below is mentioned the most important directories that belong to the project as well as a brief description when their file name is not self-explanatory.

```
└───argonovo
    ├───android # Android project files
    ├───assets # Static assets for the app (fonts & images)
    ├───build # Self-generated files
    ├───ios # iOS project files
    ├───lib # Flutter project files
    │   ├───business_logic
    │   │   ├───blocs
    │   │   ├───services    
    │   │   └───utils
    │   ├───config
    │   │   ├───colors
    │   │   ├───logger
    │   │   ├───network
    │   │   ├───remote
    │   │   ├───responsive_design
    │   │   └───theme
    │   └───I10n # String resources 
    │   └───pages 
    │       ├───camera
    │       ├───root
    │       └───utils
    │           ├───common_functions
    │           ├───common_widgets
    │           ├───providers
    │           └───transitions
    │───main.dart 
    └───test # Unit tests
```

---

## Pull Requests

In order to keep high-quality code in the project, the mobile team bear in mind the following:

* Analyzing your code using ``` dart analyze . ``` and if needed, fix your code according to the linter output.
* Filling out the Pull Request template, in where some fields are required when publishing a PR.
* Replying all the comments added in the PR by reviewers.

---

## IDE

To have a standard as a team, we decided to use Android Studio. Furthermore, dart code must be configured to wrap lines every 110 characters.

---

## Project Status: Active

