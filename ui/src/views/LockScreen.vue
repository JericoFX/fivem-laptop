<template>
    <div class="h-100 d-flex justify-center align-center flex-column">
    <div class="bg-white" style="padding: 50px">
    
        <h1>Locked, please enter your password</h1>
        <form action="" @submit.prevent="login" v-if="!loading">
            <label for="password">Password</label>
            <input type="password" v-model="password" id="password" />
            <div v-if="passwordError" style="margin-top: 20px;">
                {{ passwordError }}
            </div>
        </form>

        <div v-if="loading">
            Checking password ...
        </div>
      </div>
    </div>
</template>

<script>
export default {
  name: 'LockScreen',
  data() {
    return {
      password: '',
      passwordError: '',
      loading: false,
    }
  },
  mounted() {
    window.addEventListener('message', (event) => {

      const item = event.data;

      if (item.e === "login-error") {
        this.failPassword(item.error)
      }
    });
  },
  methods: {
    login() {
      this.loading = true;
      this.passwordError = '';

      if(this.password.length < 3)
      {
        this.failPassword("Password too short")
      } else {

        // Implement LUA for actual password verification
        this.$http.post('/login', JSON.stringify({
          password: this.password
        }));

        setTimeout(() => {
          this.loading = false;
        }, 1500)
      }

    },

    failPassword(reason) {
      this.passwordError = reason
      this.password = '';

      setTimeout(() => {
        this.loading = false
      }, 2000)
    }
  }

}
</script>
