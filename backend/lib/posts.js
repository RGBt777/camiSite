'use strict';

const sqlService = require('../services/SqlService'),
    bcrypt = require('bcrypt'),
    jwt = require('jsonwebtoken'),
	passport = require('passport');

require('dotenv').config()

module.exports = (app, es, passport) => {
  app.post('/api/post/', (req, resp) => {
    sqlService.createPost(req.body, (err, results) => {
      if (err) {
        return resp.status(500).json(err);
      }

      resp.json(results);
    })
  })

  app.get('/api/posts', (req, resp) => {
    sqlService.getPosts((err, results) => {
	  
      if (err) {
        return resp.status(500).json(err);
      }
      resp.json(results);
    });
  });
  


  app.get('/api/posts/:email', (req, resp) => {
      sqlService.getPagePost(req.params.email, (err, results, filed) => {
      if (err) {
        return resp.status(500).json(err);
      }

      resp.json(results);
    });
  }); 
  
  

  }