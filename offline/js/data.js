const leaderboardKey = 'leaderboard_scores';
let initWebSocket = () => {
  let ws = new WebSocket('ws://localhost:3000/cable');
  ws.onopen = () => {
    //Subscribe to the channel
    ws.send(JSON.stringify({ "command": "subscribe", "identifier": "{\"channel\":\"LeaderboardChannel\"}" }))
  };

  ws.onmessage = (msg) => {
    if (msg.type === "ping") {
      return;
    }

    let response = JSON.parse(msg.data).message;
    console.log(response);
    if (typeof (response) === 'object' && response.data)
      localStorage.setItem(leaderboardKey, JSON.stringify(response.data));
  };
};

let registerHandlebarPartial = () => {
  Handlebars && Handlebars.registerPartial(
    "score",
    "<div class='position'>{{score.position}}</div>" +
    "       <div class='car-number' style='background-color: {{score.car_colour}}'>{{score.car_number}}</div>" +
    "       <div class='driver-name'>{{score.driver_name}}</div>" +
    "       <div class='last-lap'>{{score.last_lap}}</div>"
  );
};

let getHandlebarScoresTemplate = () => {
  return Handlebars.compile("{{#each scores}}<div class='score'>{{>score score=.}}</div>{{/each}}");
};