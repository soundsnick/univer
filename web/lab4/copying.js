const fs = require("fs");

fs.copyFile('copyingFile.txt', 'folder/hello.txt', err => console.log(err || 'Mission complete!'));
fs.copyFile('copyingFile.txt', 'folder/number_copy.txt', err => console.log(err || 'Mission complete!'));

fs.readFile('./folder/number_copy.txt', 'utf8', function(err, contents) {
    fs.writeFile("./folder/number_copy.txt", contents.split().map(n => n*n).join('\n'), (err) => err && console.log(err));
});