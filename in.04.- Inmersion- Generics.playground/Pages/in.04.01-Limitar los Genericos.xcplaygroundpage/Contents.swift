//: [Previous](@previous)

import Foundation

func add <T : Numeric >(_value1: T ,
                      _value2: T ) -> T {
  
  return _value1 + _value2
}

let result = add(_value1: 5, _value2: 4)

let input1: Float = 7.2
let input2: Float = 9.6

let result2 = add(_value1: input1, _value2: input2)

//let result3 = add(_value1: "Hola", _value2: "Generics")
//no se puede poner strings xq es un Numeric



var typesOfEngine: Array<String> = Array<String>()

let result5 = typesOfEngine.append("Hola")
print("result5: \(typesOfEngine)")

//agregar un string a una array


typesOfEngine.insert("Electric",
                     at: typesOfEngine.endIndex )


//: [Next](@next)
