# sberbank-jailbreak-bypass-patch

> This is a package built upon Theos and prevents sberbank mobile app to detect Jailbreak

### Development

### Prerequisites

- Theos ([Installation](https://github.com/theos/theos/wiki/Installation))
- libsubstrate.dylib (```scp root@<phone-ip>:/usr/lib/libsubstrate.dylib $THEOS/lib```)

### Building

```bash
make package
```

### Installing on your device

```bash
make install
```
