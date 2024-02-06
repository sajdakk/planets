# Planets

This Flutter project is a demonstration of my coding skills, project organization and integration of REST API. It serves as a showcase of my abilities for the recruitment process.

## Project Overview

The project is a simple Flutter application that interacts with a RESTful API to retrieve and display data. It demonstrates basic `Read` operations and presents the fetched data in a user-friendly interface.

## Features

- **Data Retrieval**: Fetches data from a remote server via REST API endpoints.
- **Data Display**: Presents the fetched data in a visually appealing and organized manner.
- **Pagination**: Implements pagination for efficient handling of large data sets.
- **Search**: Allows users to search and filter data items.
- **Adding to Favorites**: Users can mark activities as favorites directly from the activity listing screen and activity details screen.

## Project Structure

The project follows a structured organization to maintain clarity and scalability:

- **lib/**: Contains all the Dart source code files.
  - **core/**: Houses core functionalities and utilities.
    - **service_locator.dart**: Implements a service locator pattern for dependency injection.
  - **extensions/**: Contains Dart extension methods for common types.
    - **date_time_extensions.dart**: Provides extensions for DateTime objects to more easily display dates.
  - **managers/**: Holds classes responsible for managing application-level logic.
  - **resources/**: Stores resources such as colors and text styles for consistent UI theming.
  - **models/**: Includes Dart classes for data models used within the application.
  - **screens/**: Houses the UI screens of the application.
  - **widgets/**: Contains reusable UI components/widgets used across the application.

## Dependencies

The project utilizes the following dependencies:

- **dio**: For making HTTP requests to the REST API.
- **flutter_bloc**: For implementing the BLoC (Business Logic Component) architecture.
- **equatable**: For simplifying equality comparisons in Dart, particularly useful for data models and state management.
- **get_it**: Provides a simple service locator pattern for dependency injection.
- **json_annotation**: Simplifies JSON serialization and deserialization in Dart by automatically generating code based on annotated Dart classes.
- **build_runner**: Facilitates code generation during the build process, particularly useful for generating serialization code for JSON parsing with json_serializable.
- **rxdart**: For handling asynchronous data streams.

## Getting Started

To run the project locally, follow these steps:

1. Clone the repository to your local machine.
2. Ensure you have Flutter SDK installed.
3. Navigate to the project directory.
4. Run `flutter pub get` to install dependencies.
5. Connect a device/emulator and run `flutter run` to launch the application.

## Contact
e-mail: anita.sajdak123@gmail.com
<br/> 
linkedin: https://www.linkedin.com/in/anita-sajdak-02a254243/
