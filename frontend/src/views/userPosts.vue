<template>
  <div class="home">
  <post></post>

  </div>
</template>

<script>
import post from './../components/userComp'



export default {
	name: 'userPost',
	components: {
	post
	},

}

</script>
<style>

img{
	max-width: 300px;
	

}



.home{
	margin: auto;
}

.break {
height: 1px;
width: 300px;
margin: auto;
background: yellow;
}
.postCont {
	color: #ff0054;
	outline: 2px solid #ff0054;
	padding: 10px;
	background: #2e000f;
	margin-bottom: 50px;

}

a{
color: yellow;
}

</style>