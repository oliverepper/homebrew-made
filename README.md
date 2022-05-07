# Homebrew Formulae

`brew tap oliverepper/made`

## pjproject-apple-platforms

`brew install pjproject-apple-platforms`

Create a minimal program:

```sh
cat << EOF > pjsip-test.m
#define PJ_AUTOCONF 1

#include <pjsua.h>

int main()
{
	pj_init();

	return 0;
}
EOF
```

compile:

```sh
clang -isysroot $(xcode-select -p)/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk `pkg-config --libs --cflags pjproject-apple-platforms` -o pjsip-test pjsip-test.m
```

run:

```sh
./pjsip-test
```

You should see:

```pre
08:40:15.580         os_core_unix.c !pjlib 2.12 for POSIX initialized
```
