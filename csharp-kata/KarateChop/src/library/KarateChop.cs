// Kata from here: http://codekata.com/kata/kata02-karate-chop/
// KarateChop a.k.a. BinarySearch

using System.Collections.Immutable;
using System.Linq;

namespace Search
{
    public class KarateChop
    {
        public static int Chop(int searchedNumber, ImmutableArray<int> arrayOfNumbers)
        {
            if (arrayOfNumbers.IsEmpty) return -1;
            
            var middleIndex = arrayOfNumbers.Length / 2;
            var middleItem = arrayOfNumbers[middleIndex];
            
            if (middleItem == searchedNumber)
            {
                return middleIndex;
            }
            else if (searchedNumber < middleItem)
            {
                return Chop(searchedNumber, arrayOfNumbers.Take(middleIndex).ToImmutableArray());
            }
            else
            {
                var index = Chop(searchedNumber, arrayOfNumbers.Skip(middleIndex+1).ToImmutableArray());
                return index == -1 ? index : middleIndex + index + 1;
            }
        }

    }
}
