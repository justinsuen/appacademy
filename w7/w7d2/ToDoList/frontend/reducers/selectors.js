export const allTodos = ({ todos }) => {
  let todo_ids = Object.keys(todos);
  let todosArray = todo_ids.map((id) => {
    return todos[id];
  });
  return todosArray;
};

export const stepsByTodoId = ({ steps }, todo_id) => {
  let stepsIds = Object.keys(steps);
  let stepsArray = [];
  stepsIds.forEach((id) => {
    if (steps[id].todo_id === todo_id) {
      stepsArray.push(steps[id]);
    }
  });
  return stepsArray;
};
