

---
- dashboard: test_arabic
  title: Test_Arabic
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: SHy70fVUYL2fHpTyiUFEJw
  elements:
  - title: Test_Arabic
    name: Test_Arabic
    model: 0_vysakh_thelook
    explore: order_items
    type: looker_bar
    fields: [orders.count, orders.status, orders.Test_Arabic]
    sorts: [orders.count desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true

    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: orders.count, id: orders.count,
            name: Orders}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: true
    hidden_fields: [orders.status]
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 13
    height: 8
  - title: new_1
    name: new_1
    model: 0_vysakh_thelook
    explore: order_items
    type: looker_bar
    fields: [orders.count, orders.Test_Arabic, orders.user_id]
    sorts: [orders.count desc]
    limit: 10
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: orders.count, id: orders.count,
            name: Orders}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: true
    hidden_fields: [orders.user_id]
    defaults_version: 1
    listen: {}
    row: 0
    col: 13
    width: 11
    height: 8
