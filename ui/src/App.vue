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
  created() {
    window.addEventListener('message', (event) => {

      const item = event.data;

      if (item.type === "ui") {
        if (item.status)
          this.isLoggedIn = item.status;
      }
    });

    document.onkeyup = (data) => {
      if (data.keyCode === 27) {
        this.logout()
      }
    }
  },
  methods: {
    login() {
      this.isLoggedIn = true;
    },
    logout() {
      this.isLoggedIn = false;
    }
  }
}
</script>
