# project_test5

A simple Flutter app to perform CRUD operations on posts using [JSONPlaceholder API](https://jsonplaceholder.typicode.com) with **GetX** state management.

## 🔧 Features

- Create, Read, Update, Delete Posts
- Form validation
- REST API integration using `http`
- GetX for state management

## 📦 Packages Used

- `get`: for state management and navigation
- `http`: to call REST APIs

## 📁 Main Files

- `main.dart`: Entry point
- `models/post_model.dart`: Post data model
- `controllers/post_controller.dart`: Manages state
- `services/api_service.dart`: Handles API logic
- `screens/home_screen.dart`: Shows post list
- `screens/form_screen.dart`: Create & update posts

## 🚀 Getting Started

1. Clone the repo & open in Android Studio
2. Run `flutter pub get`
3. Use `flutter run` to launch the app

## 🧪 API Endpoints (JSONPlaceholder)

- `GET /posts`: Fetch all posts
- `POST /posts`: Create post
- `PUT /posts/:id`: Update post
- `DELETE /posts/:id`: Delete post

> Note: JSONPlaceholder is a fake API; changes won't be permanent.

## 💡 Why GetX?

- Less boilerplate
- Easy state & route management
- Reactive UI updates

---

**Made with Flutter & GetX — For ICEL TECH Assignment**
