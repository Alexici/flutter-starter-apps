import 'dart:math';

int chooseNumber(maxNr) {
  int randomNumber = Random().nextInt(maxNr);
  return randomNumber + 1;
}
