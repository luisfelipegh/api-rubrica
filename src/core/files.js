const fs = require("fs");
var Grupo = require('../models/Grupo')
var Usuario = require('../models/Usuario')

module.exports = {
  Reader: function (logger) {
    return new Files(logger);
  }
};
class Files {
  constructor() {}
  async insertInDatabase(data) {
    let base64File = data.base64.split(";base64,").pop();
    let buff = new Buffer(base64File, 'base64');
    let text = buff.toString('utf-8');
    let convert = this.csvJSON(text)
    for (let index = 0; index < convert.length; index++) {
      const element = convert[index];
      let insertar = true
      Usuario.findOne({
        where: {
          correo: element['EMAIL ']
        }
      }).then(usuario => {
        if (usuario) {
          insertar = false
        }
      })
    }
  }
  async insertInDatabaseUsuarios(data) {
    let base64File = data.base64.split(";base64,").pop();
    let buff = new Buffer(base64File, 'base64');
    let text = buff.toString('utf-8');
    let convert = this.csvJSON(text)
    let insertados = []
    let no_insertados = []
    for (let index = 0; index < convert.length; index++) {
      const element = convert[index];
      let insertar = true
      if (element['EMAIL'] != undefined) {
        let usuario = await Usuario.findOne({where: { correo: element['EMAIL']}})
        if (usuario == null){
          let info = {
                  correo: element['EMAIL'],
                  contrasena: element['EMAIL'],
                  nombre: element['NOMBRE_ESTUDIANTE'],
                  tipo: element['TIPO ']
                }
          let insert = await Usuario.create(info)
          console.log(insert);
          
        }
      }
    }
    return {
      no_insertados: no_insertados,
      insertados: insertados
    }


  }
  csvJSON(csv) {

    var lines = csv.split("\n");
    var result = [];
    var headers = lines[0].split(",");

    for (var i = 1; i < lines.length; i++) {

      var obj = {};
      var currentline = lines[i].split(",");

      for (var j = 0; j < headers.length; j++) {
        headers[j] = headers[j].replace(/\r/g, " ");
        obj[headers[j]] = currentline[j].replace(/\r/g, " ");
      }

      result.push(obj);

    }
    //return result; //JavaScript object
    return result; //JSON
  }
}