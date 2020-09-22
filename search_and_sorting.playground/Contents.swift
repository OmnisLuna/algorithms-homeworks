//Домашнее задание №3, Леонович.Н

import UIKit
import PlaygroundSupport

func getArray(length: Int) -> [Int] {
    let array: [Int] = Array<Int>(0..<length)
    return array.shuffled()
}

let array10 = getArray(length: 10)
let array100 = getArray(length: 100)
let array500 = getArray(length: 500)
let array1000 = getArray(length: 1000)
let array10000 = getArray(length: 10000)

/*
 1. Попробовать оптимизировать пузырьковую сортировку.
 Сравнить количество операций сравнения оптимизированной и не оптимизированной программы.
 Написать функции сортировки, которые возвращают количество операций.
 */

func bubbleSort(_ array: [Int]) -> Int {
    guard array.count > 1 else {return 0}
    var sortedArray = array
    var count = 0
    let N = sortedArray.count - 1
    for i in 0..<N {
        for j in 0..<(N - i) {
            count += 1
            if sortedArray[j] > sortedArray[j + 1] {
                //                let tmpElement = sortedArray[j]
                //                sortedArray[j] = sortedArray[j + 1]
                //                sortedArray[j + 1] = tmpElement
                sortedArray.swapAt(j, j + 1) //заменяю код выше на уже существующую для массивов функцию
                count += 1
            }
        }
    }
    //    print(sortedArray)
    return count
}

func bubbleSortOpt(_ array: [Int]) -> Int {
    guard array.count > 1 else {return 0}
    var sortedArray = array
    let N = sortedArray.count
    var count = 0
    for i in 0..<N {
        count += 1
        var sorted = true
        for j in 0..<N-1-i {
            if sortedArray[j] > sortedArray[j + 1]{
                sortedArray.swapAt(j, j + 1)
                sorted = false
                count += 1
            }
        }
        if sorted {
            break
        }
    }
    //    print(sortedArray)
    return count
}

//print(array100)
//print("Обычная пузырьковая\n \(bubbleSort(array10))")
//print("Оптимизированная пузырьковая\n \(bubbleSortOpt(array10))")
//print("Обычная пузырьковая\n \(bubbleSort(array100))")
//print("Оптимизированная пузырьковая\n \(bubbleSortOpt(array100))")

/*
 чем больше массив, тем меньше операций для оптимизированной пузырьковой сортировки. На небольших массивах разницы между обычной и оптимизированной нет
 */

func shakerSort(_ array: [Int]) -> Int {
    guard array.count > 1 else {return 0}
    var sortedArray = array
    let N = sortedArray.count
    var left = 0
    var right = N - 1
    var count = 0
    
    while left < right {
        for i in left..<right{
            count += 1
            if sortedArray[i] > sortedArray[i + 1] {
                sortedArray.swapAt(i, i + 1)
                count += 1
            }
        }
        right -= 1
        for i in stride(from: right, to: left, by: -1) {
            if sortedArray[i] < sortedArray[i - 1] {
                sortedArray.swapAt(i, i - 1)
                count += 1
            }
        }
        left += 1
    }
    //    print(sortedArray)
    return count
}

func shakerSortOpt(_ array: [Int]) -> Int {
    guard array.count > 1 else {return 0}
    var sortedArray = array
    let N = sortedArray.count
    var left = 0
    var right = N - 1
    var count = 0
    var sorted = true
    
    while (sorted == true) {
        sorted = false
        while left < right {
            for i in left..<right{
                count += 1
                if sortedArray[i] > sortedArray[i + 1] {
                    sortedArray.swapAt(i, i + 1)
                    count += 1
                    sorted = true
                }
            }
            if (sorted == false) { break }
            
            sorted = false
            right -= 1
            for i in stride(from: right, to: left, by: -1) {
                if sortedArray[i] < sortedArray[i - 1] {
                    sortedArray.swapAt(i, i - 1)
                    count += 1
                    sorted = true
                }
            }
            left += 1
        }
    }
    //    print(sortedArray)
    return count
}

