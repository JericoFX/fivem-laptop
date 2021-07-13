<template>
    <div class="h-100 d-flex justify-center align-center flex-column">
        <h1>Locked, please enter your password</h1>
        <form action="" @submit.prevent="login" v-if="!loading">
            <label for="password">Password</label>
            <input type="text" v-model="password" id="password" />
            <div v-if="passwordError">
                {{ passwordError }}
            </div>
        </form>

        <div v-if="loading">
            Checking password ...
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
  methods: {
    login() {
      this.loading = true;
      this.passwordError = '';

      // Implement LUA for actual password verification
      this.$http.post('login')
        .then(() => {
          this.isLoggedIn = true;
        })

      // Emulate login for now
      if(this.password === '1234') {
        this.passwordError = 'Valid password, logging you in'
        setTimeout(() => {
          this.$emit('login');
        }, 1000)
      } else {
        this.passwordError = "Invalid password"

        setTimeout(() => {
          this.loading = false
        }, 2000)
      }
    }
  }

}
</script>
