'use strict';

const assert = require('assert');
const sortingChars = require('../src/sorting_characters');

describe('SortingCharacters', function() {

    describe('#sort()', function() {

        it('should return empty string when given empty string', function() {
            assert.equal("", sortingChars.sort(""));
        });
    
        it('should return same string when given already sorted chars', function() {
            assert.equal("aaa", sortingChars.sort("aaa"));
            assert.equal("aabccccdx", sortingChars.sort("aabccccdx"));
        });

        it('should return sorted chars when given unsorted chars', function() {
            assert.equal("abc", sortingChars.sort("bca"));
            assert.equal("aaaabbbbbccfz", sortingChars.sort("bbbcabzcaafab"));
        });

        it('should ignore punctuation', function() {
            assert.equal("", sortingChars.sort(". \\,   "));
        });

        it('should map upper case to lower case', function() {
            assert.equal("aabc", sortingChars.sort("BaCa"));
        });

        it('should return sorted chars when given full sentece with punctuation', function() {
            const input = "When not studying nuclear physics, Bambi likes to play\nbeach volleyball.";
            const expected = "aaaaabbbbcccdeeeeeghhhiiiiklllllllmnnnnooopprsssstttuuvwyyyy";

            assert.equal(expected, sortingChars.sort(input));
        });

        it('should also sort digits within input string', function() {
            assert.equal("0123aabc", sortingChars.sort("b2ac01a3"))
        });

    });  
})