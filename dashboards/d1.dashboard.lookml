name: d1
title: Untitled Visualization
model: kusumav
explore: order_items
type: looker_column
fields: [orders.status, orders.count, products.total_retail_price]
sorts: [orders.count desc 0]
limit: 500
column_limit: 50
query_timezone: UTC
x_axis_gridlines: false
y_axis_gridlines: true
show_view_names: false
show_y_axis_labels: true
show_y_axis_ticks: true
y_axis_tick_density: default
y_axis_tick_density_custom: 5
show_x_axis_label: true
show_x_axis_ticks: true
y_axis_scale_mode: linear
x_axis_reversed: false
y_axis_reversed: false
plot_size_by_field: false
trellis: ''
stacking: ''
limit_displayed_rows: false
legend_position: center
point_style: circle
show_value_labels: false
label_density: 25
x_axis_scale: auto
y_axis_combined: true
ordering: none
show_null_labels: false
show_totals_labels: false
show_silhouette: false
totals_color: "#808080"
y_axes: [{label: '', orientation: left, series: [{axisId: orders.count, id: orders.count,
          name: Orders}, {axisId: products.total_retail_price, id: products.total_retail_price,
          name: Total Retail Price}], showLabels: true, showValues: true, maxValue: 30000,
      minValue: 0, unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
x_axis_zoom: true
y_axis_zoom: true
series_types:
    products.total_retail_price: scatter
defaults_version: 1
