const http = require('http');
const { exec } = require('child_process');
const PORT = 9988;

const deployServer = http.createServer(function(request, response) {
  if (request.url.search(/quote\/?$/i) > 0) {

    let commands = [
      'cd /var/www/ubaojia',
      'git pull origin master'
    ].join(' && ');

    exec(commands, (err, stdout, stderr)=> {
      if (err) {
        response.writeHead(500);
        response.end('Server Internal Error.');
        throw err;
      }
      process.stderr.write(err);
      process.stdout.write(stdout);
      response.writeHead(200);
      response.end('Deploy Done.');
    });
  }else if (request.url.search(/pktime\/?$/i) > 0) {

    let commands = [
      'cd /var/www/pktime',
      'git pull origin master'
    ].join(' && ');

    exec(commands, (err, stdout, stderr)=> {
      if (err) {
        response.writeHead(500);
        response.end('Server Internal Error.');
        throw err;
      }
      process.stderr.write(err);
      process.stdout.write(stdout);
      response.writeHead(200);
      response.end('Deploy Done.');
    });
  } else {
    response.writeHead(404);
    response.end('Not Found.');
  }
});

deployServer.listen(PORT);