//print(array10)
//print("Обычная шейкерная\n \(shakerSort(array10))")
//print("Оптимизированная шейкерная\n \(shakerSortOpt(array10))")
//print("Обычная шейкерная\n \(shakerSort(array100))")
//print("Оптимизированная шейкерная\n \(shakerSortOpt(array100))")

/*
 чем больше массив, тем меньше операций для оптимизированной шейкерной сортировки. На небольших массивах разницы между обычной и оптимизированной почти нет
 */

/*
 3. Реализовать бинарный алгоритм поиска в виде функции, которой передается отсортированный массив. Функция возвращает индекс найденного элемента или -1, если элемент не найден.
 */

func binarySearch(_ array: [Int], _ searchItem: Int) -> Int? {
    var lowerIndex = 0
    var upperIndex = array.count - 1
    
    while (true) {
        let currentIndex = (lowerIndex + upperIndex)/2
        if(array[currentIndex] == searchItem) {
            return currentIndex
        } else if (lowerIndex > upperIndex) {
            return nil
        } else {
            if (array[currentIndex] > searchItem) {
                upperIndex = currentIndex - 1
            } else {
                lowerIndex = currentIndex + 1
            }
        }
    }
}

var array = [1,2,3,4,5,6,7,9,10]
if let searchIndex = binarySearch(array, 7) {
    print("Element found on index: \(searchIndex)")
}

/*
 4. *Подсчитать количество операций для каждой из сортировок и сравнить его с асимптотической сложностью алгоритма.
 */

func insertionSort(_ array: [Int]) -> Int {
    if array.isEmpty {
        return 0
    }
    var count = 0
    var sortedArray = array
    
    for i in 1..<sortedArray.count {
        count += 1
        let key = sortedArray[i]
        let pos = i
        
        while (pos > 0 && sortedArray[pos - 1] > key) {
            sortedArray[pos] = sortedArray[pos - 1]
        }
        sortedArray[pos] = key
    }
    print(array)
    return count
}



func selectionSort(_ array: [Int]) -> Int {
    var sortedArray = array
    let N = sortedArray.count
    var count = 0
    
    for i in 0..<N {
        let min = minIndex(array: sortedArray, startIndex: i)
        if min != i {
            sortedArray.swapAt(min, i)
            count += 1
        }
    }
    print(sortedArray)
    return count
}

func minIndex(array: [Int], startIndex: Int) -> Int {
    var minIndex = startIndex
    for i in startIndex..<array.count {
        if array[minIndex] > array[i] {
            minIndex = i
        }
    }
    return minIndex
}


let error = "Algorythm didn't match true asymptotic complexity"

let bubble = bubbleSort(array100)

if bubble > 100 && bubble < 10000 { //сложность O(n^2)
    print(bubble)
    print("bubbleSort matches asymptotic complexity")
} else {
    print(error)
}
let bubbleOptimized = bubbleSortOpt(array100)

if  bubbleOptimized > 100 && bubbleOptimized < 10000 { //сложность O(n^2)
    print(bubbleOptimized)
    print("bubblebubbleOptimized matches asymptotic complexity")
} else {
    print(error)
}
let shaker = shakerSort(array100)
if  shaker > 100 && shaker < 10000 { //сложность O(n^2)
    print(shaker)
    print("shakerSort matches asymptotic complexity")
} else {
    print(error)
}

let shackerOptimized = shakerSortOpt(array100)
if  shackerOptimized > 100 && shackerOptimized < 10000 { //сложность O(n^2)
    print(shackerOptimized)
    print("shackerOptimized matches asymptotic complexity")
} else {
    print(error)
}

let selection = selectionSort(array100)
if  selection > 100 && selection < 10000 { //сложность O(n^2)
    print(selection)
    print("selectionSort matches asymptotic complexity")
} else {
    print(error)
}

let insertion = insertionSort(array100)
if  insertion > 100 && insertion < 10000 { //сложность O(n^2)
    print(insertion)
    print("insertionSort matches asymptotic complexity")
} else {
    print(error)
}


