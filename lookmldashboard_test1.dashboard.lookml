- dashboard: lookmldashboard_test1
  title: lookmldashboard_test1
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 7JunsBo99UzaypHxE81PjG
  elements:
  - title: Untitled
    name: Untitled
    model: 0_vysakh_thelook
    explore: order_items
    type: looker_grid
    fields: [order_items.id, order_items.count, order_items.returned_date, order_items.total_sale_price,
      users.email, users.gender]
    sorts: [order_items.count desc 0]
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
    defaults_version: 1
    row:
    col:
    width:
    height:
