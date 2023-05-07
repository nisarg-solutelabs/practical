import 'dart:math';

int getRandom(int max, List<int> done) {
  int numer = Random().nextInt(max);
  if (done.contains(numer)) {
    if (done.length == max) {
      return -1;
    } else {
      return getRandom(
        max,
        done,
      );
    }
  } else {
    return numer;
  }
}
