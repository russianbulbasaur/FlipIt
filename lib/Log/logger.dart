import 'dart:developer' as dev;
class Logger{
  static log(String key,String message){
    dev.log("FlipIt logger : $key -> $message\n");
  }
}