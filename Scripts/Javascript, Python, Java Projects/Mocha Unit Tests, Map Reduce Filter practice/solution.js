'use strict';
const cheerio = require('cheerio'),
    fs = require('fs');

module.exports = {

   
  parseXML: (xml) => {
    const $ = cheerio.load(xml);
    return $('food').toArray().map(item => {
		
	let $item = $(item);
    let obj = {};
	  
	$item.children().each(function(){
	var key = $(this).prop('tagName').toLowerCase();
	var content = $(this).text();
	obj[key] = content;
	});	
	
	return obj;
    });
  },

  columnMapper : (data, column, mapper) => {

	var array1 = [];
	
	for (var i=0; i < data.length ; ++i)
        array1.push(data[i][column]);
	
    return array1.map(mapper);
  },


  columnSum: (data, column) => {

		var array1 = [];
		for (var i=0; i < data.length ; ++i)
		array1.push(parseFloat(data[i][column]));
	
		var reducer = (accumulator, currentValue) => accumulator + currentValue;
	
    return array1.reduce(reducer, 0);
  },


  columnFilter: (data, column, filter) => {
	  

	var array0 = [];
	var array1 = [];
	
	for (var i=0; i < data.length ; ++i){
		array0.push((data[i][column]));
	}
	
	console.log(array0);
	
	var array1 = array0.filter(filter);
	
	console.log(array1);
	
	var array2 = data.filter(
	
	function (e) {
		
     for (var i=0; i < data.length ; ++i){
	 
	 
	 
	 return e[column] ==  array1[0] || e[column] == array1[1] || e[column] == array1[2] || e[column] == array1[3] || e[column] == array1[4] }});


return array2;





}
}