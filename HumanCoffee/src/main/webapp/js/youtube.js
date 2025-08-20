

// 2. This code loads the IFrame Player API code asynchronously.
var tag = document.createElement('script');

tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

// 3. This function creates an <iframe> (and YouTube player)
//    after the API code downloads.
var player;
function onYouTubeIframeAPIReady() {
  player = new YT.Player('player', {
    videoId: 'An6LvWQuj_8', // 재생할 유투브 영상 ID
    playerVars: {
      autoplay: true,  // 자동 재생
      loop: true, // 반복 재생
      playlist: 'An6LvWQuj_8', // 반복 재생할 유튜브 영상 ID
    },
    events: {
      onReady: function (event) {
        event.target.mute();  // 재생시 음소거
      }
    }
  });
}

// <!-- JS: 창립일 기준 기술 경력 자동 계산 -->
  const foundationYear = 2025; // 창립연도
  const currentYear = new Date().getFullYear();
  document.getElementById("years").textContent = (currentYear - foundationYear) + "년";
