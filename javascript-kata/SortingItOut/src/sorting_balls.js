// Implements the Sorting Balls part of PragDave's Kata 11, Sorting It Out
// from http://codekata.com/kata/kata11-sorting-it-out/

'use strict';

const quicksort = require("./quicksort");

exports.sort = (givenBalls) => {
    const sortedBalls = quicksort.sort(givenBalls)
    return Array.from(new Set(sortedBalls)); // should only contain unique balls
}