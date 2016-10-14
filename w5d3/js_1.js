function madlib (verb, adjective, noun){
  return `We shall ${verb} the ${adjective.toUpperCase()} ${noun.toUpperCase()}.`
}
// console.log(madlib("make", "good", "tacos"));

function isSubstring(string, word) {
  return string.includes(word);
}
// console.log(isSubstring("Hello world", "world"));

function fizzBuzz(array) {
  const arr = [];

  array.forEach(el => {
    if ((el % 3 === 0) ^ (el % 5 === 0)) {
      arr.push(el);
    }
  });
  return arr;
}
// console.log(fizzBuzz([1,2,3,4,5]));

function isPrime(n) {
  if (n < 2) { return false; }

  for (var i = 2; i < n; i++){
    if (n % i === 0){
      return false;
    }
  }
  return true;
}
// console.log(isPrime(6));

function sumOfNPrimes(n) {
  var sum = 0;
  var countPrimes = 0;
  var i = 2;
  while (countPrimes < n) {
    if (isPrime(i)) {
      sum += i;
      countPrimes++;
    }
    i++;
  }
  return sum;
}
// console.log(sumOfNPrimes(4));

function allOrNothing(mod, ...numbers){
  for (var i = 0; i < numbers.length; i++){
    if(numbers[i] % mod !== 0){
      return false;
    }
  }
  return true;
}
console.log(allOrNothing(4,1,2))
