import 'dart:developer' as dev;
class Logger{
  static log(String key,String message){
    print("FlipIt logger : $key -> $message\n");
    dev.log("FlipIt logger : $key -> $message\n");
  }
}