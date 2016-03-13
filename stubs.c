#include <stdio.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/callback.h>

// simulate a function returning void leaving 2 in the return register by
// chance
value fail(void) {
    CAMLparam0();
    printf("%s\n", __PRETTY_FUNCTION__);
    CAMLreturn(2);
}

void test(value callback) {
    CAMLparam1(callback);
    CAMLlocal1(res);
    printf("%s(0x%lx)\n", __PRETTY_FUNCTION__, callback);
    res = caml_callback_exn(callback, Val_unit);
    if (Is_exception_result(res)) {
	res = Extract_exception(res);
	fprintf(stderr, "%s: callback got exception 0x%lx\n", __PRETTY_FUNCTION__, res);
    }
    CAMLreturn0;
}
