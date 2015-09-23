var square = '<div class="square"></div>';
var size = 0;

$(document).ready(function(){
    $("#arraySize").focus();
});


$("#arraySize").on("change", function () {
    if ($('#arraySize').val() <= 100) {
    size = $(this).val();
    } else {
    		$("#arraySize").val('');
        alert("Please enter a value of 100 or below.");
    }
});

function randomRGB() {
    return "rgb(" + Math.floor(Math.random() * 255) + "," + Math.floor(Math.random() * 255) + "," + Math.floor(Math.random() * 255) + ")";
}

var drawGrid = function (size) {
    var squareSize = Math.floor(960 / size);
    for (var i = 1; i <= size; i++) {
        for (var j = 1; j <= size; j++) {
            $(".container").append(square);
        }
    }
    $(".square").css("height", squareSize);
    $(".square").css("width", squareSize);

};

function darken_rgb(background) {
    var digits = /(.*?)rgb\((\d+), (\d+), (\d+)\)/.exec(background);
    var red = Math.floor(parseInt(digits[2], 10) * 0.8);
    var green = Math.floor(parseInt(digits[3], 10) * 0.8);
    var blue = Math.floor(parseInt(digits[4], 10) * 0.8);
    return "rgb(" + red + "," + green + "," + blue + ")";
}

function clearArray() {
    $(".container").empty();
}

$(".createArray").click(function () {
    clearArray();
    drawGrid(size);
    size = 0;
});

$(".clearArray").click(function () {
    $("#arraySize").val('');
    clearArray();
});


$(".container").on('mouseenter', '.square', function () {
    if (!$(this).hasClass("hovered")) {
        $(this).addClass("hovered");
        $(this).css('background-color', randomRGB());
    } else {
        var color = $(this).css('background-color');
        $(this).css('background-color', darken_rgb(color));
    }

});