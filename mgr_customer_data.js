http = require('http');

function download_customer_data(callback) {
  // to implement you download logic here, invoke callback() if success
  // otherwise invoke callback(err)
  console.log("download.....")
  callback()
}


function backup_customer_data(callback) {
  // to implement your backup logic here, to invode callback when done
  console.log("backup.....")
  callback()
}

console.log("start to download cutomer data...")
http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end('Hello World\n');
}).listen(1337, '127.0.0.1');
download_customer_data(function(err){
  if(err){
    console.log("failed to download data")
    process.exit(1)
  }
  process.on("SIGTERM", function(){
    backup_customer_data(function(){
      process.exit(0)
    })
  })
})

