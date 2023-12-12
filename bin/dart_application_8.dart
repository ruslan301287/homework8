import 'dart:io';
import 'dart:math';

void main() {
  print(
      'Welcome! \n Выберите режим игры \n  1 Угадывает пользователь \n  2 Угадывает комп \n  3 Соревновательный');
  int choice = int.parse(stdin.readLineSync()!);

  switch (choice) {
    case 1:
      userFind();
      break;
    case 2:
      pcFind();
      break;
    case 3:
      challenge();
      break;
    default:
      main();
  }
}

userFind() {
  int number = Random().nextInt(100);
  int counter = 0;

  while (true) {
    counter++;
    print('Компьютер выбрал число от 0 до 100');
    int answer = int.parse(stdin.readLineSync()!);
    if (answer == number) {
      print('ty ugadal за $counter попыток');
      break;
    } else if (answer < number) {
      print('chilo bolshe');
    } else if (answer > number) {
      print('chislo menshe');
    }
  }
  main();
  return counter;
}

int pcFind() {
  double min = 0;
  double max = 100;
  int counter = 0;

  while (true) {
    counter++;
    print('Загадайте число от 1 до 100');
    double answerNumber = min + (max - min) / 2;
    print('''Vshe chislo ${answerNumber.round()}
    1) Больше 
    2) Меньше 
    3) Да это мое число''');
    String answer = stdin.readLineSync()!;
    if (answer == '1') {
      min = answerNumber;
    } else if (answer == '2') {
      max = answerNumber;
    } else if (answer == '3') {
      print('Ты угадал за $counter попыток');
      break;
    }
  }
  main();
  return counter;
}

challenge() {
  int pc = pcFind();
  int user = userFind();

  if (pc < user) {
    print('Выйграл компьютер');
  } else if (pc == user) {
    print('Победила дружба');
  } else {
    print('Выйграл пользователь');
  }
}
