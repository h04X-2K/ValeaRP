<template>
  <section>
    <div class="header-container">
      <div>Konzept</div>
      <div>Design</div>
      <div>Web<br>Entwicklung</div>
      <div>Server<br> Entwicklung</div>
      <div>Testing /<br> Fertigstellung</div>
    </div>
    <div v-for="group in moduleProgress" class="mb-8">
      <div v-for="module in group">
        <div class="bg-gray-400 px-2 py-4 rounded-r-full relative h-6 my-2">
          <div class="text-gray-300 absolute inset-0 text-sm py-4 flex items-center" :class="{'rounded-r-full bg-green-600': (module.status === 5 || module.status >= 4), 'bg-blue-700': (module.status < 4 && module.status >= 3), 'bg-red-600': module.status < 2, 'bg-orange-600': (module.status >= 2 && module.status < 3)}" :style="{width: module.status * 20 + '%'}">
            <b class="mx-2 font-semibold">{{ module.group }}</b> {{ module.name }}
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
  import moduleProgress from '../../public/moduleProgress'

  export default {
    data () {
      return {
        moduleProgress
      }
    }
  }
</script>

<style lang="scss">
  .header-container {
    display: flex;
    margin-bottom: 1.25rem;

    div {
      flex: 1;
      font-size: 1rem;
      border-right: 1px solid #212121;
      display: flex;
      align-items: center;
      justify-content: center;
      text-align: center;
      width: 20%;

      &:last-child {
        border-right: 0;
      }
    }
  }
</style>
