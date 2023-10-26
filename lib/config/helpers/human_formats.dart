
import 'package:intl/intl.dart';

class HumanFormats{

  static String humanReadbleNumber(double number){ //static sirve para llamar el metodo sin instanciar la clase
    
  final formatterNumber = NumberFormat.compactCurrency(  //formatea el numero para que sea mas legible 
    decimalDigits: 0,
    symbol: '',
  ).format(number); 
    
    
    return formatterNumber;
  }
}