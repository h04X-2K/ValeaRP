<template>
  <section class="changelog-wrapper max-w-4xl mx-auto">
    <div v-for="change in changelog" class="flex flex-wrap">
      <div class="w-full mx-auto bg-gray-400 relative mb-4 h-px mt-8 flex justify-center">
        <h3 class="absolute -mt-5 px-4 text-2xl">{{ change.date }}</h3>
      </div>
      <ul class="w-full list-inside list-disc">
        <li v-for="message in change.messages"> {{ message }}</li>
      </ul>
    </div>
  </section>
</template>

<script>
  import changelog from '../../public/changelog'

  export default {
    data () {
      document.title = "Valea-Roleplay.de - Roadmap";
      return {
        changelog
      }
    }
  }
</script>

<style lang="scss">
  .changelog-wrapper {
    max-height: 265px;
    overflow-y: auto;

    h3 {
      background-color: #212121;
    }
  }

</style>
