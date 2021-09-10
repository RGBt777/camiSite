<template>
<div id="app">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400&display=swap" rel="stylesheet"> 
    <div id="nav">
	<h1>Cami's <span style="color:red">R</span><span style="color:green">G</span><span style="color:blue">B</span><span style="color:magenta">t</span></h1>
	<h2>Image-Sharing Site</h2>
	<div id="loggedIn">Not Logged In</div>
	<br>
    <router-link to="/">Home</router-link> |
    <router-link to="/about">About</router-link> |
	<router-link to="/register">Register</router-link> |
	<router-link to="/login">Login</router-link> |
	<router-link to="/post">Post Image</router-link>
    </div>
	<div class="breakMain"></div>

    <router-view/>
	
	<footer><div class="breakMain"></div><h5>Website created by Camilla Marzella</h5></footer>
  </div>

</template>

<style>
html {
  overflow-y: scroll;

  

}
#app {
      font-family: 'Roboto', sans-serif;


  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #ff0054;

}

body { 
background-color: black;
}


#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: yellow;
}

#nav a.router-link-exact-active {
  color: #778d00;
}

#app{
display: flex;
margin: auto;
flex-direction: column;
justify-content: center;


}

.breakMain {
height: 5px;
width: 900px;
margin: auto;
background: #ff0054;
}
footer{
margin-top: 20px;
}
</style>
