<template>
    <div class="h-100" v-if="isOpen">
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
      isOpen: false,
    }
  },
  mounted() {
    window.addEventListener('message', (event) => {

      const item = event.data;

      if (item.e === "open-laptop") {
        this.isOpen = item.open;
      } else if(item.e === 'login') {
        this.login();
      } else if(item.e === 'logout') {
        this.logout();
      }
    });

    document.onkeyup = (data) => {
      console.log(data);
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
      this.isOpen = false;

      this.$http.post('/logout')
    }
  }
}
</script>
