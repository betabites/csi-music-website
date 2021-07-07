// This file contains javascript that allows a client machine to communicate with the server.

// It does this by doing HTTP requests to the server machine, which then returns the requested data

// This class contains functions that both the iframe and outer frame need
class API {
    constructor(path_to_upper = "") {
        this.path_to_upper = path_to_upper
    }
    async request(url, method = "GET", form_data = new FormData()) {
        return new Promise(resolve => {
            let xhttp = new XMLHttpRequest()
            xhttp.onreadystatechange = (e) => {
                if (xhttp.readyState === 4 && xhttp.status === 200) {
                    resolve(xhttp.responseText)
                }
            }

            xhttp.open(method, this.path_to_upper + url)
            xhttp.send()
        })
    }
    async get_playlist_contents(playlist_id) {
        return new Promise(async resolve => {
            // Uses the API to request information about a track
            let request = await this.request("api/get_tracks.php?playlist_id=" + playlist_id)
            console.log(request)
            let track_data = JSON.parse(request).data
            resolve(track_data)
        })
    }
    async get_track(track_id) {
        return new Promise(async resolve => {
            // Uses the API to request information about a track
            let request = await this.request("api/get_tracks.php?track_id=" + track_id)
            let track_data = JSON.parse(request).data[0]
            resolve(track_data)
        })
    }
}

// This class is used by the iframe. It is to allow the iframe to communicate with it's parent and the server
class iframe_class extends API {
    constructor() {
        // Setup a listener so that the iframe can receive information from the parent frame
        super("../");
        window.onmessage = this.message_receiver
    }
    message_receiver(e) {

    }
    set_queue(ids, playlist_name = "Individual Track", position = 0) {
        // Parameter must be an array of track ids
        window.top.postMessage(JSON.stringify(
            {
                command_type: 1, // Type 1 is set queue
                data: {
                    playlist_name: "",
                    ids: ids,
                    position: position
                }
            }
        ), "*")
        console.log("Posted data")
    }
    set_page_name(name) {
        window.top.postMessage(JSON.stringify(
            {
                command_type: 2, // Type 1 is set name
                data: name
            }
        ), "*")
    }
    async play_playlist(playlist_id, playlist_name = "Individual Track", position = 0) {
        return new Promise(async resolve => {
            let track_ids = []
            for (let track of await this.get_playlist_contents(playlist_id)) {
                track_ids.push(track["track_id"])
            }
            api.set_queue(track_ids, playlist_name, position)
        })
    }

    send_iframe_to_page(location) {
        window.top.postMessage(JSON.stringify(
            {
                command_type: 3, // Type 3 is a go to page request
                data: location
            }
        ), "*")
    }
    send_iframe_backwards() {
        window.top.postMessage(JSON.stringify(
            {
                command_type: 4, // Type 4 goes back to the previous page
                data: null
            }
        ), "*")
    }
}

// This is for the outer frame. It allows the iframe to communicate with it, as well as all it to communicate with the server.
class outer_frame_class extends API {
    constructor(iframe_obj, player_obj) {
        super();
        // The constructor requires the iframe object, as other wise it will not be able to send or receive data from the iframe
        this.iframe = iframe_obj
        this.queue = []
        this.current_track = 0
        this.page_title = "Home"
        this.iframe_history = ["iframe/home.php"]

        // Setup a script that runs when the frame receives a message
        window.onmessage = this.message_receiver

        // Setup all the player elements
        try {
            this.player = {
                elements : {
                    skip_forwards: document.getElementById("skip_forwards"),
                    skip_backwards: document.getElementById("skip_backwards"),
                    toggle: document.getElementById("toggle"),
                    track_data: document.getElementById("track_data"),
                    snake: document.getElementById("player_snake"),
                    snake_slider: document.getElementById("player_snake_slider")
                },
                player_obj: player_obj,
                player_el: document.createElement("audio"),
                is_playing: false
            }
        }
        catch(e) {
            console.error("Could not attach all player elements to variables")
            console.error(e)
            return false
        }
        console.log(this.player)

        this.player.elements.skip_forwards.onclick = this.skip_forwards
        this.player.elements.skip_backwards.onclick = this.skip_backwards
        this.player.elements.toggle.onclick = this.toggle

        // Prepare script triggers for audio object
        this.player.player_el.addEventListener("ended", this.on_track_end)
        this.player.player_el.addEventListener("pause", this.on_track_pause)
        this.player.player_el.addEventListener("play", this.on_track_play)

    }

