# sort_n_params

[![Build Status](https://travis-ci.org/JuannFerrari/sort_n_params.svg?branch=master)](https://travis-ci.org/JuannFerrari/sort_n_params)

![Alt Text](https://media.giphy.com/media/Ii4bBTw8tBTESSQOJ7/giphy.gif)

Sort N Params makes possible to sort your HTML tables by passing multiple parameters via HTTP's requests.

## Prerequisites

- Rails version 5.0 at least.

## Installation

Inside your `Gemfile` add the following:

```ruby
gem "sort_n_params"
```

Run command to set initializer

```
rails g sort_n_params:initializer
```

You can configure icon class (default fontawesome)


## Basic Usage

In your `application_record.rb` add the following line:
```ruby
include SortNParams::Scopes
```

You need to explicitly add order:[] to the list of permitted parameters, for example:

```ruby
@params.permit(:page, order: [])
```

To sort your records, add this line:
```ruby
records.sorting_order(order)
```

If your table's name isn't the tableize version of your model you can pass a custom table_name:
```ruby
records.sorting_order(order, table_name)
```

Call the helper on your view:
```ruby
<th><%= sortable 'id', t(:id, scope: :systems) %></th>
```
And that's it!

Now you can filter from another table too, just put `table.column`:
```ruby
<th><%= sortable 'categories.name', t(:id, scope: :systems) %></th>
```
Remember to do the `joins` or `eager_load` in query or this feature is not work!


## Additional Notes

The helper only allows two parameters: the column name to be sorted (it has to be in your database) and its title.
The title may be nil, in which case the column will be titleized.

## Copyright

Copyright (c) 2019 Juan Francisco Ferrari. See LICENSE for details.
