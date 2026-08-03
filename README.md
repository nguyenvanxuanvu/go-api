# go-api

Basic Go API starter (net/http) with Kubernetes + GitHub Actions CI/CD.

## Endpoints
- `GET /healthz`
- `GET /api/v1/hello`

## Run locally
```bash
go run ./cmd/server
curl http://localhost:8080/healthz
curl http://localhost:8080/api/v1/hello
```

## GitHub Secrets required
- `KUBE_CONFIG`: kubeconfig content for your k3s cluster.

## CI/CD behavior
- On push to `main`, workflow builds image and pushes to GHCR.
- Then deploys to `dev` overlay using `kubectl apply -k` and waits for rollout.

## Customize image name
Workflow uses:
- `ghcr.io/<owner>/<repo>:<commit-sha>`
