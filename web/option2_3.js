const format = (n) => String(n).length < 2 ? ` ${n}` : n;
const range = [...Array(9).keys()].map(n => n+1);
const table = range.map(n => range.map(m => format(n*m)).join('|')).join('\n');
console.log(table);