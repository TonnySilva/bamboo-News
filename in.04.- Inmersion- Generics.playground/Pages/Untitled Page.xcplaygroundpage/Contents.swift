import UIKit

func introspection1(_ value: String ) {
  print("\(#function)")
  print("Type of value: \(type(of: value)) \nwith value: \(value)")
  
}

introspection1("Hola")


func introspection2(_ value: Int) {
  print("\(#function)")
  print("Type of value: \(type(of: value)) \nwith value: \(value)")
  
}
introspection2(11)


func introspection <T> (value: T) {
  print("\n\n\(#function)")
  print("Type of value: \(type(of: value)) \nwith value: \(value)")
}
introspection(value: 10)


func introspection3(_ value: Any) {
  print("\n\n\(#function)")
  print("Type of value: \(type(of: value)) \nwith value: \(value)")
}
introspection3("HolaAny")
introspection3(11)


func introspection4<T>(_ value1: T, _ value2: T) {
  print("\n\n\(#function)")
  print("Type of value1: \(type(of: value1)) \nwith value: \(value1)")
  print("Type of value2: \(type(of: value2)) \nwith value: \(value2)")
}
introspection4("Hola", "mundo")


func introspection5(_ value1: Any, _ value2: Any) {
  print("\n\n\(#function)")
  print("Type of value1: \(type(of: value1)) \nwith value: \(value1)")
  print("Type of value2: \(type(of: value2)) \nwith value: \(value2)")
}
introspection5(11, "Hola")



