const fs = require("fs");
var Grupos = require('../models/Grupos')

module.exports = {
  Reader: function(logger) {
    return new Files(logger);
  }
};
class Files {
  constructor() {
  }
  async insertInDatabase(data) {
    let base64File = data.base64.split(";base64,").pop();
    let buff = new Buffer(base64File, 'base64');
    let text = buff.toString('utf-8');
    let convert = this.csvJSON(text)
    console.log(data);
    
    console.log(convert);
    


  }
   csvJSON(csv){

    var lines=csv.split("\n");
    var result = [];
    var headers=lines[0].split(";");
    
    for(var i=1;i<lines.length;i++){
  
        var obj = {};
        var currentline=lines[i].split(";");
  
        for(var j=0;j<headers.length;j++){
            headers[j] =headers[j].replace(/\r/g, " ");
            obj[headers[j]] = currentline[j].replace(/\r/g, " ");
        }
  
        result.push(obj);
  
    }
    //return result; //JavaScript object
    return result; //JSON
  }
}
