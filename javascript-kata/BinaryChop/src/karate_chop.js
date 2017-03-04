// Kata from here: http://codekata.com/kata/kata02-karate-chop/
// KarateChop a.k.a. BinarySearch

'use strict';

exports.chop = (searched_number, array_of_numbers) => {
    if (array_of_numbers.length === 0) return -1;        

    const middle_index = Math.floor(array_of_numbers.length / 2);
    const middle_item = array_of_numbers[middle_index];

    if (searched_number === middle_item) {
        return middle_index;
    } else if (searched_number < middle_item) {
        return this.chop(searched_number, array_of_numbers.slice(0, middle_index));
    } else {
        const index = this.chop(searched_number, array_of_numbers.slice(middle_index + 1));
        return index === -1 ? index : middle_index + index + 1;
    }
        
};