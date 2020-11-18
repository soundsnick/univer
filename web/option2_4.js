const format = (n) => String(n).length < 2 ? `0${n}` : n;
const timer = setInterval(
    () => {
        now = new Date();
        console.log(`${format(now.getHours())}:${format(now.getMinutes())}:${format(now.getSeconds())}`)
    }, 1000);