<template>
  <div class="register">
    <h3><u>Register</u></h3>
	
	
<div class="registerCont">

    
    <form id="signup-form">
	<div id="errorBox"></div>
    <div class="field">
    <label class="label">First Name</label>
	<br>
    <input id="fNameInput" type="text" class="input" name="name">
    </div> 
	<br>
	<div class="field">
    <label class="label">Last Name</label>
	<br>
    <input  id="lNameInput" type="text" class="input" name="name">
    </div>
	<br>
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
    <button id="postForm" type="button" v-on:click="postUser()" >Submit</button>
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
	postUser(){
	var mailformat = /(.+)@(.+){2,}\.(.+){2,}/;
	var email = document.getElementById('emailInput').value.toLowerCase();
	console.log(mailformat.test(email));
	var test = mailformat.test(email).toString();
	console.log(test);
	if (test == "false"){
	document.getElementById('errorBox').innerHTML = "<h4 style='color:red'>"+"enter a real email!"+"</h4>";
	return 
	}
	else if (document.getElementById('fNameInput').value.length == 0){
	console.log("ENTER SOMTHIN");
	return document.getElementById('errorBox').innerHTML = "<h4 style='color:red'>"+"fill all the boxes!!!"+"</h4>";
	}
	else if (document.getElementById('lNameInput').value.length == 0 ){
		console.log("ENTER SOMTHIN");
	return document.getElementById('errorBox').innerHTML = "<h4 style='color:red'>"+"fill all the boxes!!"+"</h4>";
	
	}
	else if (document.getElementById('emailInput').value.length == 0 ){
		console.log("ENTER SOMTHIN");
	return document.getElementById('errorBox').innerHTML = "<h4 style='color:red'>"+"fill all the boxes!!!"+"</h4>";
	
	}
	else if ( document.getElementById('passInput').value.length == 0 ){
		console.log("ENTER SOMTHIN");
	return document.getElementById('errorBox').innerHTML = "<h4 style='color:red'>"+"fill all the boxes!!"+"</h4>";

	}
	
	
	
	axios.post('http://localhost:4000/api/user', {"firstName": document.getElementById('fNameInput').value	, "lastName": document.getElementById('lNameInput').value, "email": document.getElementById('emailInput').value.toLowerCase(), "password": document.getElementById('passInput').value})
  .then(function (response) {
    console.log(response);
	console.log(document.getElementById("emailInput").value)
	var userName = document.getElementById("emailInput").value;
	document.getElementById('errorBox').innerHTML = "<h4 style='color:cyan'>"+"User " + userName.toLowerCase() + " has been registered! </h4>";
	
  }).catch((err) => {
		if(err.response) {
		console.log("HAHAHAHAHA");
		document.getElementById('errorBox').innerHTML = "<h4 style='color:red'>"+"enter a unique email!!!!"+"</h4>";
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
.registerCont{
	display: flex;
	flex-direction: column;
	margin: auto;
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