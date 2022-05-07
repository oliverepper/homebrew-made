# Homebrew Formulae

`brew tap oliverepper/made`

## Test the package

Create a minimal program:

```sh
echo << EOF > pjsip-test.m
#define PJ_AUTOCONF 1

#include <pjsua.h>

int main()
{
	pj_init();

	return 0;
}
EOF
```

and then compile and run:

```sh
clang -isysroot $(xcode-select -p)/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk `pkg-config --libs --cflags pjproject-apple-platforms` -o pjsip-test pjsip-test.m

./pjsip-test
```

You should see:

```pre
08:40:15.580         os_core_unix.c !pjlib 2.12 for POSIX initialized
```
