Flutter News App:
A clean and responsive news application built using Flutter, allowing users to view the latest headlines, read detailed news articles via WebView, and manage bookmarks. This app is built with best practices in mind including modular architecture and state management using `Provider`.

 Screenshots:
Login Page:
![Screenshot 2025-06-10 224553](https://github.com/user-attachments/assets/37a1562d-5cb9-4216-a361-2b894a73423c)
News Feed Page: 
![image](https://github.com/user-attachments/assets/8e42949c-7c82-40f4-85e2-bd5101dff8ae)
Bookmarks Page:
![bookmark](https://github.com/user-attachments/assets/de2c55dc-e164-4e29-9ff2-b05a900e6127)
Webview:
![webview](https://github.com/user-attachments/assets/e161564b-90c0-4fea-abb3-517d754fdf60)

APK Download:


Setup Instructions:-
Follow these steps to run the project locally:

1.Clone the repository:
  https://github.com/Shreya-Telange/News_App.git
  cd News_App
2.Enable Flutter Web (if targeting web):
   flutter config --enable-web
3.Get all dependencies:
    flutter pub get
 4.Run the project:
    flutter run
 
 Architecture Choices:-
The app follows a modular and scalable architecture, keeping UI, business logic, and data handling separate.

Folder Structure:-

lib/
├── models/             Data models (e.g., NewsArticle)
├── pages/              UI pages (Login, Home, Bookmarks, News)
├── providers/          App-wide state management (auth, news, bookmarks)
├── services/           API calls, shared preferences
├── utils/              Utility functions (e.g., date formatting)
├── widgets/            Reusable custom widgets
└── main.dart           App entry point

Key Design Decisions
-Provider is used for efficient and clean state management.
-Shared Preferences ensure persistent login and bookmark storage.
-WebView enables users to read full articles inside the app.
-Modular organization for scalability and code reusability.
-Easy to add features like category filters, search, or theme switching in future.

Third-Party Packages Used:-
Package	Purpose:
-http	To make network requests and fetch news from the API
-provider	Manage state across the app efficiently
-shared_preferences	Store login status and bookmarks locally
-webview_flutter	Show full news articles using a WebView inside the app
-intl	Format dates to make them user-friendly

 Features:-
- Login & logout flow
- Latest headlines from a news API
- Full article view inside WebView
- Bookmark/unbookmark articles
- Persistent login and bookmarks using local storage
- Modular, clean architecture


