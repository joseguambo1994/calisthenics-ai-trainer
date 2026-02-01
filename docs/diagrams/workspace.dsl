workspace "Calisthenics AI Trainer - C4" "C4 diagrams exported as SVG" {
  model {
    user = person "Athlete" "Uploads videos and receives feedback"
    system = softwareSystem "Calisthenics AI Trainer" "Analyzes videos and returns actionable feedback" {
      web = container "Web App" "UI for upload and feedback" "React"
      api = container "API" "Orchestration and backend" ".NET 8"
      ai  = container "AI Service" "Pose estimation + feedback generation" "Python"
      db  = container "Database" "Stores users/jobs/results" "PostgreSQL"
    }

    user -> web "Uses"
    web -> api "Calls"
    api -> ai "Sends jobs/videos"
    api -> db "Reads/Writes"
  }

  views {
    systemContext system {
      include *
      autolayout lr
    }

    container system {
      include *
      autolayout lr
    }
  }
}
