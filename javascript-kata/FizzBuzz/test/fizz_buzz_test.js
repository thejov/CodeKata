'use strict';

const assert = require('assert');
const fizzBuzz = require('../src/fizz_buzz.js') 

describe('FizzBuzz', function() {

  describe('#generate()', function() {

    it('when given 15 should return fizz buzz up to 15', () => {
      const expected = "1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, "
        + "11, Fizz, 13, 14, Fizz Buzz";
      assert.equal(expected, fizzBuzz.generate(15));
    });

    it('when given 100 should return fizz bzz up to 100', () => {
      const expected = '1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, Fizz Buzz, 16, 17, Fizz, 19, Buzz, '
        + 'Fizz, 22, 23, Fizz, Buzz, 26, Fizz, 28, 29, Fizz Buzz, 31, 32, Fizz, 34, Buzz, Fizz, 37, 38, Fizz, Buzz, '
        + '41, Fizz, 43, 44, Fizz Buzz, 46, 47, Fizz, 49, Buzz, Fizz, 52, 53, Fizz, Buzz, 56, Fizz, 58, 59, Fizz Buzz, '
        + '61, 62, Fizz, 64, Buzz, Fizz, 67, 68, Fizz, Buzz, 71, Fizz, 73, 74, Fizz Buzz, 76, 77, Fizz, 79, Buzz, '
        + 'Fizz, 82, 83, Fizz, Buzz, 86, Fizz, 88, 89, Fizz Buzz, 91, 92, Fizz, 94, Buzz, Fizz, 97, 98, Fizz, Buzz';

      assert.equal(expected, fizzBuzz.generate(100));
    });

    it('when given 0 should return empty string', () => {
      assert.equal("", fizzBuzz.generate(0));
    });

    it('when given negative value should return empty string', () => {
      assert.equal("", fizzBuzz.generate(-1));
      assert.equal("", fizzBuzz.generate(-7));
      assert.equal("", fizzBuzz.generate(-100));
    });

  });

});