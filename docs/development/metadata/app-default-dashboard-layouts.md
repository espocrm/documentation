# app > defaultDashboardLayouts

Path: metadata > app > defaultDashboardLayouts.

Default dashboard layouts.

Example:

```json
{
    "Standard": [
        {
            "name": "My Espo",
            "layout": [
                {
                    "id": "defaultActivities",
                    "name": "Activities",
                    "x": 2,
                    "y": 2,
                    "width": 2,
                    "height": 2
                },
                {
                    "id": "defaultStream",
                    "name": "Stream",
                    "x": 0,
                    "y": 0,
                    "width": 2,
                    "height": 4
                },
                {
                    "id": "defaultTasks",
                    "name": "Tasks",
                    "x": 2,
                    "y": 4,
                    "width": 2,
                    "height": 2
                }
            ]
        }
    ]
}
```

The *Standard* layout is applied for new users (regular and admin) and when they reset their layout to default.
