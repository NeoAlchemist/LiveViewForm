// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css";
import "phoenix_html"
import {LiveSocket, debug} from "phoenix_live_view"

import {PolymerElement, html} from '@polymer/polymer';
import '@polymer/paper-spinner/paper-spinner.js';
import '@vaadin/vaadin-date-picker/vaadin-date-picker.js';

let liveSocket = new LiveSocket("/live")
liveSocket.connect()

class SampleElement extends PolymerElement {
  static get template() {
    return html`
      <paper-spinner active></paper-spinner>
    `;
  }
}
customElements.define('sample-element', SampleElement);

customElements.whenDefined('vaadin-date-picker').then(function() {
    const start = document.querySelector('#start');
    start.addEventListener('change', function() {
        console.log(liveSocket.prevValue)
        liveSocket.socket.channels[0].push("aperto", start.value, 10000);
    });
});
// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
