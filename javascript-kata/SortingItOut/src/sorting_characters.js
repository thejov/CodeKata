// Implements the Sorting Characters part of PragDave's Kata 11, Sorting It Out
// from http://codekata.com/kata/kata11-sorting-it-out/

'use strict';

const quickSort = require("./quicksort");

exports.sort = (givenString) => {

    const stringAsChars = givenString.toLowerCase().replace(/\W/g, '').split("");
    const sortedChars = quickSort.sort(stringAsChars);

    return sortedChars.length > 0 ? sortedChars.join("") : "";    

}