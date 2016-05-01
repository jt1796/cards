var cardTemplate = Handlebars.compile(`
<div>
  <h1>{{this.title}}</h1>
  <p>{{this.body}}</p>
  <p>{{this.acceptance}}</p>
</div>
`);
