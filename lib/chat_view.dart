// import 'package:chat_view/data.dart';
// import 'package:chatview/chatview.dart';
// import 'package:flutter/material.dart';

// class ChatTestUI extends StatefulWidget {
//   const ChatTestUI({super.key});

//   @override
//   State<ChatTestUI> createState() => _ChatTestUIState();
// }

// class _ChatTestUIState extends State<ChatTestUI> {
//   bool isDarkTheme = false;
//   final currentUser = ChatUser(
//     id: '1',
//     name: 'Flutter',
//     profilePhoto: Data.profileImage,
//   );

//   final chatController = ChatController(
//     initialMessageList: messageList,
//     scrollController: ScrollController(),
//     chatUsers: [
//       ChatUser(
//         id: '2',
//         name: 'Simform',
//         profilePhoto: Data.profileImage,
//       ),
//       ChatUser(
//         id: '3',
//         name: 'Jhon',
//         profilePhoto: Data.profileImage,
//       ),
//       ChatUser(
//         id: '4',
//         name: 'Mike',
//         profilePhoto: Data.profileImage,
//       ),
//       ChatUser(
//         id: '5',
//         name: 'Rich',
//         profilePhoto: Data.profileImage,
//       ),
//     ],
//   );

//   void onSendTap(
//       String message, ReplyMessage replyMessage, Message messageType) {
//     final message = Message(
//       id: '3',
//       message: "How are you",
//       createdAt: DateTime.now(),
//       sendBy: currentUser.id,
//       replyMessage: replyMessage,
//       messageType: messageType.messageType,
//     );
//     chatController.addMessage(message);
//   }

//   @override
//   Widget build(BuildContext context) {
//     print(' image:${Data.profileImage}');
//     return Scaffold(
//       body: ChatView(
//         currentUser: currentUser,
//         chatController: chatController,
//         onSendTap: _onSendTap,
//         chatViewState: ChatViewState.hasMessages,
//         //chat view state configuration
//         chatViewStateConfig: ChatViewStateConfiguration(
//           loadingWidgetConfig: const ChatViewStateWidgetConfiguration(
//             loadingIndicatorColor: Colors.pink,
//           ),
//           onReloadButtonTap: () {},
//         ),
//         //Type indicating configuration

