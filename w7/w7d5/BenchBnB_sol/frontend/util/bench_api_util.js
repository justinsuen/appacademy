export const fetchBenches = (data) => {
  return $.ajax({
    method: 'GET',
    url: 'api/benches',
    data
  });
};

export const fetchBench = (id) => {
  return $.ajax({
    method: 'GET',
    url: `api/benches/${id}`
  });
};

export const createReview = (data) => {
  return $.ajax({
    method: 'POST',
    url: 'api/reviews',
    data
  });
};

export const createBench = (data) => {
  return $.ajax({
    method: 'POST',
    url: 'api/benches',
    data
  });
};
