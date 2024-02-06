import 'package:bloctutorialtemadinamico/cubit/theme_cubit.dart';
import 'package:bloctutorialtemadinamico/themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(BlocProvider(
    create: (context) => ThemeCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, String>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: getThemeData(state),
          home: const MyHomePage(title: 'HydratedBloc Tutorial'),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.save),
              ListTile(
                title: const Text(
                  'Azul',
                  textAlign: TextAlign.center,
                ),
                tileColor: Colors.blue,
                onTap: () {
                  context.read<ThemeCubit>().updateTheme('blue');
                },
              ),
              ListTile(
                title: const Text(
                  'Vermelho',
                  textAlign: TextAlign.center,
                ),
                tileColor: Colors.red,
                onTap: () {
                  context.read<ThemeCubit>().updateTheme('red');
                },
              ),
            ]),
      ),
    );
  }
}
