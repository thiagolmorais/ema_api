# SwaggerClient::CustomersApi

All URIs are relative to *https://virtserver.swaggerhub.com/Fatec/EMA_api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**api_customers_customer_id_get**](CustomersApi.md#api_customers_customer_id_get) | **GET** /api/customers/{customer_id} | Find all customers
[**api_customers_get**](CustomersApi.md#api_customers_get) | **GET** /api/customers | Find all customers
[**api_customers_post**](CustomersApi.md#api_customers_post) | **POST** /api/customers | Create Customer


# **api_customers_customer_id_get**
> Customer api_customers_customer_id_get(customer_id)

Find all customers

Find all customers

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::CustomersApi.new

customer_id = 56 # Integer | ID of customer to return


begin
  #Find all customers
  result = api_instance.api_customers_customer_id_get(customer_id)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling CustomersApi->api_customers_customer_id_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customer_id** | **Integer**| ID of customer to return | 

### Return type

[**Customer**](Customer.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **api_customers_get**
> Customer api_customers_get

Find all customers

Find all customers

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::CustomersApi.new

begin
  #Find all customers
  result = api_instance.api_customers_get
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling CustomersApi->api_customers_get: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Customer**](Customer.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **api_customers_post**
> InlineResponse201 api_customers_post(opts)

Create Customer

Create a customer

### Example
```ruby
# load the gem
require 'swagger_client'

api_instance = SwaggerClient::CustomersApi.new

opts = { 
  customer: SwaggerClient::Customer1.new # Customer1 | Params valid
}

begin
  #Create Customer
  result = api_instance.api_customers_post(opts)
  p result
rescue SwaggerClient::ApiError => e
  puts "Exception when calling CustomersApi->api_customers_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customer** | [**Customer1**](Customer1.md)| Params valid | [optional] 

### Return type

[**InlineResponse201**](InlineResponse201.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



