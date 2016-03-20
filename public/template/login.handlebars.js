var loginTemplate = Handlebars.compile(`
<div class="container well">
  Login
  <form>
    <div class="form-group">
      <label for="loginUsername">Username</label>
      <input type="email" class="form-control" id="loginUsername" placeholder="Username">
    </div>
  </form>
  <div class="form-group">
    <label for="loginPassword">Password</label>
    <input type="password" class="form-control" id="loginPassword" placeholder="Password">
  </div>
  <button type="submit" class="btn btn-default" id="loginButton">Login</button>
</div>
`);
