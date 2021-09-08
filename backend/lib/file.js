'use strict';

const sqlService = require('../services/SqlService'),
    bcrypt = require('bcrypt'),
    jwt = require('jsonwebtoken'),
	passport = require('passport'),
	fs = require('fs'),
	multer = require('multer'),
	cors = require('cors');



const upload = multer({
	dest: './uploads',
});

require('dotenv').config()

module.exports = (app, es, passport) => {
  app.post('/upload', upload.single('file'),(req, resp) => {
   res.json({file: 'uploaded file'});

  })
  
    app.get('/api/file/', (req, resp) => {
   
  })


}