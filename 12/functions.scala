def sumOf(f: Int => Int, a: Int, b: Int): Int =
  f(a) + f(b)

def squared(x: Int): Int = x * x

println(sumOf(x => x * x, 2, 5))
println(sumOf(squared, 2, 5))


def sum(f: Int => Int): (Int, Int) => Int = {
  def sumF(a: Int, b: Int): Int =
    if (a > b) 0
    else f(a) + sumF(a+1, b)

  sumF
}

def sum2(f:Int => Int)(a: Int, b: Int) : Int =
  if (a > b) 0
  else f(a) + sum2(f)(a + 1, b)

println(sum(x => x)(1,5))
println(sum2(x => x)(1,5))
