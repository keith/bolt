# bolt

This is a simple proof of concept for a
[`Rake`](https://en.wikipedia.org/wiki/Rake_(software)) like tool
written in Swift.

## Examples

(From `main.swift`)

Run a task:

```swift
task("Add Stuff") {
  println("1 + 1 is \(1 + 1)")
}

runTask("Add Stuff") // 1 + 1 is 2
```

Run multiple tasks:

```swift
task("Add Stuff") {
  println("1 + 1 is \(1 + 1)")
}

task("Multiply Stuff") {
  println("2 * 2 is \(2 * 2)")
}

runTasks("Add Stuff", "Multiply Stuff")
// 1 + 1 is 2
// 2 * 2 is 4
```

Tasks that don't exist:

```swift
runTask("Missing Task") // No task named 'Missing Task' exists
```

Composing multiple tasks:

```swift
task("Custom Task", "Add Stuff", "Multiply Stuff", "Missing Task")
runTask("Custom Task")
// 1 + 1 is 2
// 2 * 2 is 4
// No task named 'Missing Task' exists
```
