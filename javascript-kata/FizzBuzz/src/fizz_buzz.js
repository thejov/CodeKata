'use strict';

const range = require('lodash.range');

exports.generate = (length) => {
    
    const numbers = length > 0 ? range(1, length + 1) : [];

    const items = numbers.map( (item) => {
        if (item % 3 === 0 && item % 5 === 0) {
            return "Fizz Buzz";
        } else if (item % 3 === 0) {
            return "Fizz";
        } else if (item % 5 === 0) {
            return "Buzz";
        } else {
            return item;
        }
    });

    return items.join(", ");

};