# Docker setup for Expose

Minimal setup to run [Expose](https://github.com/beyondcode/expose) easily.

## Run

### Usage

```
docker run -it \
    -v <YOUR EXPOSE CONFIG FILE PATH>:/root/.expose/config.php \
    cangelis/expose <expose command>
```

### Examples

#### Share

```
docker run -it \
    -v /Users/cangelis/config.php:/root/.expose/config.php \
    cangelis/expose expose
```

#### Start the server

```
docker run -it cangelis/expose serve my-domain.com
```

## Docker build

```
docker build .
```
