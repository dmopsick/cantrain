class Util {

  bool convertShortToBool(short) {
    bool result = false;
    
    if (short == 0) {
      result = false;
    } else if (short == 1) {
      result = true;
    }

    return result;
  }

}