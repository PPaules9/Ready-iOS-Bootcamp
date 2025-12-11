import Foundation
import Playgrounds

#Playground{
 //MARK: - Average Score
 let scores = [85, 92, 78, 65, 95,70]
 
 var average: Double {
  var totalSum = 0.0
  
  for i in scores {
   totalSum += Double(i)
  }
  
  return totalSum/Double(scores.count)
 }
 print("average = \(average)")

 
 //MARK: - Students name and Score
 let students = ["ahmed": 85, "sam": 92, "mo": 78, "omar": 65, "amin": 95, "ali":70]

 for (name, score) in students {
  print("\(name)'s score is \(score)")
 }
 
 
 
 //MARK: - grades
 func grade(_ score: Int) -> String {
  if score >= 90 {
   return "A"
  } else if score >= 80 {
   return "B"
  } else if score >= 70 {
   return "C"
  } else if score >= 60 {
   return "E"
  } else {
   return "F"
  }
 }
 
 print(grade(students["sam"]!))

 
 
 
 //MARK: - Accessing Dictionary Values
 
 func printGrade (_ name: String, _ students: [String: Int]) {
  if let score = students[name] {
   print("\(name) score is \(score)")
  } else {
   print("\(name) score Not Found")
  }
 }
 
 printGrade("amin", students)
 printGrade("Unknown", students)

}