    async message_receiver(e) {
        console.log(e.data)
        console.log("Received data")
        let data = JSON.parse(e.data)

        // Detect what the iframe wants the outer frame to do
        if (data.command_type === 1) {
            // The iframe is telling the outer frame to set the queue
            // alert("Picked up a 'set queue' request")
            console.log("Picked up a set queue request")
            api.queue = data.data.ids
            api.current_track = data.data.position
            await api.load_track()
        } else if (data.command_type === 2) {
            console.log("Picked up name change")
            console.log(data)
            api.page_title = data.data
            api.update_title()
        } else if (data.command_type === 3) {
            api.send_iframe_to_page(data.data)
        } else if (data.command_type === 4) {
            api.send_iframe_backwards()
        }
    }
    skip_forwards() {
        alert("Skipped forwards")
    }
    skip_backwards() {
        alert("Skipped backwards")
    }
    toggle() {
        alert("Toggled player")
    }

    async reset_player() {
        this.current_track = 0
        await this.load_track()
    }
    async load_track() {
        console.log(this)
        let track_data = await this.get_track(this.queue[this.current_track])
        console.log(track_data)
        // Get details for the next track
        api.player.player_el.src = "test.mp3"
        api.player.player_el.load()
        this.player.track = track_data

        // Set track details
        this.player.elements.track_data.innerHTML = "<strong>" + track_data.title + "</strong><br><i>Individual track</i>"

        api.player.start = new Date()
        await api.player.player_el.play()
    }

    async on_track_end() {
        console.log("Track ended")
        api.player.is_playing = false
        clearInterval(api.player.snake_interval)
        api.player.elements.snake_slider.style.width = "0%"
        api.update_title()
    }

    async on_track_pause() {
        console.log("Track paused")
        api.player.is_playing = false
        api.update_title()
        clearInterval(api.player.snake_interval)

        api.player.elements.toggle.src = "assets/icons/icon.svg"
        api.player.elements.toggle.onclick = () => {api.player.player_el.play()}
    }

    async on_track_play() {
        console.log("Tracking playing")
        api.player.is_playing = true
        api.update_title()

        api.player.elements.toggle.src = "assets/icons/icon_pause.svg"
        api.player.elements.toggle.onclick = () => {api.player.player_el.pause()}
        api.player.snake_interval = setInterval(api.update_snake, 10)
    }

    update_snake() {
        api.player.elements.snake_slider.style.width = (api.player.player_el.currentTime / api.player.player_el.duration) * 100 + "%"
    }

    update_title() {
        console.log(api.iframe_history)
        if (typeof this.player.track !== "undefined") {
            if (this.player.is_playing) {
                window.document.title = "🎵 " + this.player.track.title + " - " + this.page_title + " - Graeme's Music"
            } else {
                window.document.title = this.player.track.title + " - " + this.page_title + " - Graeme's Music"
            }
        } else {
            window.document.title = this.page_title + " - Graeme's Music"
        }
    }

    send_iframe_to_page(location) {
        api.iframe.src = location
        api.iframe_history.push(location)
    }

    send_iframe_backwards() {
        if (api.iframe_history.length !== 1) {
            api.iframe_history = api.iframe_history.slice(0,-1)
        }
        console.log(api.iframe_history[api.iframe_history.length - 1])
        api.iframe.src = api.iframe_history[api.iframe_history.length - 1]
    }
}