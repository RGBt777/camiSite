'use strict';
const cheerio = require('cheerio'),
    fs = require('fs');

module.exports = {
  /**
   * Takes an XML from data.xml and coverts it to an object.
   *
   * Note: You want to go over each child and set they key of
   * object to be the tagName of the child and the value its text.
   *
   * Remember: There is a distinction between a jQuery element and an HTML
   * element, make sure you understand which is which. line 21 creates a JQ element
   * form an Element.
   *
   * https://api.jquery.com/jQuery.each/
   * https://developer.mozilla.org/en-US/docs/Web/API/Element/tagName
   *
   * @param xml {String} The XML string.
   * @return {Array}
   */
   
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

  /**
   * Takes an array of objects and returns a
   * new array with the mapper function applied to each object.
   *
   * @param data {Array} The original array.
   * @param column {String} The column to apply the mapper function to.
   * @param mapper {Function} The mapper function.
   * @return {Array}
   */
  columnMapper : (data, column, mapper) => {
    // TODO: Finish this.
	//array1= data.map(function(){ return this.column; });
	
	var array1 = [];
	
	for (var i=0; i < data.length ; ++i)
        array1.push(data[i][column]);
	
    return array1.map(mapper);
  },

  /**
   * Sums the given column of an array of objects.
   *
   * @param data {Array} The original array.
   * @param column {String} The column to reduce.
   * @return {Number}
   */
  columnSum: (data, column) => {
    // TODO: Finish this.
	
		var array1 = [];
		for (var i=0; i < data.length ; ++i)
		array1.push(parseFloat(data[i][column]));
	
		var reducer = (accumulator, currentValue) => accumulator + currentValue;
	
    return array1.reduce(reducer, 0);
  },

  /**
   * Filters an array of objects and returns a subset
   * array with the filter function applied to each object.
   *
   * @param data {Array} The original array.
   * @param column {String} The column to apply the function to.
   * @param filter {Function} The filter function.
   * @return {Array}
   */
  columnFilter: (data, column, filter) => {
	  
    // TODO: finish this.
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