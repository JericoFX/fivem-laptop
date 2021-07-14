<template>
    <div class="h-100 d-flex justify-center align-center flex-column">
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

      if(this.password.length < 3)
      {
        this.failPassword("Password too short")
      } else {

        // Implement LUA for actual password verification
        this.$http.post('login', JSON.stringify({
          password: this.password
        }));

        // Emulate login for now
        if(this.password === '1234') {
          this.passwordError = 'Valid password, logging you in'

          setTimeout(() => {
            this.$emit('login');
          }, 1000)
        } else {
          this.failPassword("Invalid password")
        }
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
