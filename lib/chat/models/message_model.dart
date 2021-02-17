import 'package:my_autocare/chat/models/user_model.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;
  final bool active;

  Message({this.sender, this.time, this.text, this.isLiked, this.unread,this.active=false});
}

final User currentUser = User(
  id: 0,
  name: 'Current User',
  imageUrl: 'images/logo.png',
);

final User juga = User(
  id: 1,
  name: 'Juga',
  imageUrl: 'images/logos.png',
);

final User savi = User(id: 2, name: 'Savitha',
    imageUrl: 'images/logo.png');

final User bhavana = User(
  id: 3,
  name: 'Bhavana',
  imageUrl: 'images/logos.png',
);

final User sharu = User(
  id: 4,
  name: 'Sharanya',
  imageUrl: 'images/logo.png',
);
final User priyanka = User(
  id: 5,
  name: 'Priyanka',
  imageUrl: 'images/logos.png',
);

final User kantha = User(
  id: 6,
  name: 'Hema Kantharaj',
  imageUrl: 'images/logo.png',
);

final User sonali = User(
  id: 7,
  name: 'Sonali Raj',
  imageUrl: 'images/logos.png',
);

final User archu = User(
  id: 8,
  name: 'Archana',
  imageUrl: 'images/logo.png',
);

List<User> favorites = [
  juga,
  savi,
  bhavana,
  sonali,
  sharu,
  priyanka,
  archu,
  kantha
];

List<Message> chats = [
  Message(
    sender: juga,
    time: '5:30',
    text: 'Hey, how\'s it going? What did you do today ?',
    isLiked: false,
    unread: true,
    active: false
  ),
  Message(
    sender: savi,
    time: '9:12',
    text: 'Hey, how\'s it going? What did you do today ?',
    isLiked: true,
    unread: true,
      active: true
  ),
  Message(
    sender: sharu,
    time: '5:30',
    text: 'Hey, how\'s it going? What did you do today ?',
    isLiked: false,
    unread: false,
      active: false
  ),
  Message(
    sender: sonali,
    time: '11:00',
    text: 'Hey, how\'s it going? What did you do today ?',
    isLiked: false,
    unread: true,
      active: false
  ),
  Message(
    sender: priyanka,
    time: '2:00',
    text: 'Hey, how\'s it going? What did you do today ?',
    isLiked: true,
    unread: true,
      active: true
  ),
  Message(
    sender: kantha,
    time: '10:30',
    text: 'Hey, how\'s it going? What did you do today ?',
    isLiked: false,
    unread: true,
      active: false
  ),
  Message(
    sender: archu,
    time: 'Sun',
    text: 'Hey, how\'s it going? What did you do today ?',
    isLiked: false,
    unread: true,
      active: false
  ),
  Message(
    sender: bhavana,
    time: 'Fri',
    text: 'Hey, how\'s it going? What did you do today ?',
    isLiked: false,
    unread: true,
      active: false
  ),
];

List<Message> messages = [
  Message(
    sender: sonali,
    time: '10:30',
    text: 'Hey, What dng ??',
    isLiked: true,
    unread: false,
      active: true
  ),
  Message(
    sender: currentUser,
    time: '10:50',
    text: 'Nothing much u ??',
    isLiked: false,
    unread: true,
      active: true
  ),
  Message(
    sender: sonali,
    time: '11:00',
    text: 'oh.. \nwat are u upto now',
    isLiked: true,
    unread: false,
      active: true
  ),
  Message(
    sender: currentUser,
    time: '11:02',
    text:
        'Yeah.. getting bored so started coding\nPlanning to do a char app in flutter',
    isLiked: true,
    unread: false,
      active: false
  ),
  Message(
    sender: sonali,
    time: '11:03',
    text: 'Wow... thats really nice',
    isLiked: false,
    unread: false,
      active: true
  ),
  Message(
    sender: currentUser,
    time: '11:05',
    text: 'Yeah..',
    isLiked: false,
    unread: false,
      active: true
  ),
];
