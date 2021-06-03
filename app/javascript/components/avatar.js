const colors = ['#00AA55', '#009FD4', '#B381B3', '#939393', '#E3BC00', '#D47500', '#DC2A2A'];

function numberFromText(text) {
  // numberFromText("AA");
  const charCodes = text
    .split('') // => ["A", "A"]
    .map(char => char.charCodeAt(0)) // => [65, 65]
    .join(''); // => "6565"
  return parseInt(charCodes, 10);
}

const avatars = document.querySelectorAll('.avatar');

avatars.forEach(avatar => {
  const text = avatar.innerText; // => "AA"
  avatar.style.backgroundColor = colors[numberFromText(text) % colors.length]; // => "#DC2A2A"
});