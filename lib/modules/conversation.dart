// ignore_for_file: unused_import, file_names, unnecessary_new

import 'package:flutter_dictionary_app/conversations/conversations-list.dart';

class Conversation {
  int id;
  String content;
  String name;
  String image;
  String audio;
  Conversation(
      {required this.id,
      required this.name,
      required this.content,
      required this.image,
      required this.audio});
  static List<Conversation> init() {
    List<Conversation> dataConvers = [
      Conversation(
          id: 1,
          name: "Introducing yourself",
          content:
              "Quang - Please, let me introduce myself. I`m Quang.\nJane I`m Jane. Great to meet you.\nQuang - Are you British?\nJane- No, I am American. I`m a Yank.\nQuang- Do you like Hanoi?\nJane- Yes. It`s cool.\nQuang- Are you here on vacation?\nJane- No. I`m not. I`m here working.\nQuang - Have you been to Vietnam before?\nJane-No. It`s my first time to come here. I`m a newbie.\nQuang - How long will you stay here?\nJane-A week.\nQuang - Can you speak Vietnamese?\nJane- Oh, a little.",
          image: "assets/conversations/hoi-thoai-tieng-anh.jpg",
          audio: "Vocabulary0.mp3"),
      Conversation(
        id: 2,
        name: "Formal Greetings",
        content:
            "JAMES: Good morning, Professor Austin, how are you doing?\nPROFESSOR AUSTIN: Good morning, James. I am doing well. And you?\nJAMES: I’m great, thank you. This is my friend Emma. She\nis thinking about applying to this college. She has a\nfew questions. Would you mind telling us about the\nprocess, please?\nPROFESSOR AUSTIN: Hello, Emma! It’s a pleasure to meet you. I’m more\nthan happy to speak with you. Please stop by my office\nnext week.\nEMMA: It’s a pleasure to meet you, professor. Thank you so\nmuch for helping us.\nPROFESSOR AUSTIN: Don’t mention it. Hopefully, I will be able to answer\nyour questions!",
        image: "assets/conversations/1-1.png",
        audio: "1-1.mp3",
      ),
      Conversation(
        id: 3,
        name: " Informal Greetings and Farewells",
        content:
            "JANE: Hi, Helen! How’s it going?\nHELEN: Fine, thanks — and you?\nJANE: Just fine. Where are you off to?\nHELEN: To the library. I’ve got a history exam next week\nand need to start studying. Ugh.\nJANE: Oh, no. Well, I’ll see you later then. Good luck!\nHELEN: Thanks. See you later.",
        image: "assets/conversations/1-2.png",
        audio: "1-2.mp3",
      ),
      Conversation(
        id: 4,
        name: "What Time Is It?",
        content:
            "NATASHA: What time is it? We’re going to be late!\nTONY: It’s a quarter after seven. We’re on time. Don’t panic.\nNATASHA: But I thought we had to be at the restaurant by 7:30 for\nthe surprise party. We’ll never make it there with all this\nevening traffic.\nTONY: Sure we will. Rush hour is almost over. Anyway, the party\nstarts at 8:00. But I do need help with directions. Can you\ncall the restaurant and ask them where we park our car?",
        image: "assets/conversations/1-5.png",
        audio: "1-5.mp3",
      ),
      Conversation(
        id: 5,
        name: "A Telephone Call",
        content:
            "JOHN: Hi, Alice, it’s John. How are you?\nALICE: Oh, hi, John! I was just thinking about you.\nJOHN: That’s nice. I was wondering if you’d like to go to a\nmovie tonight.\nALICE: Sure, I’d love to! What’s playing?\nJOHN: I was thinking about that new comedy Lights Out. What do\nyou think?\nALICE: Sounds great!\nJOHN: OK, I’ll pick you up around 7:30. The movie starts at 8:00.\nALICE: See you then. Bye!",
        image: "assets/conversations/1-6.png",
        audio: "1-6.mp3",
      ),
      Conversation(
        id: 6,
        name: "Can You Say That Again?",
        content:
            "LUKE: Hello? Hi, Stephanie, how are things at the office?\nSTEPHANIE: Hi, Luke! How are you? Can you please stop and pick up\nextra paper for the computer printer?\nLUKE: What did you say? Can you repeat that, please? Did you\nsay to pick up ink for the printer? Sorry, the phone is\ncutting out.\nSTEPHANIE: Can you hear me now? No, I need more computer paper.\nListen, I’ll text you exactly what I need. Thanks, Luke.\nTalk to you later.\nLUKE: Thanks, Stephanie. Sorry, my phone has really bad\nreception here.",
        image: "assets/conversations/1-7.png",
        audio: "1-7.mp3",
      ),
    ];

    return dataConvers;
  }

  factory Conversation.fromJson(Map<String, dynamic> res) {
    return new Conversation(
      id: res['id'],
      name: res['name'],
      content: res['content'],
      image: res['image'],
      audio: res['audio'],
    );
  }
}
