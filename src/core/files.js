const fs = require("fs");
var Estudiante = require('../models/Estudiante')
var Usuario = require('../models/Usuario')

module.exports = {
  Reader: function (logger) {
    return new Files(logger);
  }
};
class Files {
  constructor() {}
  async insertInDatabaseGrupos(data) {
    let base64File = data.base64.split(";base64,").pop();
    let text = (new Buffer(base64File, 'base64')).toString('utf8');
    let convert = this.csvJSON(text)
    let insertados = []
    let no_insertados = []
    let repetidos = []
    try {
      for (let index = 0; index < convert.length; index++) {
        const element = convert[index];
        if (element['EMAIL'] != undefined) {
        let usuario = await Estudiante.findOne({
          where: {
            estudiante: element['EMAIL'],
            grupo: element['GRUPO'],
            semestre: element['SEMESTRE']
          }
        })
        if (usuario) {
          repetidos.push(element)
        } else {
          let info = {
            estudiante: element['EMAIL'],
            grupo: element['GRUPO'],
            semestre: element['SEMESTRE']
          }
          Estudiante.create(info).then(e => {
            insertados.push(element)
          }).catch(err => {
            no_insertados.push(element)
          })
        }
      }
      }

      return {
        insertados: insertados,
        no_insertados: no_insertados,
        repetidos :repetidos
      }
    } catch (error) {
      return error
    }

  }
  async insertInDatabaseUsuarios(data) {
    let base64File = data.base64.split(";base64,").pop();
    let text = (new Buffer(base64File, 'base64')).toString('utf8');
    let convert = this.csvJSON(text)
    let insertados = []
    let no_insertados = []
    let repetidos = []
    try {
      for (let index = 0; index < convert.length; index++) {
        const element = convert[index];
        if (element['EMAIL'] != undefined) {
          let usuario = await Usuario.findOne({
            where: {
              correo: element['EMAIL']
            }
          })
          if (usuario) {
            repetidos.push(element)
          } else {
            let info = {
              correo: element['EMAIL'],
              contrasena: 'admin',
              nombre: element['NOMBRE ESTUDIANTE'],
              tipo: element['TIPO']
            }

            Usuario.create(info).then(e => {
              insertados.push(element)
            }).catch(e => {
              no_insertados.push(element)
            })
          }
        }
      }
      return {
        no_insertados: no_insertados,
        insertados: insertados,
        repetidos: repetidos
      }

    } catch (error) {
      return error
    }


  }
  csvJSON(csv) {
    var lines = csv.split("\n");
    var result = [];
    var headers = lines[0].split(";");

    for (var i = 1; i < lines.length; i++) {

      var obj = {};
      var currentline = lines[i].split(";");

      for (var j = 0; j < headers.length; j++) {
        if (currentline[j]) {
          headers[j] = headers[j].replace(/\r/g, "");
          obj[headers[j]] = (currentline[j]).replace(/\r/g, "");
        }
      }
      result.push(obj);
    }
    //return result; //JavaScript object
    return result; //JSON
  }

}