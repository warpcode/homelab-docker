# Homelab Docker Stacks

This repository serves as a centralized collection of Docker Compose stacks for managing various applications within a homelab environment. The primary goal is to provide a robust, reproducible, and easily manageable setup for disaster recovery and consistent deployment.

## Structure

The repository is organized into logical "stacks" under the `stacks/` directory. Each stack contains a `docker-compose.yml` file and associated configuration, grouping related services together.

- **`stacks/ai/`**: Services related to Artificial Intelligence, including LLM inference servers and AI chat interfaces.
- **`stacks/documents/`**: Document management and processing services.
- **`stacks/management/`**: Tools for Docker environment management (e.g., Portainer, Watchtower).
- **`stacks/mcp/`**: Services related to Model Context Protocol (MCP) implementations and tools.
- **`stacks/n8n/`**: n8n automation suite for workflow orchestration and API integrations.
- **`stacks/proxy/`**: Traefik reverse proxy for routing and SSL termination.
- **`stacks/recipes/`**: Recipe management and meal planning applications.

The `old/` directory contains older or alternative Docker Compose configurations that are not actively used but kept for reference.

## Key Technologies

- **Docker Swarm**: For container orchestration and service management.
- **Docker Compose**: For defining multi-container applications (used with `docker stack deploy`).
- **Traefik**: Used as a reverse proxy for all web-facing services. It handles routing requests to the correct container and manages SSL certificates (self-signed for `.localhost` domains or Let's Encrypt for public domains).
  - The `BASE_HOSTNAME` environment variable can be used to customize the base domain for services. If not set, services will default to `*.localhost`.

## Services and Default URLs (when `BASE_HOSTNAME` is `localhost`)

Here's a list of the main services and their default access URLs:

- **Portainer**: `https://portainer.localhost`
- **Pi-hole**: `https://pihole.localhost`
- **LiteLLM**: `http://litellm.ai.localhost` (HTTPS commented out in config)
- **Open-WebUI**: `https://ai.localhost`
- **n8n**: `https://n8n.localhost`
- **Watchtower**: `https://watchtower.localhost`
- **Traefik Dashboard**: `https://proxy.localhost`
- **Mealie (Recipes)**: `https://recipes.localhost`

## Dependencies

- **Docker**: The core dependency for running all services.
- **Keepass database**: Recommended for securely managing secrets and credentials.

## Goals

- **Disaster Recovery**: Enable quick and reliable rebuilding of the entire homelab application stack.
- **Management**: Provide a structured and manageable way to deploy, update, and maintain applications.
- **Consistency**: Ensure consistent environments across deployments.
