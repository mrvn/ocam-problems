#include <stdio.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>

value weak;

void setup(value ml_weak) {
    CAMLparam1(ml_weak);
    printf("%s(0x%lx)\n", __PRETTY_FUNCTION__, ml_weak);
    weak = ml_weak;
    caml_register_generational_global_root(&weak);
    CAMLreturn0;
}

void test(void) {
    CAMLparam0();
    CAMLlocal1(obj);
    printf("%s\n", __PRETTY_FUNCTION__);
    printf("  weak = 0x%lx\n", weak);
    if (weak != 0) {
	obj = Field(weak, 1);
	printf("  obj = 0x%lx\n", obj);
	if (obj != 0) {
	    printf("  tag = %d\n", Tag_val(obj));
	}
    }
    printf("%s done\n", __PRETTY_FUNCTION__);
    CAMLreturn0;
}
