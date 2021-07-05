// This file contains javascript that allows a client machine to communicate with the server.

// It does this by doing HTTP requests to the server machine, which then returns the requested data

// This class is used by the iframe. It is to allow the iframe to communicate with it's parent and the server
class iframe_class {
    constructor() {
        // Setup a listener so that the iframe can receive information from the parent frame
        window.onmessage = this.message_receiver
    }

    message_receiver(e) {

    }

    set_queue(track_id_array) {
        // Parameter must be an array of track ids
        window.top.postMessage(JSON.stringify(
            {
                command_type: 1, // Type 1 is set queue
                data: track_id_array
            }
        ), "*")
        console.log("Posted data")
    }
}

// This is for the outer frame. It allows the iframe to communicate with it, as well as all it to communicate with the server.
class outer_frame_class {
    constructor(iframe_obj, player_obj) {
        // The constructor requires the iframe object, as other wise it will not be able to send or receive data from the iframe
        this.iframe = iframe_obj
        this.player = player_obj

        // Setup a script that runs when the frame receives a message
        window.onmessage = this.message_receiver
    }

    message_receiver(e) {
        let data = JSON.parse(e.data)

        // Detect what the iframe wants the outer frame to do
        if (data.command_type === 1) {
            // The iframe is telling the outer frame to set the queue
            alert("Set the queue to; " + JSON.stringify(data.data))
        }
    }
}