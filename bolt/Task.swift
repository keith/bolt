import Foundation

struct Task {
  let name: String
  let description: String?
  let action: () -> ()

  static func missingTask(name: String) -> Task {
    return Task(name: name, description: nil) {
      println("No task named '\(name)' exists")
    }
  }

  func run() {
    action()
  }
}
