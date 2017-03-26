'use strict';

exports.sort = (items) => {

    if (items.length < 2) { return items; }
    
    const randomItem = items[Math.floor(Math.random() * items.length)];
    
    const smallerItems = items.filter( (item) => item < randomItem );
    const biggerItems = items.filter( (item) => item > randomItem );
    const equalItems = items.filter( (item) => item === randomItem );

    return this.sort(smallerItems).concat(equalItems).concat(this.sort(biggerItems));

}