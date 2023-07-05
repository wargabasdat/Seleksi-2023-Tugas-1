/**
 *
 * @param {String} string string such as 1.5k or 2.4M
 * @returns conversion of the given string to number
 */
function formattedStringToNumber(string) {
  string = string.toLowerCase();
  if (string.length === 0) {
    return 0;
  }

  const determiner = string[string.length - 1];

  let multiplier = 1;
  let abbreviated = true;
  switch (determiner) {
    case "k":
      multiplier = 1000;
      break;
    case "m":
      multiplier = 1000000;
      break;
    default:
      abbreviated = false;
      break;
  }

  const result =
    Number(abbreviated ? string.substring(0, string.length - 1) : string) *
    multiplier;

  return result;
}

module.exports = formattedStringToNumber;
