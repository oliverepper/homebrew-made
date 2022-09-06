# Homebrew Formulae

`brew tap oliverepper/made`

## pjproject-apple-platforms
PjSIP Project build (xcframework) for macOS (Intel and Apple Silicon) and iPhone (Device and Simulator on Apple Silicon)

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

## opus-apple-platforms
Opus codec build (xcframework) for macOS (Intel and Apple Silicon) and iPhone (Device and Simulator on Apple Silicon)

`brew install opus-apple-platforms`

Create a minimal program:

```sh
cat << EOF > opus-test.c
#include <opus.h>
#include <stdlib.h>

#define SAMPLE_RATE 48000
#define CHANNELS 2
#define APPLICATION OPUS_APPLICATION_AUDIO

int main() {
        int err;
        OpusEncoder *encoder;
        encoder = opus_encoder_create(SAMPLE_RATE, CHANNELS, APPLICATION, &err);
        if (err<0)
                return EXIT_FAILURE;
        return 0;
}
EOF
```

compile:

```sh
clang -isysroot $(xcode-select -p)/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk `pkg-config --libs --cflags opus-apple-platforms` -o opus-test opus-test.c
```