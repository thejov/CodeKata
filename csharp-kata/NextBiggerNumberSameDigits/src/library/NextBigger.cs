// Kata from here: https://www.codewars.com/kata/55983863da40caa2c900004e

using System;
using System.Linq;
using System.Collections.Immutable;

namespace NextBiggerLibrary
{
    public class NextBigger
    {
        public int Get(int number)
        {
            var digitsReverse = ToDigits(number).Reverse().ToImmutableArray();
            for (int i = 0; i < digitsReverse.Length; i++)
            {
                var digitsSoFar = ( i + 1 <= digitsReverse.Length ) ? 
                    digitsReverse.Take(i+1).ToImmutableArray() : digitsReverse;
                
                if( digitsReverse[i] < digitsSoFar.Max())
                {
                    var sameBeginning = string.Join("", digitsReverse.Skip(i+1).Reverse());

                    var nextBiggest = NextBiggestDigitFromArray(digitsReverse[i], digitsSoFar);

                    var nextBiggestIndex = digitsSoFar.IndexOf(nextBiggest);
                    var newEndingArray = digitsSoFar.
                        Where( (digit, index) => index != nextBiggestIndex ).ToImmutableArray().Sort();
                    var newEnding = string.Join("", newEndingArray);

                    return int.Parse($"{sameBeginning}{nextBiggest}{newEnding}");
                }
            }
            return -1;
        }

        private int NextBiggestDigitFromArray(int digit, ImmutableArray<int> array)
        {
            return Array.Find(array.Sort().ToArray(), listDigit => listDigit > digit);
        }

        private ImmutableArray<int> ToDigits(int number)
        {
            return number.ToString().ToCharArray().
                Select( digit => int.Parse($"{digit}") ).ToImmutableArray();
        }
    }
}
