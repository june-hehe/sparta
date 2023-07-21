import UIKit

// LV 1, LV 2
class Calculator {
    func add(a: Double, b: Double) -> Double {
        return a + b
    }
    func subtract(a: Double, b: Double) -> Double {
        return a - b
    }
    func multiply(a: Double, b: Double) -> Double {
        return a * b
    }
    func divide(a: Double, b: Double) -> Any {
        if b != 0 {
            return a / b
        } else {
            return "0으로 나눌 수 없습니다"
        }
    }
    func remain(a: Int, b: Int) -> Any {
        if b != 0 {
            return a % b
        } else {
            return "0으로 나눌 수 없습니다"
        }
    }
}

let calculate = Calculator()

let addResult = calculate.add(a: 5, b: 4)
let subtractResult = calculate.subtract(a: 6, b: 4)
let multiplyResult = calculate.multiply(a: 5, b: 4)

let divideResult1 = calculate.divide(a: 5, b: 4)
let divideResult2 = calculate.divide(a: 5, b: 0)

let remainResult1 = calculate.remain(a: 5, b: 2)
let remainResult2 = calculate.remain(a: 5, b: 0)

print("+ : \(addResult)")
print("- :\(subtractResult)")
print("* : \(multiplyResult)")

print("/ : \(divideResult1)")
print("/ : \(divideResult2)")

print("% : \(remainResult1)")
print("% : \(remainResult2)")
