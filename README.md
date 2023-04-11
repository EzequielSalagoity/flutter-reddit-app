# Coding Challenge: flutter_reddit_app

## Functionalities

- Shows a list of posts from r/pics subrredit
- Shows post detail screen
- Checks internet connection before retrieve information
- Choose between 3 differents flavors: dev, staging and production

### Others
- Shows android and ios app icons (reddit logo)
- Shows splash screen when app is starting
- Shows empty screens

## Images

<img src="readme_images/splash.png" style=" width:200px ; height:400px">
<img src="readme_images/drawer.png" style=" width:200px ; height:400px">
<img src="readme_images/posts.png" style=" width:200px ; height:400px">
<img src="readme_images/expanded_post.png" style=" width:200px ; height:400px">
<img src="readme_images/no_internet.png" style=" width:200px ; height:400px">
<img src="readme_images/no_internet_2.png" style=" width:200px ; height:400px">
<img src="readme_images/no_internet_3.png" style=" width:200px ; height:400px">
<img src="readme_images/android_icon.png" style=" width:200px ; height:400px">
<img src="readme_images/ios_icon.png" style=" width:200px ; height:400px">

# How to run the app

To run the app according to a flavor:

- Dev: flutter run --flavor dev -t lib/main_dev.dart
- Staging: flutter run --flavor staging -t lib/main_staging.dart
- Production: flutter run --flavor production -t lib/main_production.dart
 
In VSCode, go to Run and Debug section, select a flavor and press Start debugging.