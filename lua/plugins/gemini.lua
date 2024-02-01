return {
  "gera2ld/ai.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  opts = {
    api_key = "AIzaSyAp70iksdep_R5DT-97HYDhDwiPfmNPPok",
    -- The locale for the content to be defined/translated into
    locale = "en",
    -- The locale for the content in the locale above to be translated into
    alternate_locale = "th",
    -- Define custom prompts here, see below for more details
    prompts = {
      refactor = {
        command = "GeminiRefactor",
        loading_tpl = "Loading...",
        prompt_tpl = "Refactor the following code: ${input}",
        result_tpl = "Code refactored successfully: \n\n${output}",
        require_input = true,
      },
      optimize = {
        command = "GeminiOptimize",
        loading_tpl = "Loading...",
        prompt_tpl = "Optimize the following code: ${input}",
        result_tpl = "Code optimized successfully: \n\n${output}",
        require_input = true,
      },
      free_prompt = {
        command = "Gemini",
        loading_tpl = "Question:\n\n${input}\n\n${input_encoded}\n\nAsking Gemini...",
        prompt_tpl = "${input}\n\n${input_encoded}",
        result_tpl = "Question:\n\n${input_encoded}\n\n${input}\n\nAnswer:\n\n${output}",
        require_input = true,
      },
    },
  },
  event = "VeryLazy",
}
