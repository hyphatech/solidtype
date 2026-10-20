// jsdom has no layout and no canvas, and says so on every call to the
// placeholders it keeps for them. Kobalte scrolls the page as an overlay
// closes, and axe measures text on a canvas: here a scroll goes nowhere
// and a canvas has nothing to draw with, as jsdom's placeholders do,
// without a line each, so what a run prints is only what went wrong.
window.scrollTo = () => {};
HTMLCanvasElement.prototype.getContext = () => null;
