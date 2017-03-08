// Kata from here: http://codekata.com/kata/kata02-karate-chop/
// KarateChop a.k.a. BinarySearch

'use strict';

exports.chop = (searchedNumber, arrayOfNumbers) => {
    if (arrayOfNumbers.length === 0) return -1;        

    const MIDDLE_INDEX = Math.floor(arrayOfNumbers.length / 2);
    const MIDDLE_ITEM = arrayOfNumbers[MIDDLE_INDEX];

    if (searchedNumber === MIDDLE_ITEM) {
        return MIDDLE_INDEX;
    } else if (searchedNumber < MIDDLE_ITEM) {
        return this.chop(searchedNumber, arrayOfNumbers.slice(0, MIDDLE_INDEX));
    } else {
        const index = this.chop(searchedNumber, arrayOfNumbers.slice(MIDDLE_INDEX + 1));
        return index === -1 ? index : MIDDLE_INDEX + index + 1;
    }
        
};