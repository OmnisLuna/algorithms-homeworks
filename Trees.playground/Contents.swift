// Леонович.Н homework

import UIKit
import PlaygroundSupport

/*1. Реализовать простейшую хэш-функцию. На вход функции подается строка, на выходе сумма кодов символов.*/

func hashString(_ string: [Character]) -> Int {
    var hash = 0
    var codes = Array("")
    //получаем коды для каждого символа в строке и записываем в массив
    for i in 0...(string.count-1) {
        let c = String(string[i]).unicodeScalars
        let code = c[c.startIndex].value
        codes += String(code)
    }
    //суммируем все коды по формуле
    for j in 0...(codes.count-1) {
        hash += (Int(String(codes[j]))! * Int(pow(2, Double(j))) * Int.random(in: 1...100))
    }
    return hash
}
let str = Array("keyqeqweiuy12312")
print("Hash: \(hashString(Array(str)))")

/*
 2. Переписать программу, реализующее двоичное дерево поиска.
 а) Добавить в него обход дерева различными способами;
 б) Реализовать поиск в двоичном дереве поиска;
 */

let tree = [0,9,8]

func getTree(_ root: Int) {
    if (root < tree.count && tree[root] != 0) {
        print(tree[root])
        if ((2 * root) < tree.count && tree[2 * root] != 0) {
            getTree(2 * root)
        } else {
            print("NULL")
        }
        print(",")
        if ((2 * root + 1) < tree.count && tree[2 * root + 1] != 0) {
            getTree(2 * root + 1)
        } else {
            print("NULL")
        }
        print(")")
    }
}
