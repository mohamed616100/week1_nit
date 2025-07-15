import 'dart:io';
String name = '';
String accountNumber = '';
String accountType = '';
double balance = 0.0;
void main() {
  print("Enter your name: ");
  name = stdin.readLineSync()!;

  print("Enter account number: ");
  accountNumber = stdin.readLineSync()!;

  while (true) {
    print("Enter account type (savings/checking): ");
    accountType = stdin.readLineSync()!.toLowerCase();
    if (accountType == 'savings' || accountType == 'checking') break;
    print("Invalid account type. Try again.");
  }
  print("Enter initial balance: ");
  balance = double.parse(stdin.readLineSync()!);

  while (true) {
    print('''
------ Menu ------
1. Deposit
2. Withdraw
3. Predict Future Balance
4. View Account Summary
5. Exit
''');

  print("Choose an option: ");
    String choice = stdin.readLineSync()!;

    if (choice == '1') {
      deposit();
    } else if (choice == '2') {
      withdraw();
    } else if (choice == '3') {
      predictFutureBalance();
    } else if (choice == '4') {
      showSummary();
    } else if (choice == '5') {
      print("Thank you for using the banking system. Goodbye!");
      break;
    } else {
      print("Invalid option. Try again.");
    }
  }
}
void deposit() {
print("Enter amount to deposit: ");
  double amount = double.parse(stdin.readLineSync()!);
  if (amount <= 0) {
    print("Invalid amount. Deposit failed.");
  } else {
    balance += amount;
    print("Deposit successful. New balance: \$${balance.toStringAsFixed(2)}");
  }
}

void withdraw() {
  print("Enter amount to withdraw: ");
  double amount = double.parse(stdin.readLineSync()!);
  if (amount <= 0) {
    print("Invalid amount. Withdrawal failed.");
  } else if (amount > balance) {
    print("Insufficient balance. Withdrawal denied.");
  } else {
    balance -= amount;
    print("Withdrawal successful. New balance: \$${balance.toStringAsFixed(2)}");
  }
}
void predictFutureBalance() {
  print("Enter number of years: ");
  int years = int.parse(stdin.readLineSync()!);
 print("Enter annual profit rate (%): ");
  double rate = double.parse(stdin.readLineSync()!);

  if (years < 0 || rate < 0) {
    print("Invalid input. Prediction failed.");
    return;
  }
  double future = balance * (1 + (rate / 100) * years);
  print("Predicted future balance after $years years: \$${future.toStringAsFixed(2)}");
  print("Rounded balance: \$${future.round()}");
}

void showSummary() {
  print('''
Account Summary:
Name: $name
Account Number: $accountNumber
Account Type: $accountType
Current Balance: \$${balance.toStringAsFixed(2)}
Rounded Balance: \$${balance.round()}
''');
}
