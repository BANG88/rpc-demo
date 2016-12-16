@echo off

REM gRPC stub
echo "generating gRPC stub"

protoc ^
-I%GOPATH%/src -I. ^
-I%GOPATH%/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis ^
--go_out=Mgoogle/api/annotations.proto=github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis/google/api,plugins=grpc:. ^
your_service.proto

echo "generating gRPC stub done."

REM reverse-proxy
echo "generating reverse-proxy"

protoc ^
-I%GOPATH%/src -I. ^
-I%GOPATH%/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis ^
--grpc-gateway_out=logtostderr=true:. ^
your_service.proto

echo "generating reverse-proxy done."


REM swagger.json

echo "generating swagger.json"

protoc ^
-I%GOPATH%/src -I. ^
-I%GOPATH%/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis ^
--swagger_out=logtostderr=true:. ^
your_service.proto

echo "generating swagger.json done."



REM JS api

echo "generating JS api"

protoc ^
-I%GOPATH%/src -I. ^
-I%GOPATH%/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis ^
--cpp_out=. ^
--csharp_out=. ^
--java_out=. ^
--js_out=. ^
--objc_out=. ^
--php_out=. ^
--python_out=. ^
--ruby_out=. ^
your_service.proto

echo "generating JS api done."

