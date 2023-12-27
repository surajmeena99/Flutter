import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("URL Launcher App"),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                launchUrl(
                  Uri.parse("https://rinzzo.com"),
                  // mode: LaunchMode.inAppWebView,
                  mode: LaunchMode.inAppBrowserView,
                );
              },
              child: Text("Subscribe"),
              // onPressed: () {
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     SnackBar(
              //       content: const Text("Subscribe: Papaya Coders"),
              //       action: SnackBarAction(
              //         label: "Subscribe",
              //         onPressed: () {
              //           launchUrl(
              //             Uri.parse("https://rinzzo.com"),
              //           );
              //         },
              //       ),
              //     ),
              //   );
              // },
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              child: Text("Call me"),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("Contact: Suraj Meena"),
                    action: SnackBarAction(
                      label: "Call me",
                      onPressed: () {
                        launchUrl(
                          Uri(scheme: 'tel', path: "7096996808"),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              child: Text("Sms me"),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("Contact: Suraj Meena"),
                    action: SnackBarAction(
                      label: "Message me",
                      onPressed: () {
                        launchUrl(
                          Uri(scheme: 'sms', path: "7096996808"),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              child: Text("Email me"),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("Email: Suraj Meena"),
                    action: SnackBarAction(
                      label: "Email",
                      onPressed: () {
                        launchUrl(
                          Uri(scheme: 'mailto',path: 'suraj1181999@gmail.com'),
                          // Uri.parse("mailto:suraj1181999@gmail.com"),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
