# vue-chosen
A simple directive for Chosen.js

A simple example:

```
<select id="blog-post-author" class="form-control" v-chosen="author_id" v-model="author_id">
  <options></option>
</select>
````

Also note that if your select has the `multiple` property, the value of `author_id` would be an array of ids, and if your select is a single select, your `author_id` would be a single string id.
