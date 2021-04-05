<template>
  <div class="container mx-auto">
    <span onclick="location.replace('https://valea-roleplay.de/')" class="backForum"><font-awesome-icon :icon="['fas', 'user-secret']" /><font id="backForumFont">Zurück zur Startseite</font></span>
 <!--   <img src="./assets/logo.png">-->
    <h1 class="text-center text-3xl">Roadmap</h1>
 <!--   <h6 onclick="location.replace('https://valea-roleplay.de/forum/wcfcore/index.php?unter/')" class="text-center text-3x1 infotext">Unterstütze und erhalte Vorabzugang zu Testing Sessions.</h6><br> -->
  <!--  <h6 onclick="location.replace('https://discord.gg/kfbXqJp')" class="text-center text-3x1 redtext">Wir haben einen neuen Discord, klick mich! Nachrichten auf dem alten Server sind nicht mehr offiziell von uns anzuerkennen.</h6><br>-->
    <change-log class="mb-8"></change-log>
    <module-progress></module-progress>
  </div>
</template>

<script>
  import ChangeLog from './components/ChangeLog'
  import ModuleProgress from './components/ModuleProgress'
  import { library } from '@fortawesome/fontawesome-svg-core'
  import { faUserSecret } from '@fortawesome/free-solid-svg-icons'
  library.add(faUserSecret);

  export default {
    components: {
      ChangeLog,
      ModuleProgress
    }
  }
</script>

<style lang="css">
  body {
    background-color: #131313;
    color: #fff;
    -webkit-font-smoothing: antialiased;
    font-weight: 400;
    font-family: 'Open Sans', sans-serif;
  }

  .backForum {
    position: relative;
    background: #3871a1;
    padding: 1rem;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 40px;
    max-width: 210px;
    border-radius: 2px;
    margin-top: 25px;
    max-height: 40px;
    margin-left: -280px;
  }

  .infotext {
    color: #3aca7c;
    transition: all 0.5s ease-in-out;
  }

  .redtext {
    color: #ff4242;
    font-weight: bold;
    transition: all 0.5s ease-in-out;
  }

  .infotext:hover {
    cursor: pointer;
    color: #40e28b;
    letter-spacing: 1px;
  }

  #backForumFont {
    padding-left: 5px;
  }

  img {
    width: 300px;
    margin-top: 50px;
    margin-left: auto;
    margin-right: auto;
    margin-bottom: 10px;
  }

  .bg-gray-400 {
        background-color: #ffffff14 !important;
  }

  ::-webkit-scrollbar {
    width: 5px;
}

::-webkit-scrollbar-track {
    background: #888;
    border-radius: 18px;
}

::-webkit-scrollbar-thumb {
    background: #3e3e3e;
    border-radius: 18px;
}

::-webkit-scrollbar-thumb:hover {
    background: #555;
}
</style>
