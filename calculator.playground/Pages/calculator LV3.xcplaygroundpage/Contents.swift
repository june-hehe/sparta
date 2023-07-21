import Foundation

/*
 역순으로 구성해보자
 
 최종적으로 프린트할때 나오는 모습
 
 인스턴스 생성시
 let calculate = Calculator()
 
 calculate.add()
 calculate.subtract()
 calculate.multiply()
 calculate.divide()
 
 Calculator 클래스안에 각 연산기능이 있는 클래스를 넣고
 상속...?이나 return 값으로 나오게끔 유도해보자...?
 */





class AddResult {
    func add (_ a: Double, _ b: Double) -> Double {
        return a + b
    }
}

class SubtractResult {
    func subtract (_ a: Double, _ b: Double) -> Double {
        return a - b
    }
}

class MultiplyResult {
    func multiply (_ a: Double, _ b: Double) -> Double {
        return a * b
    }
}

class DivideResult {
    func divide (_ a: Int, _ b: Int) -> Any {
        if b != 0 {
            return a / b
        } else {
            return "0으로 나눌 수 없습니다"
        }
    }
}

// 사칙연산 각 클래스 만들음

class Calculator {
    // 사칙연산 클래스 연결시킬 하나의 커다란 클래스 만들기
    let addNumber = AddResult()
    let subtractNumber = SubtractResult()
    let multiplyNumber = MultiplyResult()
    let divideNumber = DivideResult()
    // 인스턴스 생성하기
    
    
    func add (_ a: Double, _ b: Double) -> Double {
        // 함수를 만들어서 인스턴스의 값으로 접근하기 (return값을 인스턴스를 가리키도록)
        return addNumber.add(a, b)
    }
    /*
     접근중 ex) addNumber.add(_ a: Double, _b: Double)로 작성함
     -> '_' can only appear in a pattern or on the left side of an assignment 오류
     -> _를 함수 호출 시 매개변수에 사용하려고 했기 때문입니다. 스위프트에서 함수 호출 시에는 매개변수 이름을 함께 써야 합니다.
     -> return 값이 Double이기에 임의값을 넣지않고 a, b를 그대로 넣어보았다
     해결
     */
    
    func subtract (_ a: Double, _ b: Double) -> Double {
        return subtractNumber.subtract(a, b)
    }
    func multiply (_ a: Double, _ b: Double) -> Double {
        return multiplyNumber.multiply(a, b)
    }
    func divide (_ a: Int, _ b: Int) -> Any {
        return divideNumber.divide(a, b)
    }
}

let calculate = Calculator()
// Calculator 클래스를 상수 calculate에 할당
calculate.add(5, 5)
calculate.subtract(5, 5)
calculate.multiply(5, 5)

calculate.divide(5, 5)
calculate.divide(5, 0)

// 조건문이나 반복문
// 열거형 & 조건문

/*

 */





// 조건문이나 반복문
// 열거형 & 조건문

