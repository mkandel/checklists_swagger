// Code generated by go-swagger; DO NOT EDIT.

package healthcheck

// This file was generated by the swagger tool.
// Editing this file might prove futile when you re-run the generate command

import (
	"net/http"

	middleware "github.com/go-openapi/runtime/middleware"
)

// GetHealthcheckHandlerFunc turns a function with the right signature into a get healthcheck handler
type GetHealthcheckHandlerFunc func(GetHealthcheckParams) middleware.Responder

// Handle executing the request and returning a response
func (fn GetHealthcheckHandlerFunc) Handle(params GetHealthcheckParams) middleware.Responder {
	return fn(params)
}

// GetHealthcheckHandler interface for that can handle valid get healthcheck params
type GetHealthcheckHandler interface {
	Handle(GetHealthcheckParams) middleware.Responder
}

// NewGetHealthcheck creates a new http.Handler for the get healthcheck operation
func NewGetHealthcheck(ctx *middleware.Context, handler GetHealthcheckHandler) *GetHealthcheck {
	return &GetHealthcheck{Context: ctx, Handler: handler}
}

/*GetHealthcheck swagger:route GET /healthcheck healthcheck getHealthcheck

GetHealthcheck get healthcheck API

*/
type GetHealthcheck struct {
	Context *middleware.Context
	Handler GetHealthcheckHandler
}

func (o *GetHealthcheck) ServeHTTP(rw http.ResponseWriter, r *http.Request) {
	route, rCtx, _ := o.Context.RouteInfo(r)
	if rCtx != nil {
		r = rCtx
	}
	var Params = NewGetHealthcheckParams()

	if err := o.Context.BindValidRequest(r, route, &Params); err != nil { // bind params
		o.Context.Respond(rw, r, route.Produces, route, err)
		return
	}

	res := o.Handler.Handle(Params) // actually handle the request

	o.Context.Respond(rw, r, route.Produces, route, res)

}
