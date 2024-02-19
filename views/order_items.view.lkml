# The name of this view in Looker is "Order Items"
view: order_items {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Inventory Item ID" in Explore.

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: phones {
    type: string
    sql: ${TABLE}.phones ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: returned {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_sale_price {
    type: number
    sql: ${sale_price} ;;
    html:
    {% if value > 1000000 %} ${{value | divided_by: 1000000 | round: 2 | times: 1}}M
    {% elsif value <= -1000000 %} (${{value | divided_by: 1000000 | round: 2 | times: -1}}M)
    {% elsif value >= 1000 %} ${{value | divided_by: 1000 | round: 2 | times: 1}}K
    {% elsif value < 0 %} (${{value | divided_by: 1000 | round: 2 | times: -1}}K)
    {% endif %};;
    }
  measure: average_sale_price {
    type: number
    sql: ${sale_price} ;;
    value_format: "[>=0]$#,##0.00,,\"M\";[<-0]($#,##0.00,,\"M)\""
    html:
    {% if value > 1000000 %} ${{value | divided_by: 1000000 | round: 2 | times: 1}}M
    {% elsif value <= -1000000 %} (${{value | divided_by: 1000000 | round: 2 | times: -1}}M)
    {% elsif value >= 1000 %} ${{value | divided_by: 1000 | round: 2 | times: 1}}K
    {% elsif value < 0 %} (${{value | divided_by: 1000 | round: 2 | times: -1}}K)
    {% endif %};;
}

 measure: test_5 {
   type: number
  sql: ${average_sale_price}-${total_sale_price} ;;
  value_format: "[>=0]$#,##0.00,,\"M\";[<-0]($#,##0.00,,\"M)\""
  html:
    {% if value > 1000000 %} ${{value | divided_by: 1000000 | round: 2 | times: 1}}M
    {% elsif value <= -1000000 %} (${{value | divided_by: 1000000 | round: 2 | times: -1}}M)
    {% elsif value >= 1000 %} ${{value | divided_by: 1000 | round: 2 | times: 1}}K
    {% elsif value < 0 %} (${{value | divided_by: 1000 | round: 2 | times: -1}}K)
    {% endif %};;
 }


 measure: test_6 {
   type: number
  sql: ${sale_price}-${average_sale_price} ;;
  value_format: "[>=0]$#,##0.00,,\"M\";[<-0]($#,##0.00,,\"M)\""
  html:
    {% if value > 1000000 %} ${{value | divided_by: 1000000 | round: 2 | times: 1}}M
    {% elsif value <= -1000000 %} (${{value | divided_by: 1000000 | round: 2 | times: -1}}M)
    {% elsif value >= 1000 %} ${{value | divided_by: 1000 | round: 2 | times: 1}}K
    {% elsif value < 0 %} (${{value | divided_by: 1000 | round: 2 | times: -1}}K)
    {% endif %};;
 }
  measure: test {
    type: number
    sql: ${average_sale_price} ;;
    value_format: "0.000,,\" M\""
  }
  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
    value_format_name: percent_1
  }

  measure: test_7 {
    type: number
    sql: (${average_sale_price}/nullif(${total_sale_price},0))+(${test_6}/nullif(${total_sale_price}+${test_6},0)) ;;
    value_format_name: percent_1
  }

  measure: test_17 {
    type: number
    sql: ${sale_price} / nullif(${average_sale_price},0) ;;
    value_format_name: percent_2
  }

  measure: test_18 {
    type: number
    sql: ( ${total_sale_price} -${sale_price})*10000;;
    value_format_name: decimal_0
  }
  measure: test_19 {
    type: number
    sql: ( ${average_sale_price} -${sale_price})*10000;;
    value_format_name: decimal_0
  }
}
