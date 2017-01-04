export const allTodos = (state) => {
  let todoIds = Object.keys(state.todos);
  let todosArray = todoIds.map((id) => {
    return state.todos[id];
  });
  return todosArray;
};

export const stepsByTodoId = (state, todoId) => {
  debugger;
  let stepsIds = Object.keys(state.steps);
  let stepsArray = [];
  stepsIds.forEach((id) => {
    if (state.steps[id].todoId === todoId) {
      stepsArray.push(state.steps[id]);
    }
  });
  return stepsArray;
};
