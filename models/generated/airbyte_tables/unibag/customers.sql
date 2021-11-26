{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'hash'}],
    unique_key = '_airbyte_ab_id',
    schema = "unibag",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('customers_ab3') }}
select
    _id,
    {{ adapter.quote('name') }},
    phone,
    {{ adapter.quote('statistic') }}::json->>'expenseTotal' AS stats_expense_total,
    {{ adapter.quote('statistic') }}::json->>'transactionTotal' AS stats_order_total,
    {{ adapter.quote('statistic') }}::json->>'transactionPending' AS stats_order_pending,
    {{ adapter.quote('statistic') }}::json->>'transactionSuccess' AS stats_order_success,
    {{ adapter.quote('statistic') }}::json->>'transactionRejected' AS stats_order_rejected,
    {{ adapter.quote('user') }} AS seller_id,
    {{ adapter.quote('location') }}::jsonb,
    createdat AS created_at,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_customers_hashid
from {{ ref('customers_ab3') }}
-- customers from {{ source('unibag', '_airbyte_raw_customers') }}
where 1 = 1

