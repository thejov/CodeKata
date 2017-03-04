'use strict';

const assert = require('assert');
const karate_chop = require('../src/karate_chop.js');
const range = require('lodash.range');

describe('karate_chop', () => {

  describe('#chop()', () => {

    it('should return -1 when given empty array', () => {
      assert.equal( -1, karate_chop.chop(1, []) );
    });

    it('should return 0 when number found in array of size 1', () => {
      assert.equal( 0, karate_chop.chop(1, [1]) );
    });

    it('should return -1 when number not found in array', () => {
      assert.equal( -1, karate_chop.chop(2, [1]) );
      assert.equal( -1, karate_chop.chop(0, [1, 3, 5]) );
      assert.equal( -1, karate_chop.chop(2, [1, 3, 5]) );
      assert.equal( -1, karate_chop.chop(4, [1, 3, 5]) );
      assert.equal( -1, karate_chop.chop(6, [1, 3, 5]) );
      assert.equal( -1, karate_chop.chop(0, [1, 3, 5, 7]) );
      assert.equal( -1, karate_chop.chop(2, [1, 3, 5, 7]) );
      assert.equal( -1, karate_chop.chop(4, [1, 3, 5, 7]) );
      assert.equal( -1, karate_chop.chop(6, [1, 3, 5, 7]) );
      assert.equal( -1, karate_chop.chop(8, [1, 3, 5, 7]) );
    });

    it('should return index of searched number for an array with n elements', () => {      
      assert.equal( 0, karate_chop.chop(1, [1, 3, 5]) );
      assert.equal( 1, karate_chop.chop(3, [1, 3, 5]) );
      assert.equal( 2, karate_chop.chop(5, [1, 3, 5]) );

      assert.equal( 0, karate_chop.chop(1, [1, 3, 5, 7]) );
      assert.equal( 1, karate_chop.chop(3, [1, 3, 5, 7]) );
      assert.equal( 2, karate_chop.chop(5, [1, 3, 5, 7]) );
      assert.equal( 3, karate_chop.chop(7, [1, 3, 5, 7]) );
    });

    it('should return index of searched number for a huge array', () => {
      let huge_array = range(1, 100001);
      assert.equal( 0, karate_chop.chop(1, huge_array) );
      assert.equal( 99999, karate_chop.chop(100000, huge_array) );
      assert.equal( 998, karate_chop.chop(999, huge_array) );
    });

  });
});
