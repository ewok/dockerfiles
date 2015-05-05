How to use this image
=====================

Interactive mode, with generated password:

        # Simple run
        docker run --rm -ti -p 8080:8080 ziproxy
        

Daemon mode, with password:

        # start        
        docker run -d -ti --name=ziproxy -p 8080:8080 -e PASSWORD=<pass> ziproxy
        
        #stop
        docker stop ziproxy
        
        #rm
        docker rm ziproxy
        

Configure your browser to use 8080 port for HTTP proxy.