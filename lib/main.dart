import 'package:flutter/material.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const NewScreen(),
    );
  }
}

class NewScreen extends StatelessWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("App")),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          ElevatedButton(
            onPressed: ()=> setupCall(email: "csonah@gmail.com", avatar: "https://images.unsplash.com/photo-1616790876844-97c0c6057364?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cG9ydHJhaXQlMjBnaXJsfGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
            child: const Text("Join Meeting as user 1"),
          ),
          ElevatedButton(
            onPressed: ()=> setupCall(email: "cynthia@gmail.com", avatar: "https://burst.shopifycdn.com/photos/model-in-gold-fashion.jpg?width=1200&format=pjpg&exif=1&iptc=1"),
            child: const Text("Join Meeting as user 2"),
          ),
        ],
      ),
    );
  }

  void setupCall({required String email, required String avatar}) async {
    var options = JitsiMeetingOptions(
      roomNameOrUrl: 'xyz-abc',
      userEmail: email,
      subject: "Random call",
      userAvatarUrl: avatar
    );
    await JitsiMeetWrapper.joinMeeting(options: options);
  }
}
