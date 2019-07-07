/**
 * Truncate Text
 * @param {*} text text to truncate
 * @param {*} limit char limit to next end of word
 */
String truncateText(String text, int limit) {
  int shortened = text == null ? -1 : text.indexOf(" ", limit);
  
  if (shortened == -1) return text;
  return text.substring(0, shortened) + "...";
}