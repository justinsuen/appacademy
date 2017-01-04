export const allTodos = ({ todos }) => {
  let todoIds = Object.keys(todos);
  let todosArray = todoIds.map((id) => {
    return todos[id];
  });
  return todosArray;
};

export const stepsByTodoId = ({ steps }, todoId) => {
  debugger;
  let stepsIds = Object.keys(steps);
  let stepsArray = [];
  stepsIds.forEach((id) => {
    if (steps[id].todoId === todoId) {
      stepsArray.push(steps[id]);
    }
  });
  return stepsArray;
};
