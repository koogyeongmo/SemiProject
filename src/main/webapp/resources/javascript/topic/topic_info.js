const flairs = document.querySelectorAll('.flair');
const colors = ['#CC5289', '#B3A3B3', '#C04BF7', '#3083FF', '#47B2B2', '#EBC633'];

flairs.forEach((flair, index) => {
    const colorIndex = index % colors.length;
    flair.style.backgroundColor = colors[colorIndex];
});
