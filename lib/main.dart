import 'index.dart';

Future<void> main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}

//list of providers
List<SingleChildWidget> providers = [
  ChangeNotifierProvider<PostDataProvider>(create: (_) => PostDataProvider()),
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProviderScreen(),
    );
  }
}
