import 'package:notedtogether_client/notedtogether_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';


/// Sets up a global client object that can be used to talk to the server from
/// anywhere in our app. The client is generated from your server code
/// and is set up to connect to a Serverpod running on a local server on
/// the default port. You will need to modify this to connect to staging or
/// production servers.
/// In a larger app, you may want to use the dependency injection of your choice instead of
/// using a global client object. This is just a simple example.
var client = Client('http://localhost:8080/',
  authenticationKeyManager: FlutterAuthenticationKeyManager(),
)..connectivityMonitor = FlutterConnectivityMonitor();

final sessionManager = SessionManager(caller: client.modules.auth);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sessionManager.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  void initState(){
    super.initState();

    sessionManager.addListener(() {
      setState(() {});
    });  

  }

  @override
  Widget build(BuildContext context) {
    return switch (sessionManager.isSignedIn){
      true => const NotesPage(),
      false => const SignInPage(),
    };
  }
}

class NotesPage extends StatelessWidget{
  const NotesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Center(child: Text('Welcome  ${sessionManager.signedInUser?.userName ?? 'Guest'}!')),
    );
  }
}

 class SignInPage extends StatelessWidget{
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('NoteTogether'),
      ),
      body: Center(
        child: SignInWithEmailButton(caller: client.modules.auth),
        
      ),
    );
  }
 }