module.exports = {
  BAD_REQUEST: {
    status: 400,
    response: {
      success: false,
      message: "Parámetros incompletos",
      info: {}
    }
  },
  UNAUNTHORRIZED: {
    status: 401,
    response: {
      success: false,
      message: "Operacion no autorizada",
      info: {}
    }
  },
  NOT_FOUND: {
    status: 404,
    response: {
      success: false,
      message: "Recurso no encontrado",
      info: {}
    }
  },
  NO_RESPONSE: {
    status: 204,
    response: {
      success: true,
      message: "Operación exitosa",
      info: {}
    }
  }
}