import Foundation

struct TaskList {
  let tasks: [Task]
  init(_ tasks: [Task] = []) {
    self.tasks = tasks
  }

  func runTask(name: String) {
    let task = self.tasks.filter { $0.name == name }.first
      ?? Task.missingTask(name)
    task.run()
  }

  func runTasks(names: [String]) {
    if names.count < 1 {
      return
    }

    for name in names {
      runTask(name)
    }
  }
}

var taskList = TaskList()

func runTask(name: String) {
  taskList.runTask(name)
}

func runTasks(names: String...) {
  taskList.runTasks(names)
}

func task(name: String, description: String?, action: () -> ()) -> Task {
  let task = Task(name: name, description: description, action: action)
  var newTasks = taskList.tasks
  newTasks.append(task)
  taskList = TaskList(newTasks)
  return task
}

func task(name: String, action: () -> ()) -> Task {
  return task(name, nil, action)
}

func task(name: String, tasks: String...) -> Task {
  return task(name, nil) {
    taskList.runTasks(tasks)
  }
}
