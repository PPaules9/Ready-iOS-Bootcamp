import Foundation

//MARK: - Functions
func calculateRectanglesAreas (width: Double = 1.0, height: Double = 1.0) -> Double {
 return width * height

}


calculateRectanglesAreas()
calculateRectanglesAreas(width: 2)
calculateRectanglesAreas(width: 2, height: 4)


func findMinMax (numbers: [Int]) -> ((min: Int, max: Int)) {
 if numbers .isEmpty {
  return (0,0)
 } else {
  let max = numbers.max()
  let min = numbers.min()
  
  return (max!, min!)
 }
}

findMinMax(numbers: [2,3,4,1,2,3,0])


//MARK: - Closures

let x = Array(1...20)

x.filter { $0.isMultiple(of: 2) }


func makeCounter() -> () -> Int {
 var counter = 0
 return {
  counter += 1
  return counter
 }
}

var counting = makeCounter()
counting()
counting()
counting()

//MARK: - Collections - Transformations

let myArray = [1, 2, 3, 4, 5]
let squaredArray = myArray.map{ $0 * $0}

print (myArray)
print (squaredArray)


let itemPrice = [29.99, 15.50, 8.99, 42.00]
let total = itemPrice.reduce(0, +)

print ("\(total) $")


//MARK: - Collections - Sets & Dictionaries

let friendsGroupA: Set = ["mina", "joy", "mia"]
let friendsGroupb: Set = ["amy", "nina", "joy"]

print(friendsGroupA.intersection(friendsGroupb))


var grades = ["mina" : 80, "ena" : 90, "ina" : 85, "lena" : 70, "nina" : 95]

grades["mina"] = 90
print(grades)

let filteredStudents = grades.filter{
 $0.value > 80
}

print (filteredStudents)

//MARK: - Bonus Challenge
let bigArray = Array(0..<10000)
let bigSet = Set(bigArray)
let target = 9999

let startTime = CFAbsoluteTimeGetCurrent()
let arraytime = bigArray.contains(target)
let duration = CFAbsoluteTimeGetCurrent() - startTime

print(duration)


let setStartTime = CFAbsoluteTimeGetCurrent()
let settime = bigSet.contains(target)
let setDuration = CFAbsoluteTimeGetCurrent() - setStartTime

print(setDuration)
