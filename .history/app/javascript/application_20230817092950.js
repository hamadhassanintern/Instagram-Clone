// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


console.log("this is ")

app.get('/post/like/:post_id', function(req, res) {
  const post_id = req.params.post_id; // This extracts the post_id parameter
  // Your server-side logic to handle the like action using post_id
});

/
