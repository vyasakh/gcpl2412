# The name of this view in Looker is "Orders"
view: orders {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time

    timeframes: [raw, time, date, week, month, quarter, fiscal_year, day_of_week]

    sql: ${TABLE}.created_at ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Status" in Explore.

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: yesno {
    type: yesno
    sql: ${status} ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: sum {
    type: sum_distinct
    sql: ${user_id} ;;
    value_format: "[>=1000000]\€0.00,,\"M\";[>=1000]\€0.00,\"K\";\€0.00"
  }

  measure: test_20 {
    type: number
    sql: ${sum} / nullif(${count},0) ;;
    value_format: "[>=1000]$0.00,\"K\"; [>=0]$0; -$0"
  }

  measure: test_21 {
    type: number
    sql: (${id}- ${test_20}) / nullif(${test_20},0) ;;
    value_format_name: percent_1
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  users.id,
  users.first_name,
  users.last_name,
  billion_orders.count,
  fakeorders.count,
  hundred_million_orders.count,
  hundred_million_orders_wide.count,
  order_items.count,
  order_items_vijaya.count,
  ten_million_orders.count
  ]
  }

}
