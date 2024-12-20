# To-Do List Flutter App

A simple and modern to-do list application built with Flutter. This app allows you to easily manage your tasks, toggle between light and dark themes, and store tasks and settings locally using Hive for persistent storage. With a clean, intuitive interface, it helps you stay organized and keep track of your daily tasks.

## Features
- **Add Tasks**: Easily add new tasks to your to-do list.
- **Task Persistence**: Tasks are saved locally using the Hive database, meaning they persist even after you restart the app.
- **Dark and Light Themes**: Switch between light and dark themes to suit your preference.
- **Settings Menu**: Customize the app by toggling whether to close the keyboard after adding a task and whether to show a confirmation message after a task is added.
- **Task Management**: Mark tasks as completed and delete them when no longer needed.

## Screenshots
Here are a few screenshots of the app:


<img src="https://github.com/user-attachments/assets/d5eb559b-00b0-42b1-b2b7-915252d675c4" width="300" height="500" alt="screenshot" />
<img src="https://github.com/user-attachments/assets/0ae6a0a1-5d3f-48a5-9686-3ea7859daf34" width="300" height="500" alt="screenshot4" />
<img src="https://github.com/user-attachments/assets/e4ab42b1-76c5-47bb-be46-c6d3f0b7398c" width="300" height="500" alt="screenshot5" />
<img src="https://github.com/user-attachments/assets/c0052a17-43f4-41be-ab56-cad8bd2f0598" width="300" height="500" alt="screenshot6" />
<img src="https://github.com/user-attachments/assets/0df4032d-9f3f-409d-ae96-3a7c71a72ca2" width="300" height="500" alt="screenshot7" />
<img src="https://github.com/user-attachments/assets/55bb26ef-dcda-45ba-8d0f-78f026c6e3c7" width="300" height="500" alt="screenshot8" />





## Installation

Follow these steps to set up the project locally:

1. **Clone this repository**:
    ```bash
    git clone https://github.com/AmrQ34327/To-Do-List-App.git
    ```

2. **Navigate to the project directory**:
    ```bash
    cd To-Do-List-App
    ```

3. **Install the necessary dependencies**:
    ```bash
    flutter pub get
    ```

4. **Run the app**:
    ```bash
    flutter run
    ```

## How it Works

- The app uses the **Hive** database to store tasks and settings.
- **Hive Initialization**: The app initializes Hive in the `main()` function, opens boxes for tasks and settings, and registers the `Task` adapter for storing task data.
- The **`MyApp` class** manages the app's theme and navigation.
- The **`TaskWidget` class** is responsible for rendering each task, marking them as completed, and handling task deletion.

## Settings

The app provides the following settings in the settings menu:

1. **Close Keyboard after Adding Task**: Option to close the keyboard automatically after adding a task.
2. **Show Task Added Confirmation**: Option to show a confirmation message once a task is successfully added.
3. **Dark Theme**: Switch between light and dark themes based on your preference.

## App UI

The user interface (UI) is designed with the following elements:

- **TextFields** for entering tasks.
- **FloatingActionButton** to access the settings menu.
- **BottomNavigationBar** for easy navigation between the home screen and tasks page.

## License

All rights reserved. No part of this code may be reproduced, modified, or distributed without permission.



