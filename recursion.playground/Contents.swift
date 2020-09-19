//Домашнее задание Н. Леонович

import UIKit
import PlaygroundSupport

/*
 1. Реализовать функцию перевода чисел из десятичной системы в двоичную, используя
 рекурсию.
 */

func convertToBinary(_ number: Int) -> Int {
    if (number == 0) {
        return 0
    }
    else {
        return (number % 2 + 10 * convertToBinary(number / 2));
    }
}

let N = 300;
print("Число \(N) в двоичной системе: \(convertToBinary(N))")


/*
 2. Реализовать функцию возведения числа a в степень b:
    a. Без рекурсии.
    b. Рекурсивно.
    c. *Рекурсивно, используя свойство чётности степени.
 */

func powA(_ a: Int, _ b: Int) -> Int {
    var result: Int = 1
    
    if (b == 0) {
        return 1
    } else {
        for _ in 1...b {
            result *= a
        }
    }
    return result
}

print("Возведение в степень без рекурсии: \(powA(2, 13))")

func powB(_ a: Int, _ b: Int) -> Int {
    if (b != 0) {
        return (a * powB(a, b - 1))
    } else {
        return 1
    }
}

print("Возведение в степень с рекурсией: \(powB(2, 13))")

func powC(_ number: Int, _ power: Int) -> Int {
    var result = 1
    if (power != 0) {
        if (power % 2) == 0 {
            result = powC(number * number, power / 2);
        } else {
            result = number * powC(number * number, power / 2)
        }
    }
    return result
}

print("Рекурсивно, используя свойство чётности степени: \(powC(2, 13))")
