class AppFontSize {

  static double dp10 = 10;
  static double dp11 = 11;
  static double dp12 = 12;
  static double dp14 = 14;
  static double dp16 = 16;
  static double dp15 = 15;
  static double dp18 = 18;
  static double dp20 = 20;
  static double dp24 = 24;
  static double dp28 = 28;
  static double dp19 = 19;
  static double dp13 = 13;
  static double dp30 = 30;
  static double dp32 = 32;
  static double dp48 = 48;
  static double dp60 = 60;
  static double dp96 = 96;

  static double titleByValue(String type){
    switch(type){
      case "mini":
        return dp14;
      case "small":
        return dp16;
      case "large":
        return dp20;
      case "medium":
        return dp18;
      default:
        return dp18;
    }
  }

  static double subtitleByValue(String type){
    switch(type){
      case "mini":
        return dp12;
      case "small":
        return dp14;
      case "large":
        return dp18;
      case "medium":
        return dp16;
      default:
        return dp16;
    }
  }

  static double bodyTitleByValue(String type){
    switch(type){
      case "mini":
        return dp12;
      case "small":
        return dp14;
      case "large":
        return dp18;
      case "medium":
        return dp16;
      default:
        return dp16;
    }
  }

  static double bodyContentByValue(String type){
    switch(type){
      case "mini":
        return dp10;
      case "small":
        return dp12;
      case "large":
        return dp16;
      case "medium":
        return dp14;
      default:
        return dp14;
    }
  }
}