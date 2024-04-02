---
- dashboard: vtest
  title: vtest
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: hYIok9Vywc7MQt98y1AMwo
  elements:
  - title: filter
    name: filter
    model: 0_vysakh_thelook
    explore: order_items
    type: table
    fields: [orders.created_date, orders.count]
    fill_fields: [orders.created_date]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    y_axes: []
    listen:
      Created Date: orders.created_date
    row: 0
    col: 0
    width: 24
    height: 12
  - title: new 2
    name: new 2
    model: 0_vysakh_thelook
    explore: order_items
    type: looker_grid
    fields: [users.created_date, users.count]
    fill_fields: [users.created_date]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    defaults_version: 1
    y_axes: []
    listen:
      Created Date: users.created_date
    row: 12
    col: 0
    width: 8
    height: 6
  - title: tile3
    name: tile3
    model: arturo_thelook
    explore: order_status_vijaya
    type: table
    fields: [order_status_vijaya.date, order_status_vijaya.count]
    sorts: [order_status_vijaya.count desc 0]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    y_axes: []
    listen:
      Created Date: order_status_vijaya.date
    row: 12
    col: 8
    width: 8
    height: 6
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: 0_vysakh_thelook
    explore: order_items
    listens_to_filters: []
    field: orders.created_date
