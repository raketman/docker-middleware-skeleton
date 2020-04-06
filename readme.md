Skeleton for usage middleware https://github.com/raketman/middleware

Use nginx+lua subrequest to check token


Example

location /public - access all internet - check token by raketman/middleware 

```
   location /public {
        content_by_lua_block {
            local res = ngx.location.capture('/gomiddleware',
                { args = ngx.var.args, headers = ngx.header }
            )

            if res.status == 403 then
                ngx.header['Middleware-Error'] = res.body;
                ngx.exec("/403.html")
            else
                ngx.header['Middleware-Payload'] = res.body;
                ngx.exec("/200-payload.html")
            end
        }
    }
```

other location between our services integrations -  internal open ip access
