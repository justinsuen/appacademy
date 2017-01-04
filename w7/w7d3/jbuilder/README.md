# Jbuilder Exercises

To get started, download this [skeleton][jbuilder-zip].  Run `bundle install`, then run `bundle exec rake db:setup`. To get the test database setup correctly, run `bundle exec rake db:seed RAILS_ENV=test --trace`.

Once you're set up, run the specs using `bundle exec rspec spec`. These are
testing whether our API is sending the correct information. We're going to
be writing some Jbuilder templates to make them pass.

The first thing we need to do is set up our routes. All of our controllers are
defined under the `Api` namespace (have a look through the controllers, noting
the class name), so we need to specify that in our routes as well. We're only
testing `show` and `index` today. For gifts, nest the `index` route under the
guests resource. Use the below as a guide for the formatting:

```ruby
namespace :api, defaults: { format: :json } do
  # Your routes here
end
```

Run `rake routes` to ensure this is working as intended.

Previously, we would often render our JSON by putting something like `render
json: @users` at the end of our controller actions. This has some unfortuante
side effects --- for one, we'll send down everything, including password
digests, to the client. This is bad. It also gives us no flexibility for
including associated data.

Jbuilder allows us to construct views that curate our data. It is also quite
straightforward to use once you've made a few templates. When making a Jbuilder
template, place it in the same place you would put your HTML views, but instead
of using  `.html.erb` as your file extension, use `.json.jbuilder`. Like ERB,
Jbuilder will be compiled by Rails and you'll be left with a JSON template.
Since we set the default format of our resources to `:json`, Rails will
automatically look for a `.json` file when you pass a template name to `render`
(`render :index` for example).

Make sure you keep the [Jbuilder GitHub][docs-link] up for reference as you work
through this. A few notes before we begin. First, we can run any ruby code we
want in a Jbuilder template, including conditionals. This ends up being really
helpful when, for example, we only want to send certain user data if the user
requesting it is logged in. Second, we can build Jbuilder partials as we did
with HTML and ERB and render them using `json.partial!` in our template, with a
very similar argument syntax to `render partial: ...`. Last, we can nest our
data by opening blocks for a given key in our object. This is demonstrated in an
example from GitHub page:

```ruby
json.author do
  json.name @message.creator.name.familiar
  json.email_address @message.creator.email_address_with_name
  json.url url_for(@message.creator, format: :json)
end
```
Yields:
```json
 "author": {
    "name": "David H.",
    "email_address": "'David Heinemeier Hansson' <david@heinemeierhansson.com>",
    "url": "http://example.com/users/1-david.json"
  }
```

Note not only the nested object, but also the use of associations
(`@message.creator`) and view helpers (`url_for`).

Let's make some templates! Start by making a `show.json.jbuilder` view for your
guest resource. Use `json.extract!` to include the guest's name, age, and
favorite color. Make sure you don't include `created_at` or `updated_at`. Test
by running the specs but also by visiting the url directly (e,g.
'api/guests/1'). If you don't have a JSON formatter installed, I recommend
[this one][formatter-link].

Once you have it working, go ahead and create an index view. For this, use
`json.array!` and pass @guests. Use a block to specify what you want to render
for each guest. This time, don't use `json.extract!` --- instead, specify each
component individually. For example:
```ruby
#...
  json.name guest.name
  json.age ...
#...
```

It's good to get familiar with both methods. Since our two templates do very similar
things, let's go ahead and refactor the single guest details into a partial.
The naming convention for the partial itself is the same as for HTML views, e,g.
`_guest.json.jbuilder`. Make sure to include 'api/' in your partial path.

Next, let's add some associated data. We want to see gifts for individual
guests, but not when we're looking at all guests (this may be too much data). In
your show view, render a guest's gifts. Only include the title and description.
**NB:** Using `json.array!` at the top level here will cause our other guest
information to break. Nest your data by passing it as an argument to
`json.gifts`.

Time to do some on your own. Make both a gift show and index view. Get the specs
to pass.

### Bonuses!

To run the bonus specs, simply go to that spec file and remove the line `before { pending('Bonus') }`.

**Bonus:**  Make the party show and index views. In the index
view, show all parties, and include all of their guests. In the show view,
include not only all guests, but all of the guests' gifts as well.

**Double Bonus:** Change your guest index view to only show guests who are between 40
and 50 years old. Normally we would always do this kind of selection using
Active Record, but this gives us an opportunity to practice using Ruby in Jbuilder.

**Triple Bonus:** In writing these views, you've generated some gnarly N+1 queries.
Find them and defeat them. _Hint:_ play around with your API in development and
watch your server logs.

[jbuilder-zip]: ../jbuilder_demo.zip?raw=true
[formatter-link]: https://chrome.google.com/webstore/detail/json-formatter/bcjindcccaagfpapjjmafapmmgkkhgoa?hl=en
[docs-link]: https://github.com/rails/jbuilder
