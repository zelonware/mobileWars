this is...

# mobile wars!

testing and fooling aroud with mobile frameworks

CircleAvatar:

```dart
 CircleAvatar(
            radius: 50,
            backgroundColor: Colors.black,
            backgroundImage: NetworkImage('coolimage'),
          ),
```

Card:

```dart
 Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Icon(Icons.phone),
                iconColor: Colors.deepPurpleAccent,
                title: Text(
                  '+34 666 666 666',
                  style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 14,
                      fontFamily: 'SourceSansPro'),
                ),
              )),
```

SizedBox:

```dart
SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network('url'),
          ),
        )
```

Importar fuentes e imágenes:

```yaml
flutter:

  uses-material-design: true
    - images/image.jpeg

  fonts:
    - family: Pacifico
      fonts:
        - asset: fonts/Pacifico-Regular.ttf
    - family: SourceSansPro
      fonts:
        - asset: fonts/SourceSansPro-Regular.ttf
```

Número aleatorio entre 1 y 6:

```dart
Random().nextInt(6) + 1;
```

Estructura básica:

```dart
import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(PizzaCalculator());

class PizzaCalculator extends StatelessWidget {
  var backgroundColor = Color(0xFF090C22);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: backgroundColor,
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: backgroundColor
        )
      ),
      home: InputPage(),
    );
  }
}

```

```dart

```

```dart

```

```dart

```

## Useful links

### Flutter

- [Scaffold (widget)](https://api.flutter.dev/flutter/material/Scaffold-class.html)
- [AppBar (widget)](https://api.flutter.dev/flutter/material/AppBar-class.html)
- [Color palettes (MaterialDesign)](https://m2.material.io/design/color/the-color-system.html#tools-for-picking-colors)
- [Layout widgets](https://docs.flutter.dev/ui/widgets/layout)
- [Testing Flutter apps](https://docs.flutter.dev/testing)
- [An open list of apps built with Flutter](https://itsallwidgets.com/)
- [Flutter Layout Cheat Sheet](https://medium.com/flutter-community/flutter-layout-cheat-sheet-5363348d037e)
- [The official package repository for Dart and Flutter apps](https://pub.dev/)
- []()