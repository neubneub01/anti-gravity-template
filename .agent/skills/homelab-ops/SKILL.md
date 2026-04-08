---
name: homelab-ops
description: |
  Use when working with homelab infrastructure, Proxmox, Docker containers,
  Tailscale, Cloudflare tunnels, or self-hosted services.
  Triggers on: "homelab", "proxmox", "container", "LXC", "VM",
  "tailscale", "cloudflare tunnel", "self-host", "deploy to homelab".
---

# Homelab Operations Skill

## Environment

- **Cluster**: 2-node Proxmox (source of truth: neubneub01/homelab repo â€” private)
- **Networking**: Tailscale mesh + Cloudflare tunnels for public endpoints.
- **Services**: Plex, *arr stack, Navidrome, n8n, Home Assistant, Grafana, Frigate.
- **DNS**: Cloudflare.

## CRITICAL
- **NEVER rely on stale memory for IPs, node assignments, or container details.**
- Always ask the user to paste or upload current repo contents if needed.
- Older context referencing 3 nodes is STALE â€” there are 2 nodes.

## Container Deployment Checklist

1. Define service in `docker-compose.yml` with:
   - `restart: unless-stopped`
   - Health check
   - Named volume for persistent data
   - Environment variables via `.env` file
2. Expose via Cloudflare tunnel OR Tailscale only â€” never direct port exposure.
3. Add to monitoring (Grafana dashboard / Uptime Kuma).
4. Document in homelab repo README.

## Safety
- Never run destructive Proxmox commands (`pct destroy`, `qm destroy`) without confirmation.
- Always snapshot before major changes.
- Never expose management interfaces (Proxmox UI, Portainer) publicly.
