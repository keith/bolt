import Foundation

task("Add Stuff") {
  println("1 + 1 is \(1 + 1)")
}

task("Multiply Stuff") {
  println("2 * 2 is \(2 * 2)")
}

task("Custom Task", "Add Stuff", "Multiply Stuff", "Missing Task")

runTask("Add Stuff")
println()
runTasks("Add Stuff", "Multiply Stuff")
println()
runTask("Missing Task")
println()
runTask("Custom Task")
