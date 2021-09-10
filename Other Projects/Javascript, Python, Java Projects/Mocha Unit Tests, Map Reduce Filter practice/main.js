const fs = require('fs'),
    a3 = require('./solution');

const xml = fs.readFileSync('data.xml');

console.log(a3.parseXML(xml));