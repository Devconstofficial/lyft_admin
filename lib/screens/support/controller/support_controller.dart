import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SupportController extends GetxController {
  var searchController = TextEditingController();
  final List<Map<String, dynamic>> allChats = [
    {
      "customer": "Sophia",
      "driver": "Johan",
      "issue": "Ride Cancel",
      "date": "12.8.2025",
      "status": "Active",
    },
    {
      "customer": "Alice",
      "driver": "Bob",
      "issue": "Late Arrival",
      "date": "13.8.2025",
      "status": "Complete",
    },
    {
      "customer": "Mike",
      "driver": "Diana",
      "issue": "Payment Issue",
      "date": "13.8.2025",
      "status": "Active",
    },
    {
      "customer": "Laura",
      "driver": "Charlie",
      "issue": "Driver Behavior",
      "date": "14.8.2025",
      "status": "Active",
    },
    {
      "customer": "Oscar",
      "driver": "Fiona",
      "issue": "Wrong Route",
      "date": "14.8.2025",
      "status": "Complete",
    },
    {
      "customer": "Rachel",
      "driver": "Ethan",
      "issue": "App Crash",
      "date": "15.8.2025",
      "status": "Active",
    },
    {
      "customer": "Nina",
      "driver": "George",
      "issue": "Overcharged",
      "date": "15.8.2025",
      "status": "Complete",
    },
    {
      "customer": "Steve",
      "driver": "Hannah",
      "issue": "Driver Didn't Show",
      "date": "16.8.2025",
      "status": "Active",
    },
    {
      "customer": "Kevin",
      "driver": "Ian",
      "issue": "Incorrect Fare",
      "date": "16.8.2025",
      "status": "Complete",
    },
    {
      "customer": "Tina",
      "driver": "Julia",
      "issue": "Vehicle Condition",
      "date": "17.8.2025",
      "status": "Active",
    },
    {
      "customer": "Paula",
      "driver": "Mike",
      "issue": "No Seatbelt",
      "date": "17.8.2025",
      "status": "Complete",
    },
    {
      "customer": "Quentin",
      "driver": "Laura",
      "issue": "Language Barrier",
      "date": "18.8.2025",
      "status": "Active",
    },
    {
      "customer": "George",
      "driver": "Oscar",
      "issue": "App Glitch",
      "date": "18.8.2025",
      "status": "Complete",
    },
    {
      "customer": "Charlie",
      "driver": "Sophia",
      "issue": "Delayed Ride",
      "date": "19.8.2025",
      "status": "Active",
    },
    {
      "customer": "Ian",
      "driver": "Rachel",
      "issue": "Wrong Drop Location",
      "date": "19.8.2025",
      "status": "Complete",
    },
    {
      "customer": "Johan",
      "driver": "Tina",
      "issue": "Multiple Bookings",
      "date": "20.8.2025",
      "status": "Active",
    },
    {
      "customer": "Diana",
      "driver": "Kevin",
      "issue": "Driver Not Wearing Mask",
      "date": "20.8.2025",
      "status": "Complete",
    },
    {
      "customer": "Alice",
      "driver": "Quentin",
      "issue": "Driver Used Phone",
      "date": "21.8.2025",
      "status": "Active",
    },
    {
      "customer": "Mike",
      "driver": "Paula",
      "issue": "App Not Updating",
      "date": "21.8.2025",
      "status": "Complete",
    },
    {
      "customer": "Fiona",
      "driver": "Steve",
      "issue": "No OTP Asked",
      "date": "22.8.2025",
      "status": "Active",
    },
  ];


  var currentPage1 = 1.obs;
  final int itemsPerPage = 4;
  final int pagesPerGroup = 5;

  int get totalPages => (allChats.length / itemsPerPage).ceil();

  List get pagedUsers {
    int start = (currentPage1.value - 1) * itemsPerPage;
    int end = start + itemsPerPage;
    return allChats.sublist(start, end > allChats.length ? allChats.length : end);
  }

  int get currentGroup => ((currentPage1.value - 1) / pagesPerGroup).floor();

  List<int> get visiblePageNumbers {
    int startPage = currentGroup * pagesPerGroup + 1;
    int endPage = (startPage + pagesPerGroup - 1).clamp(1, totalPages);
    return List.generate(endPage - startPage + 1, (index) => startPage + index);
  }

  void goToPage(int page) {
    if (page >= 1 && page <= totalPages) currentPage1.value = page;
  }

  void goToNextPage() {
    if (currentPage1.value < totalPages) {
      currentPage1.value++;
    }
  }

  void goToPreviousPage() {
    if (currentPage1.value > 1) {
      currentPage1.value--;
    }
  }

  final ScrollController scrollController = ScrollController();

  RxList<ChatMessage> messages = <ChatMessage>[
    ChatMessage(text: "Hello, I want to make enquiries about your product", isUser: false, time: DateTime(2025, 8, 12, 0, 55)),
    ChatMessage(text: "Hello Johan, thank you for reaching out", isUser: true, time: DateTime(2025, 8, 12, 0, 57)),
    ChatMessage(text: "What do you need to know?", isUser: true, time: DateTime(2025, 8, 12, 0, 57)),
    ChatMessage(text: "I want to know if the price is negotiable, I need about 2 Units", isUser: false, time: DateTime.now()),
  ].obs;

  RxString currentMessage = ''.obs;

  void sendMessage() {
    final text = currentMessage.trim();
    if (text.isNotEmpty) {
      messages.add(ChatMessage(text: text, isUser: true, time: DateTime.now()));
      currentMessage.value = '';
    }
  }

}

class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime time;

  ChatMessage({
    required this.text,
    required this.isUser,
    required this.time,
  });
}