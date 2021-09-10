<template>
  <div class="userPage">
  <div>
  <h3 id="user"><u>User Information</u></h3>
	<div class="userBox">
	<h5 id="userName"></h5>
	<h5 id="firstName"></h5>
	</div>
	</div>
<div>
<h3><u>This User's Posts</u></h3>
<div class="postsBox">
<div v-for="(post, i) in posts" :key="i" id="imagePosts">	
	<div><h2><u>{{post.description}}</u></h2></div>
	<div><img :src="require('./../../../backend/uploads/' + post.path)"></div>
	</div>
	
	</div>



</div>
  </div>
</template>

<script>
import axios from 'axios';


export default {
  name: 'userPosts',
  props: {
    userPosts: Object
  },
  data(){
		return{
		posts: []

		}
		},		


mounted(){
this.getUser()
this.getUserPosts()
},

methods: {


	getUser() {
	var id = this.$route.params.id;
	axios.get('http://localhost:4000/api/users/' + 	id).then((resp) => {
	this.posts = resp.data
	console.log(resp)
	
	
	
	console.log("ROURF" + id);
	document.getElementById("userName").innerHTML = "My email is: " + resp.data[0].email
	document.getElementById("firstName").innerHTML = "My name is: " + resp.data[0].firstname + " "+ resp.data[0].lastname
	}).catch(console.error)
	
},
	getUserPosts(){
	var email = this.$route.params.id;
	axios.get('http://localhost:4000/api/posts/' + 	email).then((resp) => {
	this.posts = resp.data
	console.log(resp)
	})
	
	}
	
	}
}




</script>

<style>

.userBox{
	display: flex;
	flex-direction: column;
	margin: auto;
	margin-top: 10px;
	outline: 2px solid #ff0054;
	padding: 10px;
	width: 40%;
	background: #2e000f;
}

.postsBox{
background: white;
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	justify-content: space-evenly;

	margin: auto;
	margin-top: 10px;
	outline: 2px solid #ff0054;
	padding: 10px;
	width: 50%;
	background: #2e000f;
}

h2{


}

</style>
