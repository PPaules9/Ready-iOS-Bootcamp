import SwiftUI


struct ContentView: View {
 var scores = [85, 92, 78, 65, 95,70]
 var students = ["ahmed": 85, "sam": 92, "mo": 78, "omar": 65, "amin": 95, "ali":70]
 
 var average: Double {
  var x = 0.0
  
  for i in scores {
    x = Double(i)
  }
  
  return x
 }
 
 
 
 var body: some View {
  VStack{
   Text("")
  }
  .onAppear {
   
   print("Hello")
   print(average)
  }
 }
 
 

}
