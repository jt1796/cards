var loginTemplate = Handlebars.compile(`
<div class="container">
  Login
  <form class="well">
    <div class="form-group">
      <label for="loginUsername">Username</label>
      <input type="email" class="form-control" id="loginUsername" placeholder="Username">
    </div>
  <div class="form-group">
    <label for="loginPassword">Password</label>
    <input type="password" class="form-control" id="loginPassword" placeholder="Password">
  </div>
  <button type="submit" class="btn btn-default" id="loginButton">Login</button>
  <button type="submit" class="btn btn-default" id="createAccountButton">Create Account</button>
  </form>
</div>
`);
