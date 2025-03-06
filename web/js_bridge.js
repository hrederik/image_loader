class JsBridge {
  constructor() {
    console.log("JsBridge initialized");
  }

  updateImageUrl(newUrl) {
    document.querySelector('img').src = newUrl;
  }
}

window.JsBridge = JsBridge;