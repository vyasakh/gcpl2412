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
   measure: times {
     type: median
    sql: ${created_time}/ 86400.0 ;;
    value_format: "hh:mm:ss"
    html:  {{ rendered_value | Time: "Time %T (%X)" }};;


    }
  dimension: week_formatted {
    group_label: "Created date"
    label: "Week"
    type: date_raw
    sql: ${created_time} ;;
    html: {{ rendered_value | date: "Week %U (%b %d)" }};;
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
