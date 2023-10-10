// import consumer from "./consumer"

// consumer.subscriptions.create("ChatChannel", {
//   connected() {
//     console.log("Connected to the chat channel.")
//   },

//   disconnected() {
//     console.log("Disconnected from the chat channel.")
//   },

//   received(data) {
//     console.log("Received message:", data)
//     // Handle received data
//   },

//   send(message) {
//     this.perform("send_message", { message: message })
//   }
// })

App.messages = App.cable.subscriptions.create('MessagesChannel', {  
  connected(){
    console.log("connted to message chall");
  },
  disconnected(){
    console.log("disconnted to message chall");
  },
  received: function(data) {
    $("#dhjdhjdfdf").append(data.message) //data show from this line 
  console.log(data);
  },
});