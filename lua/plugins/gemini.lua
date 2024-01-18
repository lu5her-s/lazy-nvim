return {
  "gera2ld/ai.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  opts = {
    api_key = "AIzaSyAp70iksdep_R5DT-97HYDhDwiPfmNPPok",
    -- The locale for the content to be defined/translated into
    locale = "en",
    -- The locale for the content in the locale above to be translated into
    alternate_locale = "zh",
    -- Define custom prompts here, see below for more details
    prompts = {},
  },
  event = "VeryLazy",
}
