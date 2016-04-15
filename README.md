# GitBoard

Proof of concept tool to text files to manage a scrum board using atom and git.

Currently it only supports task points counting.

Sample format:

```
- Sprint Management
  - [ ] 1 Multiple story parsing
    - Each story is in a different .md
  - [ ] 2 Start end end dates
- Board View
  - [ ] 3 Design
  - [ ] 4 Framework
    -
  - [ ] 5 Drag tasks to change status
    - ! Blocked by lack of design
```

# TODO
- Syntax + Parsers (tentative syntax)
  - [x] Unassigned task: `- [ ] # description`
  - [ ] Assigned task: `- [assignee] # description`
  - [ ] Completed task: `- [x] description`
  - [ ] Comment: `- comment`
  - [ ] Block: `- !block description`
  - [ ] Custom
- Status View
  - [x] Sum of task points
  - [x] Number of tasks
  - [ ] Status pane
  - [ ] Task status summary (assignment, blocks).
  - [ ] Graphs (Using D3?)
- Sprint Management
  - [ ] Multiple story parsing
  - [ ] Start end end dates
- Board View
  - [ ] Design
  - [ ] Framework
  - [ ] Drag tasks to change status
  - [ ] Position text editor cursor when selected
- Meta
  - [ ] File validation
