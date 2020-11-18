const fs = require("fs");
const fileArr = ["test.txt", "test2.txt", "test3.txt"];

fileArr.map(n => fs.unlink(`folder/${n}`, err => console.log(err || "Mission complete")));