---
mode: 'agent'
model: Claude Sonnet 4
description: "Additional instructions on how to generate this project's blueprint"
---

Use this prompt as a base: [Project Folder Structure Blueprint Generator](./downloaded/folder-structure-blueprint-generator.prompt.md)

### About generated code

- The generated code can be found in files listed under the analyzer's exclude section of `${workspaceFolder}/app/analysis_options.yaml`.

- You must focus on manually written code to determine the project's structure, as the generated code is not a good example of proper structure.

### About Riverpod

- Since your familiarity with Riverpod and AsyncValue is limited, rely on the existing code in the project to understand how to use them. If you find any code that uses Riverpod or AsyncValue, you can use it as a reference for your examples.

### About Drift

- Same with Riverpod, your familiarity with Drift is limited. Use the existing code in the project to understand how to use it. If you find any code that uses Drift, you can use it as a reference for your examples.

### Creating examples

- Create examples of how to create new features in the project, such as adding a new screen or implementing a new service. Use the existing code as a reference for how to structure your examples.

- When you're writing examples, try to follow the patterns from manually written code instead of the generated code.

- You don't need to create full example implementations, just enough code to illustrate the structure of the new feature.

- Examples must closely resemble the existing code. If the existing code uses a specific pattern or structure, your examples should follow that pattern. This will help maintain consistency across the project.