//         typeIndicatorConfig: TypeIndicatorConfiguration(
//           flashingCircleBrightColor: Colors.grey,
//           flashingCircleDarkColor: Colors.black,
//         ),
//         // chat app bar configuration
//         appBar: ChatViewAppBar(
//           elevation: 6,
//           profilePicture: Data.profileImage,
//           chatTitle: "Chat View",
//           chatTitleTextStyle: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 18,
//             letterSpacing: 0.25,
//           ),
//           userStatus: "online",
//           actions: [
//             IconButton(
//               onPressed: _onThemeIconTap,
//               icon: Icon(
//                 isDarkTheme
//                     ? Icons.brightness_4_outlined
//                     : Icons.dark_mode_outlined,
//                 color: Colors.blue,
//               ),
//             ),
//           ],
//         ),
//         featureActiveConfig: const FeatureActiveConfig(
//           enableSwipeToReply: true,
//           enableSwipeToSeeTime: false,
//         ),
// //Chat background configuration
//         chatBackgroundConfig: ChatBackgroundConfiguration(
//           messageTimeIconColor: Colors.pink,
//           messageTimeTextStyle: const TextStyle(color: Colors.yellow),
//           defaultGroupSeparatorConfig: DefaultGroupSeparatorConfiguration(
//             textStyle: const TextStyle(
//               color: Colors.purple,
//               fontSize: 17,
//             ),
//           ),
//           backgroundColor: Colors.white,
//         ),
//         // Send message configuration
//         sendMessageConfig: SendMessageConfiguration(
//           imagePickerIconsConfig: ImagePickerIconsConfiguration(
//             cameraIconColor: Colors.black,
//             galleryIconColor: Colors.black,
//           ),
//           replyMessageColor: Colors.grey,
//           defaultSendButtonColor: Colors.green,
//           replyDialogColor: Colors.blue,
//           replyTitleColor: Colors.black,
//           textFieldBackgroundColor: Colors.white,
//           closeIconColor: Colors.black,
//           textFieldConfig: TextFieldConfiguration(
//             textStyle: const TextStyle(color: Colors.cyan),
//           ),
//           micIconColor: Colors.greenAccent,
//           voiceRecordingConfiguration: const VoiceRecordingConfiguration(
//             backgroundColor: Colors.white,
//             recorderIconColor: Colors.blueGrey,
//             waveStyle: WaveStyle(
//               showMiddleLine: false,
//               waveColor: Colors.white,
//               extendWaveform: true,
//             ),
//           ),
//         ),
//         // Chat bubble configuration
//         chatBubbleConfig: ChatBubbleConfiguration(
//           outgoingChatBubbleConfig: ChatBubble(
//             linkPreviewConfig: LinkPreviewConfiguration(
//                 backgroundColor: Colors.white,
//                 bodyStyle: const TextStyle(fontSize: 16, color: Colors.black),
//                 titleStyle: const TextStyle(color: Colors.red, fontSize: 20)),
//             color: Colors.blue,
//             borderRadius: const BorderRadius.only(
//               topRight: Radius.circular(12),
//               topLeft: Radius.circular(12),
//               bottomLeft: Radius.circular(12),
//             ),
//           ),
//           inComingChatBubbleConfig: ChatBubble(
//             linkPreviewConfig: LinkPreviewConfiguration(
//               linkStyle: const TextStyle(
//                 color: Colors.brown,
//                 decoration: TextDecoration.underline,
//               ),
//               backgroundColor: Colors.indigo,
//               bodyStyle: const TextStyle(color: Colors.lightBlue, fontSize: 16),
//               titleStyle: const TextStyle(color: Colors.red, fontSize: 20),
//             ),
//             textStyle: const TextStyle(color: Colors.lime),
//             color: Colors.grey.shade200,
//             senderNameTextStyle: const TextStyle(color: Colors.orange),
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(12),
//               topRight: Radius.circular(12),
//               bottomRight: Radius.circular(12),
//             ),
//           ),
//         ),
//         // reply message configuration
//         replyPopupConfig: ReplyPopupConfiguration(
//           backgroundColor: Colors.white,
//           buttonTextStyle: const TextStyle(color: Colors.deepOrange),
//           topBorderColor: Colors.deepPurple,
//           onUnsendTap: (message) {
//             // message is 'Message' class instance
//             // Your code goes here
//           },
//           onReplyTap: (message) {
//             // message is 'Message' class instance
//             // Your code goes here
//           },
//           onReportTap: () {
//             // Your code goes here
//           },
//           onMoreTap: () {
//             // Your code goes here
//           },
//         ),
//         //Reaction configuration
//         reactionPopupConfig: ReactionPopupConfiguration(
//           backgroundColor: Colors.white,
//           userReactionCallback: (message, emoji) {
//             // Your code goes here
//           },
//           padding: const EdgeInsets.all(12),
//           shadow: BoxShadow(
//             color: isDarkTheme ? Colors.black54 : Colors.grey.shade400,
//             blurRadius: 20,
//           ),
//         ),
//         // Message Configuration
//         messageConfig: MessageConfiguration(
//           messageReactionConfig: MessageReactionConfiguration(
//             backgroundColor: Colors.white,
//             borderColor: Colors.black,
//             reactedUserCountTextStyle: const TextStyle(color: Colors.blue),
//             reactionCountTextStyle: const TextStyle(color: Colors.red),
//             reactionsBottomSheetConfig: ReactionsBottomSheetConfiguration(
//               backgroundColor: Colors.limeAccent,
//               reactedUserTextStyle: const TextStyle(color: Colors.blue),
//               reactionWidgetDecoration: BoxDecoration(
//                 color: Colors.indigoAccent,
//                 boxShadow: [
//                   BoxShadow(
//                     color: isDarkTheme ? Colors.black12 : Colors.grey.shade200,
//                     offset: const Offset(0, 20),
//                     blurRadius: 40,
//                   )
//                 ],
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//           ),
//           // image message configuration
//           imageMessageConfig: ImageMessageConfiguration(
//             margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
//             onTap: (p0) {
//               // Your code goes here
//             },
//             shareIconConfig: ShareIconConfiguration(
//               defaultIconBackgroundColor: Colors.black,
//               defaultIconColor: Colors.white,
//               onPressed: (p0) {
//                 // Your code goes here
//               },
//             ),
//           ),
//         ),
//         // Profile Circle configuration
//         profileCircleConfig: ProfileCircleConfiguration(
//           profileImageUrl: Data.profileImage,
//         ),

// //Replied message configuration

//         repliedMessageConfig: RepliedMessageConfiguration(
//           backgroundColor: Colors.blue,
//           verticalBarColor: Colors.black,
//           repliedMsgAutoScrollConfig: const RepliedMsgAutoScrollConfig(
//             enableHighlightRepliedMsg: true,
//             highlightColor: Colors.grey,
//             highlightScale: 1.1,
//           ),
//           textStyle: const TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 0.25,
//           ),
//           replyTitleTextStyle: const TextStyle(color: Colors.pinkAccent),
//         ),
//         swipeToReplyConfig: SwipeToReplyConfiguration(
//           replyIconColor: Colors.yellow,
//         ),

//         showTypingIndicator: true,

//         isLastPage: false,
//         // loadMoreData: chatController.loadMoreData,
//       ),
//     );
//   }

//   _onSendTap(
//     String message,
//     ReplyMessage replyMessage,
//     MessageType messageType,
//   ) {
//     final id = int.parse(messageList.last.id) + 1;
//     chatController.addMessage(
//       Message(
//         message: message,
//         createdAt: DateTime.now(),
//         sendBy: currentUser.id,
//         messageType: messageType,
//         replyMessage: replyMessage,
//       ),
//     );
//   }

//   void _onThemeIconTap() {
//     setState(() {
//       if (isDarkTheme) {
//         isDarkTheme = true;
//       } else {
//         isDarkTheme = false;
//       }
//     });
//   }
// }
