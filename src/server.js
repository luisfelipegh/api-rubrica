var express = require('express');
var bodyParser = require('body-parser');
var cors = require('cors')
const jwt = require('jsonwebtoken');

var app = express();
app.use(cors({origin: '*' }))
app.use(bodyParser.json({ limit: "50mb" }));
app.use(bodyParser.urlencoded({ limit: "50mb", extended: true, parameterLimit: 50000 }));

//LOGIN
var login = require("./controllers/login")
app.post('/api/login',(req,res)=>{
  login.login(req,res)
})

//ROUTES
let vs = '/api'
const routes = require("./routes");
app.use(vs, verifyToken ,routes);

//JWT
function verifyToken(req, res, next) {
  if (!req.headers)
      return res.status(400).send({ error: 'No headers' })
  let {token} = req.headers;
  jwt.verify(token, 'rubrica', function(err, decoded) {
    if(err) {
      return res.status(403).send({error: 'No permission' })
    }
    next()
  });
}

app.use(function (req, res, next) {
  res.send({api: "Rubrica de Evaluacion"});
});

//Running Port 
port = process.env.PORT || 3005
app.listen(port, function () {
  console.log('Node api is running on:', 'http://localhost:' + port + vs, "\n");
});
