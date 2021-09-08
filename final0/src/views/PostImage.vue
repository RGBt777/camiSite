<template>
  <div class="post">
    <h3><u>Post Image</u></h3>

	
<div class="uploadCont">

    <div id="errorBox"></div>
    <form id="signup-form">
	
    <div class="field">
    <label class="label">Image Title</label>
	<br>
    <input id="descInput" type="text" class="input" name="description">
    </div> 
	<br>
    <label class ="fileLabel">
	
    <input class="filer" type="file" ref="file" v-on:change="handleFileUpload()"/>

      </label>

	<br>
	<br>
    <button  type="button" v-on:click="submitFile()">Submit</button>


    </form>

  </div>
  </div>
</template>

<script>
import axios from 'axios';
import postLogin from './Login.vue';

export default {
  name: 'Users',
  components: {},
  data() {
    return {
	file: '',

    }
  },
  mounted() {
	console.log(postLogin.postLogin);
    this.isNew = !this.$route.params.id;
    if (!this.isNew) {
      this.getUser();
    }

  },

  methods: {
  
  data(){
  return {
    file: ''
  }
},
  handleFileUpload(){
	const allowedTypes = ["image/jpeg", "image/jpg", "image/png"];
    const file = this.$refs.file.files[0];
	this.file = file;
	if(!allowedTypes.includes(file.type)){
	this.message="ONLY IMAGES!!"
	document.getElementById('errorBox').innerHTML = "<h4 style='color:red'>"+"Only jpeg, jpg, and png buddy!!!!"+"</h4>";
	return
	}
  },
  
	submitFile(){
	const allowedTypes = ["image/jpeg", "image/jpg", "image/png"];
	if(document.getElementById("setUser") == null){
	document.getElementById('errorBox').innerHTML = "<h4 style='color:red'>"+"Please log in first!"+"</h4>";
	return console.log('love lain')
	}
	if(document.getElementById("descInput").value.length == 0){
	document.getElementById('errorBox').innerHTML = "<h4 style='color:red'>"+"Please include a title!!"+"</h4>";
	return console.log('love lain')
	}
	else{
	console.log('cyberia')
	document.getElementById('errorBox').innerHTML = "<h4 style='color:cyan'>"+"Post Created!"+"</h4>";
	
	}
	const formData = new FormData();
	formData.append('file', this.file);
	var filename = this.file.name;
	
	console.log(filename);

	axios.post('http://localhost:4000/api/upload', formData)
  .then(function (response) {
    console.log(response);
	const dbName = response.data.file.filename;
	console.log(dbName);
  }).catch((err) => {
		if(err.response) {
		document.getElementById('errorBox').innerHTML = "<h4 style='color:red'>"+"Only .png, .jpeg, or .jpg!"+"</h4>";
		throw console.log("HAHAHAHAHA");
		
		}})
	
	if(allowedTypes.includes(this.file.type)){
	axios.post('http://localhost:4000/api/post', {"email": document.getElementById("setUser").innerHTML, "description": document.getElementById('descInput').value ,"path": filename.toLowerCase() })
	.then(function (response) {
    console.log(response);
  }).catch((err) => {
		if(err.response) {
		document.getElementById('errorBox').innerHTML = "<h4 style='color:red'>"+"Enter a UNIQUE filename!!!!!"+"</h4>";
		throw console.log("HAHAHAHAHA");
		}})
	}
	else{
	console.log('I am your DNA');
	}
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
.uploadCont{
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

.filer {
	margin: auto;
}
</style>