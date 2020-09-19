// Леонович Н.В.
import Foundation

/*
 14. * Автоморфные числа. Натуральное число называется автоморфным, если оно равно последним
 цифрам своего квадрата. Например, 25 \ :sup: `2` = 625. Напишите программу, которая вводит
 натуральное число N и выводит на экран все автоморфные числа, не превосходящие N.
 */

    
let N = 500


func getNumbersCount(number: Int) -> Int {
    var num = number
    var count = 0
    while num != 0 {
        let digit = abs(num % 10)
        if digit != 0 && number % digit == 0 {
            count += 1
        }
        num = num / 10
    }
    return count
}

func quickPow(_ number: Int, _ power: Int) -> Int {
    var result = 1
    var p = power
    var n = number
    if (p % 2) == 0 {
        p -= 1
        result *= n
    } else {
        n *= n
        p /= 2
    }
    return n
}

for number in 0..<1000 {
    //var num = number
    let sqr = quickPow(number, 2)
    let divider = quickPow(10, getNumbersCount(number: N))
    
    if (number == (Int(sqr) % Int(divider))) {
        print("\(number) - Автоморфное число")
        print(divider)
    }
}
