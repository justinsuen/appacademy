export const selectBench = ({ benches, reviews }, id) => {
   const bench = benches[id] || {};
   return bench
}

export const asArray = ({ benches }) => Object.keys(benches).map(key => benches[key]);

