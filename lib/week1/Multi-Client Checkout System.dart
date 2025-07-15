import 'dart:io';
void main() {
  while (true) {
    int qty1 = 0, qty2 = 0, qty3 = 0, qty4 = 0, qty5 = 0;
    double subtotal = 0;
    print("""
  Welcome to the Store!
1. Keyboard - \$100
2. Mouse - \$50
3. Monitor - \$300
4. USB Cable - \$20
5. Headphones - \$150
""");

    while (true) {
      print("Enter product number (0 to finish): ");
      int p = int.parse(stdin.readLineSync()!);
      if (p == 0) break;
      print("Enter quantity: ");
      int q = int.parse(stdin.readLineSync()!);

      if (p == 1) qty1 += q;
      else if (p == 2) qty2 += q;
      else if (p == 3) qty3 += q;
      else if (p == 4) qty4 += q;
      else if (p == 5) qty5 += q;
      else print("Invalid product.");
    }

    print("Enter name: ");
    String name = stdin.readLineSync()!;
    print("Enter phone: ");
    stdin.readLineSync();


    double total1 = qty1 * 100;
    double total2 = qty2 * 50;
    double total3 = qty3 * 300;
    double total4 = qty4 * 20;
    double total5 = qty5 * 150;
    subtotal = total1 + total2 + total3 + total4 + total5;
    double tax = subtotal * 0.13;
    double discount = subtotal > 1000 ? subtotal * 0.1 : 0;
    double delivery = 0;

    stdout.write("Delivery? (yes/no): ");
    String d = stdin.readLineSync()!.toLowerCase();
    if (d == 'yes') {
      stdout.write("Distance in km: ");
      int km = int.parse(stdin.readLineSync()!);
      if (km <= 10) delivery = 10;
      else if (km <= 20) delivery = 25;
      else delivery = 45;
    }

    double total = subtotal + tax + delivery - discount;

    print("""
----------------------------
Receipt for $name:
Keyboard x$qty1 = \$${total1.toStringAsFixed(2)}
Mouse x$qty2 = \$${total2.toStringAsFixed(2)}
Monitor x$qty3 = \$${total3.toStringAsFixed(2)}
USB Cable x$qty4 = \$${total4.toStringAsFixed(2)}
Headphones x$qty5 = \$${total5.toStringAsFixed(2)}
----------------------------
Subtotal: \$${subtotal.toStringAsFixed(2)}
Tax (13%): \$${tax.toStringAsFixed(2)}
Discount: \$${discount.toStringAsFixed(2)}
Delivery Fee: \$${delivery.toStringAsFixed(2)}
Total: \$${total.toStringAsFixed(2)}

Thank you, $name!
Ready for next customer...
""");
  }
}
