<template>
    <div class="h-100">
        <LockScreen v-if="!isLoggedIn" @login="login"/>
        <Desktop v-else id="desktop"/>
    </div>
</template>
<style lang="scss">
.aasjdfh {

}
</style>
<script>
import LockScreen from "./views/LockScreen";
import Desktop from "./views/Desktop";

export default {
  components: {Desktop, LockScreen},
  data() {
    return {
      isLoggedIn: false,
    }
  },
  methods: {

    login() {
      this.isLoggedIn = true;
    }
  }
}
</script>
