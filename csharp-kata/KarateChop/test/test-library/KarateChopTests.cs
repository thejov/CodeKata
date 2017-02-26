using Search;
using System.Collections.Immutable;
using Xunit;
using System.Linq;

namespace SearchTests
{
    public class KarateChopTests
    {
        [Fact]
        public void ChopEmptyArrayShouldRetrunMinusOne()
        {
            Assert.Equal(-1, KarateChop.Chop(1, (new int[] {}.ToImmutableArray())));
        }
        
        [Fact]
        public void ChopArrayWithOneItemShouldReturn0IfFound() 
        {
            Assert.Equal(0, KarateChop.Chop(1, (new [] {1}).ToImmutableArray()));
        }

        [Fact]
        public void ChopShouldReturnMinusOneIfNotFound()
        {
            Assert.Equal(-1, KarateChop.Chop(2, (new [] {1}).ToImmutableArray()));
            Assert.Equal(-1, KarateChop.Chop(0, (new [] {1, 3, 5}).ToImmutableArray()));
            Assert.Equal(-1, KarateChop.Chop(2, (new [] {1, 3, 5}).ToImmutableArray()));
            Assert.Equal(-1, KarateChop.Chop(4, (new [] {1, 3, 5}).ToImmutableArray()));
            Assert.Equal(-1, KarateChop.Chop(6, (new [] {1, 3, 5}).ToImmutableArray()));
            Assert.Equal(-1, KarateChop.Chop(0, (new [] {1, 3, 5, 7}).ToImmutableArray()));
            Assert.Equal(-1, KarateChop.Chop(2, (new [] {1, 3, 5, 7}).ToImmutableArray()));
            Assert.Equal(-1, KarateChop.Chop(4, (new [] {1, 3, 5, 7}).ToImmutableArray()));
            Assert.Equal(-1, KarateChop.Chop(6, (new [] {1, 3, 5, 7}).ToImmutableArray()));
            Assert.Equal(-1, KarateChop.Chop(8, (new [] {1, 3, 5, 7}).ToImmutableArray()));
        }

        [Fact]
        public void ChopWithItemAtBeginningHalfOfArray()
        {
            Assert.Equal(0, KarateChop.Chop(1, (new [] {1, 3, 5}).ToImmutableArray()));
            Assert.Equal(0,  KarateChop.Chop(1, (new [] {1, 3, 5, 7}).ToImmutableArray()));
            Assert.Equal(1,  KarateChop.Chop(3, (new [] {1, 3, 5, 7}).ToImmutableArray()));
        }

        [Fact]
        public void ChopWithItemAtEndHalfOfArray()
        {
            Assert.Equal(2, KarateChop.Chop(5, (new [] {1, 3, 5}).ToImmutableArray()));
            Assert.Equal(3,  KarateChop.Chop(7, (new [] {1, 3, 5, 7}).ToImmutableArray()));
        }

        [Fact]
        public void ChopWithItemInMiddleOfArray()
        {
            Assert.Equal(1,  KarateChop.Chop(3, (new [] {1, 3, 5}).ToImmutableArray()));
            Assert.Equal(2,  KarateChop.Chop(5, (new [] {1, 3, 5, 7}).ToImmutableArray()));
        }

        [Fact]
        public void ChopLargeArray()
        {
            var largeArray = (new [] {
                0, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 
                4181, 6765, 10946, 17711, 28657, 46368, 75025, 121393, 196418, 317811
                }).ToImmutableArray();
            Assert.Equal(25,  KarateChop.Chop(121393, largeArray));
            Assert.Equal(11,  KarateChop.Chop(144, largeArray));
            Assert.Equal(1,  KarateChop.Chop(1, largeArray));
            Assert.Equal(27,  KarateChop.Chop(317811, largeArray));
        }

        [Fact]
        public void ChopHugeArray()
        {
            var hugeArray = Enumerable.Range(1,100000).ToImmutableArray();

            Assert.Equal(998,  KarateChop.Chop(999, hugeArray));
            Assert.Equal(0,  KarateChop.Chop(1, hugeArray));
            Assert.Equal(99999,  KarateChop.Chop(100000, hugeArray));
            Assert.Equal(-1,  KarateChop.Chop(100001, hugeArray));
        }
    }
}
