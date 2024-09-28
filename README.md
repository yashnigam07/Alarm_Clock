
# ⏰ Flutter Alarm Clock

A sleek and modern **Flutter-based Alarm Clock** app with customizable time settings, sound notifications, and a clean UI. 

## ✨ Features

- **Set Custom Alarms**: Pick a time, and the app will alert you when it's time!
- **Sound Notifications**: Plays a sound when the alarm triggers.
- **Modern UI**: Minimalist design with clean buttons and smooth user experience.

## 📱 Screenshots

| Main Screen             | Alarm Triggered          |
|-------------------------|--------------------------|
| ![Main Screen](path/to/screenshot1.png) | ![Alarm](path/to/screenshot2.png) |

## 🚀 Getting Started

1. **Clone the repo**:
   ```bash
   git clone https://github.com/your-username/flutter-alarm-clock.git
   ```
2. **Navigate into the project directory**:
   ```bash
   cd flutter-alarm-clock
   ```
3. **Install dependencies**:
   ```bash
   flutter pub get
   ```
4. **Run the app**:
   ```bash
   flutter run
   ```

## 🔊 Adding Alarm Sound

Make sure to add an `alarm.mp3` sound file under the `assets/sounds` folder:
1. Create the folder: `assets/sounds/`
2. Update `pubspec.yaml`:
   ```yaml
   flutter:
     assets:
       - assets/sounds/alarm.mp3
   ```
