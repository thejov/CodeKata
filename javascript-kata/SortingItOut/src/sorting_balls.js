// Implements the Sorting Balls part of PragDave's Kata 11, Sorting It Out
// from http://codekata.com/kata/kata11-sorting-it-out/

// Implements Quicksort
exports.sortBalls = (givenBalls) => {

    if (givenBalls.length < 2) { return givenBalls; }
    
    const randomBall = givenBalls[Math.floor(Math.random() * givenBalls.length)];
    const smallerBalls = givenBalls.filter( (ball) => ball < randomBall );
    const biggerBalls = givenBalls.filter( (ball) => ball > randomBall );

    return this.sortBalls(smallerBalls).concat([randomBall]).concat(this.sortBalls(biggerBalls));

}