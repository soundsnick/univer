var fs = require('fs');
var http = require('http');

http.createServer((request, responce) => {
  if (request.url != '/favicon.ico') {
    if (request.url.endsWith('.css')){
      var css = request.url.slice(1);
      fs.readFile(`./assets/${css}`, (err,data) => {
        if (err) throw err;
        responce.setHeader('Content-Type', 'text/css');
        responce.statusCode = 200;
        responce.write(data);
        responce.end();
      });
    } else{
      getPage(request.url, responce);
    }
  }
}).listen(8080);

function getPage(name, responce, statusCode = 200) {
  if (name == '/') {
    name = 'index';
  }
  fs.readFile('views/application.html', "utf-8", (errTe, dataTe) => {
    if(!errTe){
      fs.readFile('views/' + name + '.html', "utf-8", (err, data) => {
        if (!err) {
          responce.setHeader('Content-Type', 'text/html');
          responce.statusCode = statusCode;
          responce.write(dataTe.replace('{{body}}', data));
          responce.end();
        } else {
          if (statusCode != 404) {
            getPage('404', responce, 404);
          } else {
            throw err;
          }
        }
      });
    }
    else {
      throw "Template file not found"
    }
  })
  
}