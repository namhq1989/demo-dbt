{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'hash'}],
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_unibag",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('orders_ab1') }}
select
    cast(_id as {{ dbt_utils.type_string() }}) as _id,
    cast(code as {{ dbt_utils.type_string() }}) as code,
    cast({{ adapter.quote('date') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('date') }},
    cast({{ adapter.quote('hour') }} as {{ dbt_utils.type_float() }}) as {{ adapter.quote('hour') }},
    cast(note as {{ dbt_utils.type_string() }}) as note,
    cast(shop as {{ dbt_utils.type_string() }}) as shop,
    tags,
    cast({{ adapter.quote('user') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('user') }},
    cast(price as {{ type_json() }}) as price,
    {{ cast_to_boolean('banned') }} as banned,
    cast(reason as {{ dbt_utils.type_string() }}) as reason,
    cast({{ adapter.quote('source') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('source') }},
    cast(status as {{ dbt_utils.type_string() }}) as status,
    cast(teamid as {{ dbt_utils.type_string() }}) as teamid,
    cast({{ adapter.quote('update') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('update') }},
    cast(payment as {{ type_json() }}) as payment,
    cast(remarks as {{ dbt_utils.type_string() }}) as remarks,
    cast(customer as {{ dbt_utils.type_string() }}) as customer,
    cast(delivery as {{ type_json() }}) as delivery,
    {{ cast_to_boolean('iscalled') }} as iscalled,
    cast(merchant as {{ type_json() }}) as merchant,
    cast(pickupat as {{ dbt_utils.type_string() }}) as pickupat,
    cast(supplier as {{ type_json() }}) as supplier,
    cast(createdat as {{ dbt_utils.type_string() }}) as createdat,
    cast(inventory as {{ type_json() }}) as inventory,
    cast(invoiceid as {{ dbt_utils.type_string() }}) as invoiceid,
    {{ cast_to_boolean('isdeleted') }} as isdeleted,
    cast(promotion as {{ type_json() }}) as promotion,
    cast(requestid as {{ dbt_utils.type_string() }}) as requestid,
    cast(sendemail as {{ type_json() }}) as sendemail,
    cast(teambonus as {{ dbt_utils.type_string() }}) as teambonus,
    cast(totalitem as {{ dbt_utils.type_float() }}) as totalitem,
    cast(updatedat as {{ dbt_utils.type_string() }}) as updatedat,
    cast(useragent as {{ type_json() }}) as useragent,
    {{ cast_to_boolean('wholesale') }} as wholesale,
    cast(approvedat as {{ dbt_utils.type_string() }}) as approvedat,
    cast(cashbackat as {{ dbt_utils.type_string() }}) as cashbackat,
    cast(codeosiris as {{ dbt_utils.type_string() }}) as codeosiris,
    cast(membership as {{ dbt_utils.type_string() }}) as membership,
    cast(rejectedat as {{ dbt_utils.type_string() }}) as rejectedat,
    cast(deliveredat as {{ dbt_utils.type_string() }}) as deliveredat,
    cast(deliveringat as {{ dbt_utils.type_string() }}) as deliveringat,
    cast(deliverycode as {{ dbt_utils.type_string() }}) as deliverycode,
    cast(searchstring as {{ dbt_utils.type_string() }}) as searchstring,
    cast(staffapprove as {{ dbt_utils.type_string() }}) as staffapprove,
    cast(teammemberid as {{ dbt_utils.type_string() }}) as teammemberid,
    cast(trackingcode as {{ dbt_utils.type_string() }}) as trackingcode,
    cast(processstatus as {{ dbt_utils.type_string() }}) as processstatus,
    cast(hooktimelastat as {{ dbt_utils.type_string() }}) as hooktimelastat,
    {{ cast_to_boolean('isassigncoupon') }} as isassigncoupon,
    {{ cast_to_boolean('isautoapproved') }} as isautoapproved,
    cast(trackingcodeurl as {{ dbt_utils.type_string() }}) as trackingcodeurl,
    {{ cast_to_boolean('ischangedelivery') }} as ischangedelivery,
    cast(trackingordercode as {{ dbt_utils.type_string() }}) as trackingordercode,
    cast(estimatecashbackat as {{ dbt_utils.type_string() }}) as estimatecashbackat,
    {{ cast_to_boolean('fromnewactivebuyer') }} as fromnewactivebuyer,
    {{ cast_to_boolean('iswaitingcancelled') }} as iswaitingcancelled,
    {{ cast_to_boolean('fromnewactiveseller') }} as fromnewactiveseller,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('orders_ab1') }}
-- orders
where 1 = 1
