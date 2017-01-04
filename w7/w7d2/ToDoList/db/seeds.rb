# Todo.create(title: "Wake up", body: "New day! It's time to wake up.", done: true)
# Todo.create(title: "Eat breakfast", body: "Eggs with toast!", done: false)
# Todo.create(title: "Go to a/A", body: "Time for ToDoList part II!", done: true)
# Todo.create(title: "ToDoList", body: "Finish part II of ToDoList!", done: false)

todo0 = Todo.create!(
  title: "Pass all the assessments",
  body: "I am capable of crushing every assessment if I study enough",
  done: false
)

step01 = Step.create!(
  title: "A01",
  todo_id: todo0.id,
  done: false
)
step02 = Step.create!(
  title: "A02",
  todo_id: todo0.id,
  done: false
)
step03 = Step.create!(
  title: "A03",
  todo_id: todo0.id,
  done: false
)
step04 = Step.create!(
  title: "A04",
  todo_id: todo0.id,
  done: false
)
step05 = Step.create!(
  title: "A05",
  todo_id: todo0.id,
  done: false
)
step06 = Step.create!(
  title: "A06",
  todo_id: todo0.id,
  done: false
)

todo1 = Todo.create!(
  title: "Get a job",
  body: "I will become employed",
  done: false
)
step11 = Step.create!(
  title: "Prepare job search materials",
  todo_id: todo1.id,
  done: false
)
step12 = Step.create!(
  title: "Apply to companies",
  todo_id: todo1.id,
  done: false
)
step13 = Step.create!(
  title: "Do interviews",
  todo_id: todo1.id,
  done: false
)
step14 = Step.create!(
  title: "Negotiate offers",
  todo_id: todo1.id,
  done: false
)
step15 = Step.create!(
  title: "Begin employment",
  todo_id: todo1.id,
  done: false
)
step16 = Step.create!(
  title: "Spread the dev job love",
  todo_id: todo1.id,
  done: false
)

todo2 = Todo.create!(
  title: "Maintain personal hygiene",
  body: "My body is a temple",
  done: false
)

step20 = Step.create!(
  title: "Brush teeth",
  todo_id: todo2.id,
  done: false
)
step21 = Step.create!(
  title: "Shower regularly",
  todo_id: todo2.id,
  done: false
)
step22 = Step.create!(
  title: "Laundry",
  todo_id: todo2.id,
  done: false
)

todo3 = Todo.create!(
  title: "Exercise",
  body: "I will exercise more than my typing fingers",
  done: false
)
