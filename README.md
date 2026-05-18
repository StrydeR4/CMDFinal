# TripMate

TripMate is a modern Flutter Web travel planning application built as a university final project.  
The application allows users to explore destinations, save favorites, book trips, and manage travel plans using a responsive interface and real API integration.

Name: Ruslan Dussenbayev

Group: SE-2434
---

# Features

## Authentication
- Firebase Authentication
- Login / Registration system
- User session management
- Logout functionality

## Travel Destinations
- Real city search
- Dynamic city creation
- Unsplash API integration
- Real destination images
- Destination details dialog

## Booking System
- Book travel destinations
- Dynamic bookings page
- Booking confirmation system
- Saved booked trips

## Favorites
- Add destinations to favorites
- Favorites page
- Dynamic favorite management

## Search
- Real-time destination filtering
- Responsive search field

## UI/UX
- Responsive web layout
- Modern dark UI
- GridView-based design
- Adaptive destination cards
- Material 3 design

---

# Technologies Used

- Flutter Web
- Dart
- Firebase Authentication
- Unsplash API
- HTTP package
- Material 3

---

# Project Structure

```text
lib/
├── data/
├── models/
├── screens/
├── services/
├── widgets/
└── main.dart
```

---

# API Integration

## Unsplash API

The project uses Unsplash API to fetch real travel destination images dynamically.

Developer portal:

https://unsplash.com/developers

---

# Firebase Setup

## 1. Create Firebase Project

Open Firebase Console:

https://console.firebase.google.com

Create a new project.

---

## 2. Enable Authentication

Go to:

Build → Authentication → Sign-in method

Enable:
- Email/Password

---

## 3. Configure FlutterFire

Install FlutterFire CLI:

dart pub global activate flutterfire_cli
```

Run:

flutterfire configure
```

Select:
- Web platform
- Your Firebase project

This generates:

lib/firebase_options.dart
```

---

# Unsplash API Setup

Open:

lib/services/unsplash_service.dart
```

Replace:

YOUR_ACCESS_KEY
```

with your Unsplash API key.

---

# Installation

## Clone Repository

git clone https://github.com/yourusername/tripmate.git
```

## Open Project

cd tripmate
```

## Install Dependencies

flutter pub get
```

## Run Application

flutter run -d chrome
```

---

# Requirements

- Flutter SDK
- Chrome Browser
- Firebase Project
- Unsplash API Key

---

# Screens

- Login Screen
- Home Screen
- Favorites Screen
- Bookings Screen
- Settings Screen

---

# Main Functionalities

| Functionality | Status |
|---|---|
| Firebase Authentication | Completed |
| Real API Integration | Completed |
| Dynamic City Search | Completed |
| Favorites System | Completed |
| Booking System | Completed |
| Responsive UI | Completed |
| Unsplash Images | Completed |
| Flutter Web Support | Completed |
