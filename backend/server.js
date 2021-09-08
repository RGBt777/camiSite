'use strict';

const express = require('express'),
    pkg = require('./package.json'),
    axios = require('axios'),
    SqlService = require('./services/SqlService'),
    passport = require('passport'),
	multer = require('multer');

require('dotenv').config()

const config = {
  port: process.env.SERVER_PORT,
  es: {
    host: process.env.ES_HOST,
    port: process.env.ES_PORT
  }
}

const app = express();

app.use(function (req, res, next) {

  res.setHeader('Access-Control-Allow-Origin', 'http://localhost:8080');

  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');

  res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');

  res.setHeader('Access-Control-Allow-Credentials', true);


  next();
});

app.use(express.json());

let JwtStrategy = require('passport-jwt').Strategy,
    ExtractJwt = require('passport-jwt').ExtractJwt;

let opts = {
  jwtFromRequest: ExtractJwt.fromUrlQueryParameter('token'),
  secretOrKey: process.env.JWT_SECRET
};

passport.use( new JwtStrategy(opts, (jwtPayload, done) => {
  console.log(jwtPayload);
  SqlService.getUser(jwtPayload.email, (err, results) => {
    if (err) {
      return done(err, false);
    }

    if (results.length) {
      return done(null, results);
    } else {
      return done(null, false);
    }
  })
}));

require('./lib/search')(app, config.es);
require('./lib/bundle')(app, config.es, passport);
require('./lib/user')(app, config.es, passport);
require('./lib/posts')(app, config.es, passport	);
require('./lib/file')(app, config.es, passport);

app.get('/api/version', (req, resp) => {
  resp.json({version: pkg.version});
})

app.get('/api/users/', passport.authenticate('jwt', {session: false}), (req, resp) => {
  axios.get(`http://localhost:9200/users/`)
      .then(esResp => {
        resp.json(esResp.data);
      })
      .catch(err => {
        resp.status(500).json(err);
      })
})
const fileFilter = (req, file, cb)=>{
	const allowedTypes = ["image/jpeg", "image/jpg", "image/png"]
	if(!allowedTypes.includes(file.mimetype)){
		const error = new Error("incorrect file!");
		error.code="INCORRECT_FILETYPE";
		return cb(error,false)
	}
	cb(null, true);
}

var storage = multer.diskStorage({
	destination: './uploads',
    filename: function (req, file, cb) {
        cb(null, file.originalname.toLowerCase())
  }
})

const upload = multer({
	storage: storage,
	fileFilter
});

	
app.post('/api/upload', upload.single('file'),(req, res)=>{
	console.log(req.file.filename);
	res.json({file: req.file});
});



app.use((err, req, res, next) => {
	if (err.code === "INCORRECT_FILETYPE"){
		res.status(422).json({error: 'Only images allowed'});
		return;
	}
});


app.listen(config.port, () => console.log(`Server started on ${config.port}`));