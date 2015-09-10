/// <reference path="../typings/tsd.d.ts" />
import http = require("http");
import url = require("url");
import routerModule = require("./routerModule");

export class ServerAPI{
    router: routerModule.Router;
    
    constructor(router: routerModule.Router){
        this.router = router;
    }
    
    public initServer(): void{
        var server: http.Server = http.createServer(
            (request: http.ServerRequest, response: http.ServerResponse) =>
                this.requestHandler(request, response));
        server.listen("5000", () => {
                console.log("Server listen localhost:5000 port!");
        });
    }
    
    private requestHandler(request:http.ServerRequest, response:http.ServerResponse):void{
        var pathname = url.parse(request.url).pathname;
        
        this.router.route(pathname);
        
        response.writeHead(200, {"Content-Type": "text/plain"});
        response.write("hello world");
        response.end();
    }
}