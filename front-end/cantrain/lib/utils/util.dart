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

  int convertBoolToShort(bool boolToConvert) {
    int result = -1;

    if (boolToConvert == true) {
      result = 1;
    } else {
      result = 0;
    }
    
    return result;
  }

}