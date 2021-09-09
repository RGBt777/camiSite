'use strict'

const data = require('./data'),
    fs = require('fs'),
    a3 = require('../solution'),
    expect = require('chai').expect;

const xml = fs.readFileSync('data.xml');

describe('Mapper Tests', () => {
  it('Should return an array', () => {
    let result = a3.columnMapper([], '', () => {});
    expect(result).to.be.an('array');
    expect(result).to.be.empty;
  });

  it('Should map correctly', () => {
    let result = a3.columnMapper(data, 'calories', (x) => x/100);

    expect(result).to.be.an('array');
    expect(result).to.have.lengthOf(data.length);
    expect(result).to.not.deep.equal(data);
    expect(result).to.deep.equal(data.map(item => item.calories / 100));
  })
})

describe('Reduce Tests', () => {
  it('Should return a number', () => {
    let result = a3.columnSum([], '');
    expect(result).to.be.a('number');
  });

  it('Should map correctly', () => {
    let totalCal = a3.columnSum(data, 'calories');
    let totalPrice = a3.columnSum(data, 'price');

    expect(totalCal).to.be.a('number');
    expect(totalCal).to.equal(data.reduce((acc,item) => acc + parseFloat(item.calories), 0));
    expect(totalPrice).to.be.a('number');
    expect(totalPrice).to.equal(data.reduce((acc,item) => acc + parseFloat(item.price), 0));
  })
})

describe('Filter Tests', () => {
  it('Should return an array', () => {
    let result = a3.columnFilter([], '', () => {});
    expect(result).to.be.an('array');
    expect(result).to.be.empty;
  });

  it('Should filter correctly', () => {
    let lowCal = a3.columnFilter(data, 'calories', (x) => x < 600);
    let cheap = a3.columnFilter(data, 'price', (x) => x < 7);

    expect(lowCal).to.be.an('array');
    expect(lowCal).to.deep.equal(data.filter((item) => item.calories < 600));
    expect(cheap).to.be.an('array');
    expect(cheap).to.deep.equal(data.filter((item) => item.price < 7));
  })
})

describe('Parse XML Tests', () => {
  it('Should return an array and correct content', () => {
    let result = a3.parseXML(xml);
    expect(result).to.be.an('array');
    expect(result).to.deep.equal(data);
  });
})