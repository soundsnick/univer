const range = [...Array(10).keys()];
const oddSum = range.filter(n => !!(n%2)).reduce((accumulator, n) => accumulator + n, 0);
console.log(oddSum);