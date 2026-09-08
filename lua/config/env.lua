-- Central access to secrets via environment variables.
-- NEVER hardcode API keys in this repo. Set these in your shell profile:
--   export AIY_API_KEY="sk-..."
--   export SML_API_KEY="sml_live__..."
local M = {}

M.aiy_api_key = os.getenv("AIY_API_KEY") or "secret"

return M
