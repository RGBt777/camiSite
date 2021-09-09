'use strict';
const cheerio = require('cheerio');

const data = require('./data'),
    fs = require('fs'),
    a3 = require('../solution'),
    expect = require('chai').expect;
const xml = fs.readFileSync('data.xml');




  function parseXML(xml) {
	  
	  
    const $ = cheerio.load(xml);
    return $('food').toArray().map(item => {
      
	  
	  let $item = $(item);
      let obj = {};

	

//$item.each(function(index, value) {
	
	

  
  // index = $item.children().prop('tagName');
   //console.log(index);
//   value = $('food').children().text();
  //console.log(value);
//  obj[index] = value;
  
//});
	  
	$item.children().each(function(){
	var key = $(this).prop('tagName').toLowerCase();
	var content = $(this).text();
	obj[key] = content;
	});	
	  
	  
	  
      return obj;
	
    });
  
   
  
 
  
  
  }
  
  console.log(parseXML(xml));


//$('food') is converted to an array  

// obj are objects inside of the array $('food')	

//for every "food" make item equal to function
	
//console.log(parseXML(xml));
//console.log(testFilter(data, 'price', (x) => x < 7));
//console.log(testFilter(data, 'calories', (x) => x < 900));
//console.log(testFilter(data, 'calories', 650));
//console.log(data[0].calories);
	