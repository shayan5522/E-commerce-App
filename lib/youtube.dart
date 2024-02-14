// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('YouTube Video Player'),
//         ),
//         body: Center(
//           child: YoutubePlayer(
//             controller: YoutubePlayerController(
//               initialVideoId: 'YOUR_YOUTUBE_VIDEO_ID',
//               flags: YoutubePlayerFlags(
//                 autoPlay: true,
//                 mute: false,
//               ),
//             ),
//             showVideoProgressIndicator: true,
//             progressIndicatorColor: Colors.blueAccent,
//             progressColors: ProgressBarColors(
//               playedColor: Colors.blue,
//               handleColor: Colors.blueAccent,
//             ),
//             onPlayerInitialized: (controller) {
//               // Called when the player is initialized
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
