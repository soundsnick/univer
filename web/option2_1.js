const range = [...Array(10).keys()];
const square = (n) => n*n;
const squaredRange = range.map(n => square(n+1));
console.log(squaredRange.join(' '));