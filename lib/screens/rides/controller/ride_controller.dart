import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RideController extends GetxController {
  var searchController = TextEditingController();
  final List<Map<String, dynamic>> allRiders = [
    {
      "id": "#3290137450",
      "customer": "Sophia",
      "driver": "Johan",
      "fare": "100",
      "status": "Pending",
    },
    {
      "id": "#3290137451",
      "customer": "Alice",
      "driver": "Bob",
      "fare": "120",
      "status": "Completed",
    },
    {
      "id": "#3290137452",
      "customer": "Mike",
      "driver": "Diana",
      "fare": "95",
      "status": "Canceled",
    },
    {
      "id": "#3290137453",
      "customer": "Laura",
      "driver": "Charlie",
      "fare": "150",
      "status": "Pending",
    },
    {
      "id": "#3290137454",
      "customer": "Oscar",
      "driver": "Fiona",
      "fare": "180",
      "status": "Completed",
    },
    {
      "id": "#3290137455",
      "customer": "Rachel",
      "driver": "Ethan",
      "fare": "70",
      "status": "Canceled",
    },
    {
      "id": "#3290137456",
      "customer": "Nina",
      "driver": "George",
      "fare": "110",
      "status": "Pending",
    },
    {
      "id": "#3290137457",
      "customer": "Steve",
      "driver": "Hannah",
      "fare": "130",
      "status": "Completed",
    },
    {
      "id": "#3290137458",
      "customer": "Kevin",
      "driver": "Ian",
      "fare": "90",
      "status": "Pending",
    },
    {
      "id": "#3290137459",
      "customer": "Tina",
      "driver": "Julia",
      "fare": "160",
      "status": "Canceled",
    },
    {
      "id": "#3290137460",
      "customer": "Paula",
      "driver": "Mike",
      "fare": "105",
      "status": "Completed",
    },
    {
      "id": "#3290137461",
      "customer": "Quentin",
      "driver": "Laura",
      "fare": "140",
      "status": "Pending",
    },
    {
      "id": "#3290137462",
      "customer": "George",
      "driver": "Oscar",
      "fare": "115",
      "status": "Completed",
    },
    {
      "id": "#3290137463",
      "customer": "Charlie",
      "driver": "Sophia",
      "fare": "80",
      "status": "Canceled",
    },
    {
      "id": "#3290137464",
      "customer": "Ian",
      "driver": "Rachel",
      "fare": "175",
      "status": "Pending",
    },
    {
      "id": "#3290137465",
      "customer": "Johan",
      "driver": "Tina",
      "fare": "150",
      "status": "Completed",
    },
    {
      "id": "#3290137466",
      "customer": "Diana",
      "driver": "Kevin",
      "fare": "125",
      "status": "Canceled",
    },
    {
      "id": "#3290137467",
      "customer": "Alice",
      "driver": "Quentin",
      "fare": "135",
      "status": "Pending",
    },
    {
      "id": "#3290137468",
      "customer": "Mike",
      "driver": "Paula",
      "fare": "155",
      "status": "Completed",
    },
    {
      "id": "#3290137469",
      "customer": "Fiona",
      "driver": "Steve",
      "fare": "85",
      "status": "Canceled",
    },
  ];

  var currentPage1 = 1.obs;
  final int itemsPerPage = 4;
  final int pagesPerGroup = 5;

  int get totalPages => (allRiders.length / itemsPerPage).ceil();

  List get pagedUsers {
    int start = (currentPage1.value - 1) * itemsPerPage;
    int end = start + itemsPerPage;
    return allRiders.sublist(start, end > allRiders.length ? allRiders.length : end);
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