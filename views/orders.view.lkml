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
    label: "{% if _filters['created_week'] == ''%}'default'{% else %}'Revenue'{{_filters['created_week']}}{% endif %}"

    type: time
    timeframes: [raw, time, date, week, month, quarter, year, day_of_week]
    sql: ${TABLE}.created_at ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Status" in Explore.
dimension: Today_date {
  type: date
  sql: CURRENT_DATE() ;;
}
  dimension: status {
    type: string
   sql: ${TABLE}.status ;;
    #suggest_dimension: users.state
    #suggest_explore: users
  }
dimension: brand {
  type: string
  sql: ${products.brand} ;;
 suggest_explore: faad_products
  suggest_dimension: products.brand
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

  measure: new {

    type: number

    sql:CASE WHEN ${id} < 4

            THEN 0

      WHEN ${id}=24087

      THEN -1

      ELSE 2

      END;;

    value_format: "#,##0"
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
