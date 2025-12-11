import SwiftUI


struct ContentView: View {
 func calculate(_ numb1: Double, _ numb2: Double, operation: String) -> String {
  switch operation{
   case "+":
   return String(numb1 + numb2)
  case "-":
   return String(numb1 - numb2)
  case "*":
   return String(numb1 * numb2)
  case "/":
   return numb2 == 0 ? "Error: Division by zero" : String(numb1 / numb2)
  default:
   return "Error: Invalid operation"
  }
 }
 
 
 
    var body: some View {
        VStack(spacing: 20) {
            Text("Basic Calculator")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            // Example calculations
            VStack(alignment: .leading, spacing: 10) {
                Text(calculate(10.0, 5.0, operation: "+"))
                Text(calculate(10.0, 5.0, operation: "-"))
                Text(calculate(10.0, 5.0, operation: "*"))
                Text(calculate(10.0, 5.0, operation: "/"))
                Text(calculate(10.0, 0.0, operation: "/"))
            }
            .font(.body)
            .padding()
        }
        .padding()
    }
}
