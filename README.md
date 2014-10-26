# bolt

This is a simple proof of concept for a
[`Rake`](https://en.wikipedia.org/wiki/Rake_(software)) like tool
written in Swift.

## Examples

(See `main.swift`)

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

### Now What?

If this proved to be an interesting idea, there would need to be a
`Rakefile` equivalent for bolt. This could be strange because
Swift/Objective-C do not have any `eval` like function. This could be
handled by piping the contents of this file into a temporary executable
script. If you have any thoughts on this concept please [open an
issue](https://github.com/Keithbsmiley/bolt/issues/new) where we can
discuss them.
