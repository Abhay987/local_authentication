import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: ()async{
                LocalAuthentication auth = LocalAuthentication();


                // final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
                // final bool canAuthenticate = canAuthenticateWithBiometrics || await auth.isDeviceSupported();
                // debugPrint("\n\nThe first value is : $canAuthenticate\n\n");



                // try {
                //   final bool didAuthenticate = await auth.authenticate(
                //       localizedReason: 'Please authenticate to show account balance');
                //   // ···
                // } on PlatformException {
                //   // ...
                // }


                final bool didAuthenticate = await auth.authenticate(
                    localizedReason: 'Please authenticate to show account balance',
                    options: const AuthenticationOptions(biometricOnly: true));






                // try {
                //   final bool didAuthenticate = await auth.authenticate(
                //       localizedReason: 'Please authenticate to show account balance',
                //       options: const AuthenticationOptions(useErrorDialogs: false));
                //   // ···
                // } on PlatformException catch (e) {
                //   if (e.code == auth_error.notAvailable) {
                //     // Add handling of no hardware here.
                //   } else if (e.code == auth_error.notEnrolled) {
                //     // ...
                //   } else {
                //     // ...
                //   }
                // }


                // try {
                //   final bool didAuthenticate = await auth.authenticate(
                //       localizedReason: 'Please authenticate to show account balance',
                //       options: const AuthenticationOptions(useErrorDialogs: false));
                //   // ···
                // } on PlatformException catch (e) {
                //   if (e.code == auth_error.notEnrolled) {
                //     // Add handling of no hardware here.
                //   } else if (e.code == auth_error.lockedOut ||
                //       e.code == auth_error.permanentlyLockedOut) {
                //     // ...
                //   } else {
                //     // ...
                //   }
                // }




              }, child: const Text('Check')),
            ],
          ),
        ),
      ),
    );
  }
}

