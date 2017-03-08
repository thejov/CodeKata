'use strict';

const assert = require('assert');
const karateChop = require('../src/karate_chop.js');
const range = require('lodash.range');

describe('karate_chop', () => {

  describe('#chop()', () => {

    it('should return -1 when given empty array', () => {
      assert.equal( -1, karateChop.chop(1, []) );
    });

    it('should return 0 when number found in array of size 1', () => {
      assert.equal( 0, karateChop.chop(1, [1]) );
    });

    it('should return -1 when number not found in array', () => {
      assert.equal( -1, karateChop.chop(2, [1]) );
      assert.equal( -1, karateChop.chop(0, [1, 3, 5]) );
      assert.equal( -1, karateChop.chop(2, [1, 3, 5]) );
      assert.equal( -1, karateChop.chop(4, [1, 3, 5]) );
      assert.equal( -1, karateChop.chop(6, [1, 3, 5]) );
      assert.equal( -1, karateChop.chop(0, [1, 3, 5, 7]) );
      assert.equal( -1, karateChop.chop(2, [1, 3, 5, 7]) );
      assert.equal( -1, karateChop.chop(4, [1, 3, 5, 7]) );
      assert.equal( -1, karateChop.chop(6, [1, 3, 5, 7]) );
      assert.equal( -1, karateChop.chop(8, [1, 3, 5, 7]) );
    });

    it('should return index of searched number for an array with n elements', () => {      
      assert.equal( 0, karateChop.chop(1, [1, 3, 5]) );
      assert.equal( 1, karateChop.chop(3, [1, 3, 5]) );
      assert.equal( 2, karateChop.chop(5, [1, 3, 5]) );

      assert.equal( 0, karateChop.chop(1, [1, 3, 5, 7]) );
      assert.equal( 1, karateChop.chop(3, [1, 3, 5, 7]) );
      assert.equal( 2, karateChop.chop(5, [1, 3, 5, 7]) );
      assert.equal( 3, karateChop.chop(7, [1, 3, 5, 7]) );
    });

    it('should return index of searched number for a huge array', () => {
      let hugeArray = range(1, 100001);
      assert.equal( 0, karateChop.chop(1, hugeArray) );
      assert.equal( 99999, karateChop.chop(100000, hugeArray) );
      assert.equal( 998, karateChop.chop(999, hugeArray) );
    });

  });
});
