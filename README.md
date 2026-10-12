# Orien's plugins

My intention is to make my explanation and teaching preferences easy to install across assistants, together or separately.

A skill is a set of written instructions that an assistant follows for a particular task. A plugin is an installable package that bundles skills. This repository contains one plugin, `oriens-plugins`, with two skills:

- `response-formatter` makes explanations grammatical, defines unfamiliar terms before using them, and shows actual code behavior instead of invented summaries.
- `baby-steps` teaches one parameter, expression, or helper at a time, with concrete inputs, outputs, and recursively defined terms.

These are public editions of my personal skills. Work-specific examples have been replaced with generic guidance and examples.

## Install the plugin in GitHub Copilot CLI

My intention with this section is to install both skills with one command.

Run this command in your terminal:

```sh
copilot plugin install zhangori000/oriens-plugins
```

In an interactive Copilot CLI session, you can instead run:

```text
/plugin install zhangori000/oriens-plugins
```

Start a new session after installation. Use `/skills list` to see the available skills, and use `/baby-steps` or `/response-formatter` to request one explicitly. The assistant can also select a skill when your request matches its description.

## Install the skills without the plugin

My intention with this section is to let you use the same instructions in other assistants supported by the Skills CLI.

Install both skills with:

```sh
npx skills add zhangori000/oriens-plugins
```

Install just one skill with:

```sh
npx skills add zhangori000/oriens-plugins --skill response-formatter
npx skills add zhangori000/oriens-plugins --skill baby-steps
```

The installer lets you choose which assistants receive the skills. Its supported assistants include Claude Code, Codex, Cursor, Gemini CLI, GitHub Copilot, Grok Build, OpenCode, and Windsurf.

For example, install both skills for Grok Build with:

```sh
npx skills add zhangori000/oriens-plugins --agent grok --skill '*'
```

Install both for several assistants with:

```sh
npx skills add zhangori000/oriens-plugins --agent claude-code codex cursor gemini-cli grok opencode --skill '*'
```

Add `--global` if you want the skills available across projects instead of only in the current project.

## Install the plugin in Claude Code

My intention with this section is to install both skills through Claude Code's native plugin system.

Run these commands in your terminal:

```sh
claude plugin marketplace add zhangori000/oriens-plugins
claude plugin install oriens-plugins@oriens-plugins
```

The same commands are available inside Claude Code with the `/plugin` prefix:

```text
/plugin marketplace add zhangori000/oriens-plugins
/plugin install oriens-plugins@oriens-plugins
```

After installation, start a new session and invoke `/oriens-plugins:baby-steps` or `/oriens-plugins:response-formatter`. Claude Code prefixes plugin skills with the plugin's name.

Choose either the plugin installation or the separate skill installation for a given assistant to avoid loading duplicate copies.

## Compatibility and other chat applications

My intention with this section is to distinguish installable support from using the same instructions manually.

Both skills use the open [Agent Skills format](https://agentskills.io), with instructions in `skills/<name>/SKILL.md`. They require no particular model, executable, server, API key, or account.

GitHub Copilot CLI and Claude Code have native plugin packaging in this repository. Other assistants that support Agent Skills can install the skills with the [Skills CLI](https://github.com/vercel-labs/skills), or receive the skill folders in their documented skill directory.

Grok Build is listed as `grok` in the Skills CLI. This does not mean that the Grok website or every third-party Grok client has a plugin installer. For a chat application without skill support, paste the instructions below the opening metadata block from either `SKILL.md` into its custom instructions, project instructions, or the conversation. This is manual instruction use, not native plugin support.

No package can guarantee installation in every assistant or guarantee that every model follows every instruction. The instructions remain readable and reusable even when an application has no plugin or skill system.

## How the skills work together

My intention with this section is to explain which instructions take precedence when both skills are active.

`response-formatter` supplies the general writing rules. `baby-steps` supplies the detailed teaching order. When their ordering rules disagree, `baby-steps` takes precedence: show the real source before a translation, and explain helpers before their callers, while still identifying the caller and consumer before interpreting a returned value.

## Repository structure

My intention with this section is to show where the installable instructions live.

```text
oriens-plugins/
|-- plugin.json
|-- README.md
|-- .claude-plugin/
|   |-- plugin.json
|   `-- marketplace.json
`-- skills/
    |-- response-formatter/
    |   `-- SKILL.md
    `-- baby-steps/
        `-- SKILL.md
```

The root `plugin.json` follows the Agent Plugins 1.0 format. `.claude-plugin/` contains Claude Code's plugin definition and the catalog needed to install it from GitHub. Both definitions load the same `skills/` files, so the instructions do not diverge between assistants.

Each `SKILL.md` contains the skill's name, description, and instructions.
