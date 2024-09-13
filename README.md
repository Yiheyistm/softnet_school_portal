# softnet_school_portal

A new Flutter project.

## Folder Structure

The `lib` folder contains the main source code for the Flutter application. Below is an overview of the folder structure and the purpose of each directory and file.

### lib/

- **main.dart**: The entry point of the Flutter application.

#### data/
Contains data-related classes and files, such as models, repositories, and data providers.

- **models/**: Contains data models.
  - eg. `user.dart`: Defines the `User` model.
- **provider/**: Contains data providers and repositories.
  - `repository/`
    - eg. `user_repository.dart`: Defines the `UserRepository` class for CRUD operations on user data.

#### feature/
Contains the UI screens of the application.

- eg. **user_profile_view.dart**: Defines the user profile screen where users can view and update their profile information.

#### widgets/
Contains reusable UI components.

- eg. **custom_rounded_button.dart**: Defines a custom rounded button widget used throughout the application.

#### routes/
  - Defines the routes used in navigation purpose.

#### locator/
 - For Dependancy injection

#### utils/
Contains utility classes and functions.

- **app_string.dart**: Defines the string constants used in the application.

#### theme/
- **app_color.dart**: Defines the color palette used in the application.
- **app_theme.dart**: Defines the theme used in the application.

## Usage

To run the application, use the following command:

```sh
flutter pub get
flutter run