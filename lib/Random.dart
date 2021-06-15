// here i will right my own random module logic .
class Random {
  String random(List input) {
    // this takes list and gives a random string out of it
    int sec = DateTime.now().second;
    String output = ' ';
    int sectolength = sec.toString().length;
    if (sectolength == 1) {
      if (sec == 1 || sec == 4 || sec == 3) {
        output = input[2];
      } else if (sec == 2 || sec == 5 || sec == 7) {
        output = input[1];
      } else if (sec == 6 || sec == 8 || sec == 9 || sec == 0) {
        output = input[0];
      }
    } else if (sectolength == 2) {
      if (sec.toString()[1] == '6' ||
          sec.toString()[1] == '2' ||
          sec.toString()[1] == '3') {
        output= input[1];
      } else if (sec.toString()[1] == '9' ||
          sec.toString()[1] == '5' ||
          sec.toString()[1] == '1' ||
          sec.toString()[1] == '0') {
        output = input[2];
      } else if (sec.toString()[1] == '7' ||
          sec.toString()[1] == '8' ||
          sec.toString()[1] == '4') {
        output = input[0];
      }
    }
    return output; // this has to return something so asisgn variable and return at the end

  }
}
