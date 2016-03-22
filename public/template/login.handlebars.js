var loginTemplate = Handlebars.compile(`
<div class="container">
  <form class="well">
    Login
    <div class="form-group">
      <label for="loginUsername">Username</label>
      <input class="form-control" id="loginUsername" placeholder="Username">
    </div>
    <div class="form-group">
      <label for="loginPassword">Password</label>
      <input type="password" class="form-control" id="loginPassword" placeholder="Password">
    </div>
  <button class="btn btn-default" id="loginButton">Login</button>
  <button class="btn btn-default" id="createAccountButton">Create Account</button>
  </form>
</div>
`);
