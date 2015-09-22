var number = 13195;
var prime_factors = [];
function isPrime(number) {
    for (var i = 2; i < number; i++){
        if(number %i === 0){
            return false;
        }
    }
    return true;
}

for (i = 2; i < number; i++) {
    if (number % i === 0 && isPrime(i)) {
        prime_factors.push(i);
    }
}
alert(prime_factors);