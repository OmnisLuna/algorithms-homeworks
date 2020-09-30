//: ДЗ Леонович Н.

import UIKit
import PlaygroundSupport

/*
 5. **Реализовать алгоритм перевода из инфиксной записи арифметического выражения в постфиксную.
 */

let expressionInfix = Array("5*8*(2+9)+(7-5+8-9*(5*5)+5)")
var stack: [String] = []
var queue: [String] = []

func precedence(_ item: Character) -> Int{
    var val = -1
    switch item
    {
    case "(": val = 0
    case "+": val = 1
    case "-": val = 1
    case "*": val = 2
    case "/": val = 2
    default: val = 0
    }
    return val
}

private func pop() {
    // Выгружаем стек в очередь пока не найдем левую скобку, потом удаляем скобку из стека
    for i in stride(from: 0, to: stack.count-1, by: -1) {
        if (stack[i] == "(") {
            stack[i] = " "
            break
        }
        queue.append(stack[i])
        stack[i] = " "
        stack.removeAll { $0 == " " }
    }
}

func convertToPostfix(_ items: [Character]) {
    for item in items {
        
        if item == "(" {
            stack.append(String(item))
            
        } else if item == ")" {
            if items.contains("(") {
                pop()
            }
        } else if item.isNumber {
            queue.append(String(item))
            
        } else if item == "+" || item == "-" {
            
            if stack.isEmpty || stack.last! == "(" {
                stack.append(String(item))
                
            } else if stack.last! == "*" || stack.last! == "/" {
                pop()
                stack.append(String(item))
                
            } else {
                queue.append(stack.last!)
                stack[stack.count-1] = String(item)
            }
            
        } else if item == "*" || item == "/" {
            
            if (!stack.isEmpty) && (stack.last! == "*" || stack.last! == "/") {
                pop()
            }
            stack.append(String(item))
        }
    }
    if !stack.isEmpty {
        for i in stride(from: 0, to: stack.count-1, by: -1) {
            if (stack[i] != "(") {
                queue.append(stack[i])
            }
        }
    }
    print("Постфиксное выражение: \(queue)")
    print(stack)
    print(stack[stack.count-1])
}

convertToPostfix(expressionInfix)
