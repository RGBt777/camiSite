const mysql = require('mysql'),
	bcrypt = require('bcrypt');

require('dotenv').config()

class SqlService {
	constructor(){
		console.log('Constructor');
		this.connection = mysql.createConnection( {
			host: process.env.DB_HOST,
			user: process.env.DB_USER,
			password: process.env.DB_PASS,
			database: 'it339'
	})
this.createPosts()
this.createUserTable();
	}
	createPosts() {
    this.connection.query(`CREATE TABLE IF NOT EXISTS posts (
      id INT NOT NULL AUTO_INCREMENT,
      email VARCHAR(255) NOT NULL,
      description VARCHAR(255),
	  path VARCHAR(255) UNIQUE,
      PRIMARY KEY (id)
    )`, (error, results, filed) => {
      console.log(error, results, filed)
    });
	}


	createUserTable() {
    this.connection.query(`CREATE TABLE IF NOT EXISTS users (
      id INT NOT NULL AUTO_INCREMENT,
      email VARCHAR(255) NOT NULL UNIQUE,
	  firstName VARCHAR(100) NOT NULL,
	  lastName VARCHAR(100) NOT NULL,
	  password VARCHAR(255) NOT NULL,
      PRIMARY KEY (id)
    )`, (error, results, filed) => {
      console.log(error, results, filed)
    });

	}
	
	createUser(user, callback) {
		bcrypt.hash(user.password, 10, (function(err, hash) {
			if(err){
				throw err;
			}
		user.password = hash;	
		this.connection.query('INSERT INTO users SET ?', user, callback);
	}).bind(this));
		
		
	}
	
  getUsers(callback) {
    this.connection.query(`SELECT id, firstname, email, lastName  FROM users`, callback);
  }
  
 getUser(email, callback) {
    this.connection.query(`SELECT * FROM users WHERE email = ?`,[email], callback);
}
 getUserPage(email, callback) {
    this.connection.query(`SELECT email, firstname, lastname FROM users WHERE email = ?`,[email], callback);
}

  getPosts(callback) {
	var testNo = 1;
    this.connection.query(`SELECT id, email, description, path  FROM posts	ORDER BY id DESC`, callback);
  }

   getPagePost(email, callback) {
    this.connection.query(`SELECT * FROM posts WHERE email = ? `,[email], callback);
}
  
	createPost(post, callback) {

	this.connection.query('INSERT INTO posts SET ?', post, callback);
}
		
		

}

module.exports = new SqlService();