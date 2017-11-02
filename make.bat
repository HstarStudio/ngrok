SET GOPATH=%__CD__%

set BUILDTAGS=debug

go fmt ngrok/...

echo "fmt ok"

go get github.com/jteeuwen/go-bindata/go-bindata
echo "bin/go-bindata ok"

"bin\go-bindata.exe" -nomemcopy -pkg=assets -tags=%BUILDTAGS% -debug=false -o=src/ngrok/client/assets/assets_%BUILDTAGS%.go assets/client/...
echo "client-assets ok"

"bin\go-bindata.exe" -nomemcopy -pkg=assets -tags=%BUILDTAGS% -debug=false -o=src/ngrok/server/assets/assets_%BUILDTAGS%.go assets/server/...
echo "server-assets ok"

echo "assets ok"

go get -tags '%BUILDTAGS%' -d -v ngrok/...

echo "deps ok"

go install -tags '%BUILDTAGS%' ngrok/main/ngrok

echo "client ok"

go install -tags '%BUILDTAGS%' ngrok/main/ngrokd

echo "server ok"

cmd