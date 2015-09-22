var i_1 = 1;
var i_2 = 2;
var i = 0;
var sum = 2;

while (i < 4000000){
    i = i_1 + i_2;
    if (i%2 === 0) {
        sum = sum + i;
    }
    i_1 = i_2;
    i_2 = i;
}
alert(sum);
