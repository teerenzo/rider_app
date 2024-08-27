# rider_app



## Features

### 1. Authentication

- **Register**: Users can sign up using their email, phone number, gender, and name. The information is stored securely using `SharedPreferences`.
- **Login**: Users can log in with their registered email and password. The app authenticates by verifying the credentials against the stored data.
- **State Management**: The authentication flow is managed using `Riverpod` to handle state changes like loading and error messages.

### 2. Complaint Management

- **Create Complaint**: Users can create a complaint by providing a title and description.
- **Edit Complaint**: Users can modify existing complaints.
- **Delete Complaint**: Users can remove complaints from the list.
- **Storage**: Complaints are managed using a hash in `Session Storage`.

## Getting Started

### Prerequisites

- Flutter SDK
- Dart
- An IDE like VSCode or Android Studio
- A device or emulator to run the Flutter app

### Steps to Run the Application

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/teerenzo/rider_app.git
   cd rider_app
2. **Install Dependencies**:
   ```bash
   flutter pub get
2. **Run app**:
   ```bash
   flutter run




