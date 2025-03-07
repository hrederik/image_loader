class JsBridge {
  constructor() {
    console.log("JsBridge initialized");
  }

  updateImageUrl(newUrl) {
    document.querySelector('img').src = newUrl;
  }

  toggleBrowserFullscreen() {
    const isFullscreen = !!(
        document.fullscreenElement ||
        document.mozFullScreenElement ||
        document.webkitFullscreenElement ||
        document.msFullscreenElement
      );

      if (!isFullscreen) {
        this.enableFullscreen();
      } else {
        this.disableFullscreen();
      }
  }

  enableFullscreen() {
    const element = document.documentElement;
    const fullscreenMethods = [
      'requestFullscreen',
      'mozRequestFullScreen',
      'webkitRequestFullscreen',
      'msRequestFullscreen'
    ];

    fullscreenMethods.forEach(method => {
      if (element[method]) {
        element[method]();
        return;
      }
    });
  }

  disableFullscreen() {
    const exitMethods = [
      'exitFullscreen',
      'mozCancelFullScreen',
      'webkitExitFullscreen',
      'msExitFullscreen'
    ];

    exitMethods.forEach(method => {
      if (document[method]) {
        document[method]();
        return;
      }
    });
  }
}

window.JsBridge = JsBridge;