export const fetchSteps = todoId => (
 $.ajax({
    method: 'GET',
    url: `/api/todos/${todoId}/steps`
  })
);

export const createStep = (todoId, step) => (
  $.ajax({
    method: 'POST',
    url: `/api/todos/${todoId}/steps`,
    data: { step }
  })
);

export const updateStep = step => (
$.ajax({
    method: 'PATCH',
    url: `/api/steps/${step.id}`,
    data: { step }
  })
);

export const destroyStep = step => (
$.ajax({
    method: 'DELETE',
    url: `/api/steps/${step.id}`
  })
);
