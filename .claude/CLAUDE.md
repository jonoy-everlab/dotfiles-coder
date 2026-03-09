# Global Claude Code Behavior

## Core Rules

- NEVER handle specialized tasks in main chat
- ALWAYS delegate to specialist subagents
- Main chat is for coordination ONLY
- Use Plan mode for complex tasks

## Automatic Agent Selection (do this on EVERY task)

1. Use `voltagent-meta:agent-organizer` to decompose the task and identify required specialists
2. Use `voltagent-meta:task-distributor` to break work into subtasks and assign to the right agents
3. For multi-domain tasks, use `voltagent-meta:multi-agent-coordinator` to orchestrate parallel execution
4. Combine results with `voltagent-meta:knowledge-synthesizer`

## Volt Agent Delegation Rules

### Languages
- Python → `voltagent-lang:python-pro`
- TypeScript/JS → `voltagent-lang:typescript-pro`
- SQL → `voltagent-lang:sql-pro`
- Go → `voltagent-lang:golang-pro`
- Rust → `voltagent-lang:rust-engineer`
- Java/Spring → `voltagent-lang:java-architect` or `voltagent-lang:spring-boot-engineer`
- C# / .NET Core → `voltagent-lang:dotnet-core-expert`
- PHP → `voltagent-lang:php-pro`
- Swift → `voltagent-lang:swift-expert`
- Kotlin → `voltagent-lang:kotlin-specialist`

### Frontend / UI
- React → `voltagent-lang:react-specialist`
- Next.js → `voltagent-lang:nextjs-developer`
- Vue → `voltagent-lang:vue-expert`
- Angular → `voltagent-lang:angular-architect`
- UI/design → `voltagent-core-dev:ui-designer`

### Backend / APIs
- REST API design → `voltagent-core-dev:api-designer`
- Backend services → `voltagent-core-dev:backend-developer`
- GraphQL → `voltagent-core-dev:graphql-architect`
- Microservices → `voltagent-core-dev:microservices-architect`
- WebSockets → `voltagent-core-dev:websocket-engineer`
- Full-stack feature → `voltagent-core-dev:fullstack-developer`

### Infrastructure / DevOps
- Docker → `voltagent-infra:docker-expert`
- Kubernetes → `voltagent-infra:kubernetes-specialist`
- Terraform → `voltagent-infra:terraform-engineer`
- CI/CD pipelines → `voltagent-infra:deployment-engineer`
- DevOps general → `voltagent-infra:devops-engineer`
- SRE / reliability → `voltagent-infra:sre-engineer`
- Azure → `voltagent-infra:azure-infra-engineer`
- Cloud architecture → `voltagent-infra:cloud-architect`
- Security infra → `voltagent-infra:security-engineer`

### Quality / Security
- Debugging → `voltagent-qa-sec:debugger`
- Code review → `voltagent-qa-sec:code-reviewer`
- Security audit → `voltagent-qa-sec:security-auditor`
- Testing strategy → `voltagent-qa-sec:qa-expert`
- Test automation → `voltagent-qa-sec:test-automator`
- Performance → `voltagent-qa-sec:performance-engineer`
- Error diagnosis → `voltagent-qa-sec:error-detective`

### Data / AI
- Data pipelines → `voltagent-data-ai:data-engineer`
- ML engineering → `voltagent-data-ai:ml-engineer`
- LLM systems → `voltagent-data-ai:llm-architect`
- AI engineering → `voltagent-data-ai:ai-engineer`
- Data analysis → `voltagent-data-ai:data-analyst`
- PostgreSQL → `voltagent-data-ai:postgres-pro`
- DB optimization → `voltagent-data-ai:database-optimizer`

### Dev Experience
- Refactoring → `voltagent-dev-exp:refactoring-specialist`
- Documentation → `voltagent-dev-exp:documentation-engineer`
- CLI tools → `voltagent-dev-exp:cli-developer`
- MCP servers → `voltagent-dev-exp:mcp-developer`
- Legacy code → `voltagent-dev-exp:legacy-modernizer`

### Business / Research
- Product decisions → `voltagent-biz:product-manager`
- Technical writing → `voltagent-biz:technical-writer`
- Market research → `voltagent-research:market-researcher`
- Competitive analysis → `voltagent-research:competitive-analyst`

## Meta Agents (orchestration only)

| Agent | When to use |
|---|---|
| `voltagent-meta:agent-organizer` | Decompose any task into subtasks + assign agents |
| `voltagent-meta:task-distributor` | Distribute parallel workloads across agents |
| `voltagent-meta:multi-agent-coordinator` | Coordinate multiple concurrent agents |
| `voltagent-meta:workflow-orchestrator` | Design multi-step workflows with state |
| `voltagent-meta:knowledge-synthesizer` | Combine outputs from multiple agents |
| `voltagent-meta:context-manager` | Share state between agents |
| `voltagent-meta:error-coordinator` | Handle distributed failures |

## Orchestration Flow

1. **Analyze** → use `agent-organizer` to identify which specialists are needed
2. **Distribute** → use `task-distributor` to assign subtasks in parallel where possible
3. **Execute** → delegate each subtask to the appropriate volt agent above
4. **Synthesize** → use `knowledge-synthesizer` to combine results into a coherent response

## Fallback Discovery

If no volt agent matches:
1. Search catalog: `/subagent-catalog:search <topic>`
2. Browse all: `/subagent-catalog:list`
3. Install missing: `agent-installer`
