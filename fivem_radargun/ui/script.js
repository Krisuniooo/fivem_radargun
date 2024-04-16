const SPEED_SELECTOR = document.querySelector('.SPEED_VALUE');
const DISTANCE_SELECTOR = document.querySelector('.DISTANCE_VALUE');
const SPEED_UNIT_SELECTOR = document.querySelector('.SPEED_MEASURE_UNIT');
const DISTANCE_UNIT_SELECTOR = document.querySelector('.DISTANCE_MEASURE_UNIT');

window.addEventListener("message", function(event) {
    const data = event.data;

    SPEED_SELECTOR.innerText = (data.SPEED).toFixed(1);
    DISTANCE_SELECTOR.innerText = (data.DISTANCE).toFixed(2);
    SPEED_UNIT_SELECTOR.innerText = data.SPEED_UNIT;
    DISTANCE_UNIT_SELECTOR.innerText = data.DISTANCE_UNIT;
})