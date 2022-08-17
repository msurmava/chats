import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  /** On start */
  connect() {
    console.log("Connected");
    const messages = document.getElementById("messages");
    /** getElementById("messages") refers to html element and html id, in this case we have id "message" in rooms/index.html.erb */
    messages.addEventListener("DOMNodeInserted", this.resetScroll);
    this.resetScroll(messages);
  }
  /** On stop */
  disconnect() {
    console.log("Disconnected");
  }
  /** Custom function */
  resetScroll() {
    messages.scrollTop = messages.scrollHeight - messages.clientHeight;
  }
}