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

add 3 screenshots here  
![Alt text](https://github.com/AmrQ34327/To-Do-List-App/blob/1223a0d9ed0924ca7dd2771e1fd41c3606585709/screenshot22.png) 
![Alt text](https://github.com/AmrQ34327/To-Do-List-App/blob/1223a0d9ed0924ca7dd2771e1fd41c3606585709/screenshot44.png)
![Alt text](https://github.com/AmrQ34327/To-Do-List-App/blob/1223a0d9ed0924ca7dd2771e1fd41c3606585709/screenshot75.png)
![Alt text](https://github.com/AmrQ34327/To-Do-List-App/blob/1223a0d9ed0924ca7dd2771e1fd41c3606585709/screenshot32.png)

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



