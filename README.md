## flutter_bloc_cli

A CLI tool for generating Flutter project structures and screens using BLoC architecture.

<br />

### Installation
To use flutter_bloc_cli, you need to activate it globally using the following command:

```
dart pub global activate flutter_bloc_cli
```

### Usage
#### BLoC
##### Initializing Project Structure
Initialize the structure of an existing project using the `init` command:

```
bloc init
```

This command sets up the necessary directories and files for implementing BLoC architecture in your Flutter project.

<br />

##### Creating Screens
Generate screens (pages) for your application using the `create screen` command:

```
bloc create screen <screen_name>
```

Replace `<screen_name>` with the desired name of your screen. This command creates the necessary files for a new screen following the BLoC pattern.

<br />

You can also generate multiple screens at once using the create screens command:

```
bloc create screens first_screen second_screen third_screen
```

This command will create the necessary files for each screen specified, following the BLoC pattern.

<br />

##### Help
To display this help message, use the help command:

```
bloc help
```

<br />

#### Cubit
##### Initializing Project Structure
Initialize the structure of an existing project using the `cubit init` command:

```
cubit init
```

This command sets up the necessary directories and files for implementing Cubit architecture in your Flutter project.

<br />

##### Creating Screens
Generate screens (pages) for your application using the `cubit create screen` command:

```
cubit create screen <screen_name>
```

Replace `<screen_name>` with the desired name of your screen. This command creates the necessary files for a new screen following the Cubit pattern.

<br />

You can also generate multiple screens at once using the create screens command:

```
cubit create screens first_screen second_screen third_screen
```

This command will create the necessary files for each screen specified, following the Cubit pattern.

<br />

##### Help
To display this help message, use the help command:

```
cubit help
```

---