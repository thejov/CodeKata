'use strict';

const assert = require('assert');
const range = require('lodash.range');
const sortingBalls = require('../src/sorting_balls');

describe('SortingBalls', function() {

  describe('#sort()', function() {

    it('should return empty array if given empty array', function() {
      assert.deepStrictEqual([], sortingBalls.sort([]));
    });

    it('should return same array when given array with one element', function() {
        assert.deepStrictEqual([6], sortingBalls.sort([6]));
    });

    it('should return same array when already sorted', function() {
        assert.deepStrictEqual([1,2,3], sortingBalls.sort([1,2,3]));
        assert.deepStrictEqual([1,23,98,101,102,1009], sortingBalls.sort([1,23,98,101,102,1009]));
    });

    it('should return sorted array when given is unsorted', function() {
        assert.deepStrictEqual([1,2], sortingBalls.sort([2,1]));

        assert.deepStrictEqual([1,2,3], sortingBalls.sort([3,2,1]));
        assert.deepStrictEqual([1,2,3], sortingBalls.sort([2,3,1]));
        assert.deepStrictEqual([1,2,3], sortingBalls.sort([1,3,2]));

        assert.deepStrictEqual([1,23,98,101,102,1009], sortingBalls.sort([23,1009,1,102,98,101]));
    });

    it('should return sorted array when given huge unsorted array', function() {
        const huge_unsorted = range(2001, 3001).concat(range(1,1001).reverse());
        const huge_sorted = range(1,1001).concat(range(2001,3001));

        assert.deepStrictEqual(huge_sorted, sortingBalls.sort(huge_unsorted));
    });

    // This should not even happen, since the Lottery game should not include balls with duplicate numbers.
    it('should return sorted array with duplicate values removed when given unsorted with duplicates', function() {
        assert.deepStrictEqual([1,23,101,1009], sortingBalls.sort([23,1009,1,23,23,101]));
    });

  });

});
