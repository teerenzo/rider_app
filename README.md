# rider_app

This is the app containing UI for riders 

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

### Screenshots 
|  ![Screenshot_1724749365](https://github.com/user-attachments/assets/1865e022-d0d3-48a0-ad40-5464dc62c924) | ![Screenshot_1724749370](https://github.com/user-attachments/assets/0c01e9fd-5ed9-473d-97c2-3b770cc064c0) | 
| ------ | ------ |
|  ![Screenshot_1724749373](https://github.com/user-attachments/assets/578edf07-bc4b-42e4-9d83-0194098892b8) | ![Screenshot_1724749379](https://github.com/user-attachments/assets/b16bf715-b2d2-4518-8a1c-f3ed39232135) | 
| ------ | ------ |
|  ![Screenshot_1724749381](https://github.com/user-attachments/assets/d9d58d0b-1bb2-4086-8eb8-a75d9bb86d58) | ![Screenshot_1724749302](https://github.com/user-attachments/assets/2eb36a82-073f-4f98-9058-bcc12e6476d4) | 
| ------ | ------ |
|  ![Screenshot_1724749308](https://github.com/user-attachments/assets/571ed0b5-c93a-4187-a405-5d61d3079ba5) | ![Screenshot_1724749310](https://github.com/user-attachments/assets/d1194d1e-79c9-4a0a-b7a6-a88eafdafd7b) | 
| ------ | ------ |
|  ![Screenshot_1724749322](https://github.com/user-attachments/assets/c2a31e47-78c8-4c59-8042-9f2bc05268a3) | ![Screenshot_1724749326](https://github.com/user-attachments/assets/ead11102-123c-4bf2-aade-974ff90ec012) | 
| ------ | ------ |
|  ![Screenshot_1724749329](https://github.com/user-attachments/assets/53a8808e-6eb9-4b37-9d40-6a9c7d7fe47b) | ![Screenshot_1724749341](https://github.com/user-attachments/assets/2502da23-14fa-474f-a816-8c9f2da35ffa) | 
| ------ | ------ |

