import 'package:math_expressions/math_expressions.dart';

class CalcLogic {
  String userInput = "";
  String result = "0";

  String handleButtonPress(String text) {
    if (text == "AC") {
      userInput = "";
      result = "0";
    } else if (text == "C") {
      if (userInput.isNotEmpty) {
        userInput = userInput.substring(0, userInput.length - 1);
      }
    } else if (text == "=") {
      result = calculate();
      userInput = result;

      if (userInput.endsWith(".0")) {
        userInput = userInput.replaceAll(".0", "");
      }

      if (result.endsWith(".0")) {
        result = result.replaceAll(".0", "");
      }
    } else {
      userInput = userInput + text;
    }

    return result;
  }

  String calculate() {
    try {
      var exp = Parser().parse(userInput);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    } catch (e) {
      return "Error";
    }
  }
}
