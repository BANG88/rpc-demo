package server

import (
	"net"

	example "github.com/bang88/rpc-demo/example"
	"google.golang.org/grpc"
)

func Run() error {
	l, err := net.Listen("tcp", ":9090")
	if err != nil {
		return err
	}

	s := grpc.NewServer()
	example.RegisterYourServiceServer(s, newEchoServer())

	s.Serve(l)
	return nil
}
