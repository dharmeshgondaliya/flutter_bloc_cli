flutter_bloc_cli

A CLI tool for generating Flutter project structures and screens using BLoC architecture.

Installation
To use flutter_bloc_cli, you need to activate it globally using the following command:

dart pub global activate flutter_bloc_cli

Usage
Initializing Project Structure
Initialize the structure of an existing project using the init command:

```
bloc init
```

This command sets up the necessary directories and files for implementing BLoC architecture in your Flutter project.

Creating Screens
Generate screens (pages) for your application using the `create screen` command:

```
bloc create screen <screen_name>
```

Replace <screen_name> with the desired name of your screen. This command creates the necessary files for a new screen following the BLoC pattern.

Help
To display this help message, use the help command:

```
bloc help
```