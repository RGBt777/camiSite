<template>
  <div class="login">
    <h3><u>Login</u></h3>

	
<div class="loginCont">


    
	
    <form id="signup-form">
	<div id="errorBox"></div>
    <div class="field">
    <label class="label">Email</label>
	<br>
    <input id="emailInput" >
    </div>
	<br>
	<div class="field">
    <label class="label">Password</label>
	<br>
    <input id="passInput" type="password" class="input" name="name">
    </div>
	<br>
	
    <div>
    <button id="postForm" type="button" v-on:click="postLogin()" >Submit</button>
    </div>
    </form>

  </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'Users',
  components: {},
  data() {
    return {
      isNew: true,
      bundle: {
        _source: {
          firstName: '',
          lastName: '',
          email: '',
        }
      }
    }
  },
  mounted() {
  
    this.isNew = !this.$route.params.id;
    if (!this.isNew) {
      this.getUser();
    }

  },

  methods: {
  //CHECK IF FIELDS ARE EMPTY, STAR OUT PASSWORD, "YOU HAVE REGISTEred" page
	postLogin(){
	const testVar = "Hi!!"
	console.log("bad" + testVar);
	var mailformat = /(.+)@(.+){2,}\.(.+){2,}/;
	var email = document.getElementById('emailInput').value.toLowerCase();
	console.log(mailformat.test(email));
	var test = mailformat.test(email).toString();
	console.log(test);
	if (test == "false"){
	document.getElementById('errorBox').innerHTML = "<h4 style='color:red'>"+"enter a real email!"+"</h4>";
	return console.log("PRESENT DAY");
	}
	else if ( document.getElementById('passInput').value.length == 0 ){
	document.getElementById('errorBox').innerHTML = "<h4 style='color:red'>"+"fill in all forms!"+"</h4>";
	console.log("ENTER SOMTHIN");
	return console.log("BYE!");
	}
	
	
	
	axios.post('http://localhost:4000/api/login', {"email": document.getElementById('emailInput').value.toLowerCase(), "password": document.getElementById('passInput').value})
  .then(function (response) {
    console.log(response);
	console.log(document.getElementById("emailInput").value);
	const setUser = response.data.user.email;
	console.log(setUser)
	document.getElementById('errorBox').innerHTML = "<h4 style='color:cyan'>"+"User "+ setUser.toLowerCase() + " has logged in!</h4>";
	document.getElementById("loggedIn").innerHTML = "Username: <div id = setUser>" + setUser.toLowerCase() + "</div>";
	
	console.log(setUser);
  }).catch((err) => {
		if(err.response) {
		document.getElementById('errorBox').innerHTML = "<h4 style='color:red'>"+"Email not registered or password incorrect!"+"</h4>";
		console.log("PRESENT TIME");
		}})
  },
    getUser() {
      axios.get(`http://localhost:4000/api/User/${this.$route.params.id}`)
      .then((resp) => this.bundle = resp.data)
      .catch(console.error);
    },
    updateUser(e) {
      e.preventDefault();
      console.log('updating the user!');
      axios({
        url: `http://localhost:4000/api/users/${this.isNew ? '' : this.$route.params.id}`,
        method: this.isNew ? 'POST' : 'PUT',
        data: {
          name: this.user._source.firstName,
          description: this.user._source.email,
          books: this.user._source.lastName,
        }
      }).then((resp) => {
        console.log(resp);
        this.$router.push('/user');
      }).catch(console.error)
    }
  }
}
</script>
<style>
.loginCont{
	display: flex;
	flex-direction: column;
	margin: auto;
	justify-content: left;
	outline: 2px solid #ff0054;
	padding: 10px;
	width: 50%;
	background: #2e000f;
	}
#errorBox{

display: flex;
flex-direction: row;
margin: auto;
justify-content: center;
flex-wrap: no-wrap;
}
</style>