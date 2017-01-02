export const allTodos = (state) => {
  let todoIds = Object.keys(state.todos);
  let todosArray = todoIds.map((id) => {
    return state.todos[id];
  });
  return todosArray;
};
