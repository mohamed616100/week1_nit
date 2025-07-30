import 'dart:io';

void main() {
  List<List<String>> seats = List.generate(5, (_) => List.filled(5, 'E'));
  Map<String, Map<String, String>> bookings = {};
  print("Welcome To Our Theater");

  while (true) {
    print("\npress 1 to book new seat");
    print("press 2 to show the theater seats");
    print("press 3 to show users data");
    print("press 4 to exit");

    stdout.write("input=> ");
    String? choice = stdin.readLineSync();

    if (choice == '1') {
      stdout.write("Enter row (1-5): ");
      int? row = int.tryParse(stdin.readLineSync() ?? '');
      stdout.write("Enter column (1-5): ");
      int? col = int.tryParse(stdin.readLineSync() ?? '');

      if (row == null || col == null || row < 1 || row > 5 || col < 1 || col > 5) {
        print("Invalid seat position.");
        continue;
      }

      if (seats[row - 1][col - 1] == 'B') {
        print("Seat already booked.");
        continue;
      }

      stdout.write("Enter your name: ");
      String? name = stdin.readLineSync();
      stdout.write("Enter your phone number: ");
      String? phone = stdin.readLineSync();

      seats[row - 1][col - 1] = 'B';
      bookings["$row,$col"] = {"name": name ?? '', "phone": phone ?? ''};

      print("Seat booked successfully!");

    } else if (choice == '2') {
      print("\nTheater Seats:");
      for (var row in seats) {
        print(row.join(" "));
      }

    } else if (choice == '3') {
      if (bookings.isEmpty) {
        print("No bookings yet.");
      } else {
        print("\nUsers Booking Details:");
        bookings.forEach((seat, data) {
          print("Seat $seat: ${data["name"]} - ${data["phone"]}");
        });
      }

    } else if (choice == '4') {
      print("\nSee You Back");
      break;

    } else {
      print("Invalid choice. Try again.");
    }
  }
}
