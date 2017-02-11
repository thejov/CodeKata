// Kata from here: https://www.codewars.com/kata/55983863da40caa2c900004e

using System;
using System.Linq;

namespace NextBiggerLibrary
{
    public class NextBigger
    {
        public int Get(int number)
        {
            var digitsReverse = ToDigits(number).Reverse().ToArray();
            for (int i = 0; i < digitsReverse.Length; i++)
            {
                var digitsSoFar = ( i + 1 <= digitsReverse.Length ) ? 
                    digitsReverse.Take(i+1).ToArray() : digitsReverse;
                
                if( digitsReverse[i] < digitsSoFar.Max())
                {
                    var sameBeginning = string.Join("", digitsReverse.Skip(i+1).Reverse());

                    var nextBiggest = NextBiggestDigitFromArray(digitsReverse[i], digitsSoFar.ToArray());

                    var nextBiggestIndex = Array.IndexOf(digitsSoFar, nextBiggest);
                    var newEndingArray = digitsSoFar.
                        Where( (digit, index) => index != nextBiggestIndex ).ToArray();
                    Array.Sort(newEndingArray);
                    var newEnding = string.Join("", newEndingArray);

                    return int.Parse($"{sameBeginning}{nextBiggest}{newEnding}");
                }
            }
            return -1;
        }

        private int NextBiggestDigitFromArray(int digit, int[] array)
        {
            Array.Sort(array);
            return Array.Find(array, listDigit => listDigit > digit);
        }

        private int[] ToDigits(int number)
        {
            return number.ToString().ToCharArray().
                Select( digit => int.Parse($"{digit}") ).ToArray();
        }
    }
}
