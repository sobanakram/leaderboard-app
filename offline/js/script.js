initWebSocket();
registerHandlebarPartial();
const template = getHandlebarScoresTemplate();
const scoresContainer = document.getElementById('scoresContainer');

const refreshLeaderboard = () => {
  let data = JSON.parse(localStorage.getItem(leaderboardKey));
  scoresContainer.innerHTML = template(data);
};

document.addEventListener("DOMContentLoaded", () => {
  refreshLeaderboard();
  setInterval(refreshLeaderboard, 1000);
});