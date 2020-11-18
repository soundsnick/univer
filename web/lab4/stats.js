const fs = require('fs');

fs.stat("/IITU", (err,stats) => err ? console.log(err) : console.log("Info: ", stats));