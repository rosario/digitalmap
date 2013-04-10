class Roundabout.Routers.AppRouter extends Backbone.Router
    routes:
        '': ->
        'about' : 'about'
    about: ->
      console.log 'about'

# class Roundabout.Routers.PostsRouter extends Backbone.Router
#   initialize: (options) ->
#     @posts = new Roundabout.Collections.PostsCollection()
#     @posts.reset options.posts
# 
#   routes:
#     "new"      : "newPost"
#     "index"    : "index"
#     ":id/edit" : "edit"
#     ":id"      : "show"
#     ".*"        : "index"
# 
#   newPost: ->
#     @view = new Roundabout.Views.Posts.NewView(collection: @posts)
#     $("#posts").html(@view.render().el)
# 
#   index: ->
#     @view = new Roundabout.Views.Posts.IndexView(posts: @posts)
#     $("#posts").html(@view.render().el)
# 
#   show: (id) ->
#     post = @posts.get(id)
# 
#     @view = new Roundabout.Views.Posts.ShowView(model: post)
#     $("#posts").html(@view.render().el)
# 
#   edit: (id) ->
#     post = @posts.get(id)
# 
#     @view = new Roundabout.Views.Posts.EditView(model: post)
#     $("#posts").html(@view.render().el)
