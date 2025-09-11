import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DriverController extends GetxController {
  var selectedTab = 0.obs;
  var searchController = TextEditingController();

  final List<Map<String, dynamic>> allDrivers = [
    {
      "name": "Johan",
      "email": "johan@gmail.com",
      "number": "19130625025",
    },
    {
      "name": "Alice",
      "email": "alice@example.com",
      "number": "12345678901",
    },
    {
      "name": "Bob",
      "email": "bob@example.com",
      "number": "12345678902",
    },
    {
      "name": "Charlie",
      "email": "charlie@example.com",
      "number": "12345678903",
    },
    {
      "name": "Diana",
      "email": "diana@example.com",
      "number": "12345678904",
    },
    {
      "name": "Ethan",
      "email": "ethan@example.com",
      "number": "12345678905",
    },
    {
      "name": "Fiona",
      "email": "fiona@example.com",
      "number": "12345678906",
    },
    {
      "name": "George",
      "email": "george@example.com",
      "number": "12345678907",
    },
    {
      "name": "Hannah",
      "email": "hannah@example.com",
      "number": "12345678908",
    },
    {
      "name": "Ian",
      "email": "ian@example.com",
      "number": "12345678909",
    },
    {
      "name": "Julia",
      "email": "julia@example.com",
      "number": "12345678910",
    },
    {
      "name": "Kevin",
      "email": "kevin@example.com",
      "number": "12345678911",
    },
    {
      "name": "Laura",
      "email": "laura@example.com",
      "number": "12345678912",
    },
    {
      "name": "Mike",
      "email": "mike@example.com",
      "number": "12345678913",
    },
    {
      "name": "Nina",
      "email": "nina@example.com",
      "number": "12345678914",
    },
    {
      "name": "Oscar",
      "email": "oscar@example.com",
      "number": "12345678915",
    },
    {
      "name": "Paula",
      "email": "paula@example.com",
      "number": "12345678916",
    },
    {
      "name": "Quentin",
      "email": "quentin@example.com",
      "number": "12345678917",
    },
    {
      "name": "Rachel",
      "email": "rachel@example.com",
      "number": "12345678918",
    },
    {
      "name": "Steve",
      "email": "steve@example.com",
      "number": "12345678919",
    },
    {
      "name": "Tina",
      "email": "tina@example.com",
      "number": "12345678920",
    },
  ];

  var currentPage1 = 1.obs;
  final int itemsPerPage = 4;
  final int pagesPerGroup = 5;

  int get totalPages => (allDrivers.length / itemsPerPage).ceil();

  List get pagedUsers {
    int start = (currentPage1.value - 1) * itemsPerPage;
    int end = start + itemsPerPage;
    return allDrivers.sublist(start, end > allDrivers.length ? allDrivers.length : end);
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
}