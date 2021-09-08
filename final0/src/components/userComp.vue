<template>
  <div class="post">
	<div class="centerPlease">
	<h3><u>Posts</u></h3>
	
	<div v-for="(post, a) in posts" :key="a" id="imagePosts">	
	<div class="postCont">
	
	<div><h4><u>{{post.description}}</u></h4></div>
	
	<div><img :src="require('./../../../backend/uploads/' + post.path)"></div>
	
	
	<div><h5>This wonderful image was posted by: <router-link :to="{name: 'Data', params: { id: post.email}}">{{post.email}}</router-link></h5></div>
	
	</div>

	</div>

	</div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  name: 'Post',
  props: {
    post: Object
  },
	data(){
	return {
	"from": 0,
    "size": 0,	
	posts: []
	}     

	},
	
	mounted() {
	this.getPosts();
	
	},
	
	methods: {
		getPosts() {
		axios.get('http://localhost:4000/api/posts',{
        params: {
		
		from: this.from,
        size: this.size
         
        }
      }).then((resp) => {
	this.posts = this.posts.concat(resp.data)
	console.log(resp)
	console.log(resp.data[0].path)
	}).catch(console.error)
	
}
}
}
</script>


<style>


</style>