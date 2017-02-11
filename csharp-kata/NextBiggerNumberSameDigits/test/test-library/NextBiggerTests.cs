using NextBiggerLibrary;
using Xunit;

namespace TestApp
{
    public class NextBiggerTests
    {
        [Fact]
        public void TestGetWithOneDigitNumberShouldAlwaysReturnMinusOne() 
        {
            Assert.Equal(-1, new NextBigger().Get(9));
            Assert.Equal(-1, new NextBigger().Get(1));
            Assert.Equal(-1, new NextBigger().Get(4));
        }

        [Fact]
        public void TestBiggestNumberFromDigitsShouldReturnMinusOne() {
            Assert.Equal(-1, new NextBigger().Get(21));
            Assert.Equal(-1, new NextBigger().Get(99));
            Assert.Equal(-1, new NextBigger().Get(531));
            Assert.Equal(-1, new NextBigger().Get(987654321));
            Assert.Equal(-1, new NextBigger().Get(1111111));
        }

        [Fact]
        public void TestGetWithTwoDigits()
        {
            Assert.Equal(21, new NextBigger().Get(12));
            Assert.Equal(83, new NextBigger().Get(38));
        }

        [Fact]
        public void TestGetWithNDigits()
        {
            Assert.Equal(132, new NextBigger().Get(123));
            Assert.Equal(213, new NextBigger().Get(132));
            Assert.Equal(2071, new NextBigger().Get(2017));
            Assert.Equal(2170, new NextBigger().Get(2107));
            Assert.Equal(12345687, new NextBigger().Get(12345678));
            Assert.Equal(13245, new NextBigger().Get(12543));
        }

        [Fact]
        public void TestGetWithSeveralSameDigits()
        {
            Assert.Equal(2122, new NextBigger().Get(1222));
            Assert.Equal(133353, new NextBigger().Get(133335));
        }
    }
}
