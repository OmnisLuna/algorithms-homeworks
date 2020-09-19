// Леонович Н.В.
import Foundation

/*
 14. * Автоморфные числа. Натуральное число называется автоморфным, если оно равно последним
 цифрам своего квадрата. Например, 25 \ :sup: `2` = 625. Напишите программу, которая вводит
 натуральное число N и выводит на экран все автоморфные числа, не превосходящие N.
 */

func getNumbersCount(number: Int) -> Int {
    var result = number
    var count = 0
    while result > 0 {
        let digit = abs(result % 10)
        if digit != 0 {
            count += 1
        }
        result = result / 10
    }
    return count
}

func quickPow(_ number: Int, _ power: Int) -> Int {
    var result = 1
    if (power != 0) {
        if (power % 2) == 0 {
            result = quickPow(number * number, power / 2);
        } else {
            result = number * quickPow(number * number, power / 2)
        }
    }
    return result
}

let N = 500

for number in 1..<N {
    let sqr = quickPow(number, 2)
    let divider = quickPow(10, getNumbersCount(number: number))
    
    if (number == (Int(sqr) % Int(divider))) {
        print("\(number) - Автоморфное число")
    }
}
