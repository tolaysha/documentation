workspace {

model {
  
  admin = person "Администратор" "Управляет системой, следит за пользователями и интеграциями"
  Manager = person "Manager" "Анализирует политику доступа"

  corpLLM = softwareSystem "CorpLLM Platform" "Корпоративная LLM-платформа, развёрнутая внутри сети (on-prem)"


  

  github = softwareSystem "GitHub Enterprise" "Исходный код, PR, документация"
  notion = softwareSystem "Notion" "Рабочая база знаний и документации"
  confluence = softwareSystem "Confluence" "Историческая база знаний"
  googleDrive = softwareSystem "Google Drive (корпоративный)" "Хранилище файлов"
  slack = softwareSystem "Slack" "Коммуникации сотрудников"

  admin -> corpLLM "Управляет системой и настройками"
  Manager -> corpLLM "Анализирует аудит, политику безопасности"




  corpLLM -> github "Индексирует код, PR и документацию"
  corpLLM -> notion "Индексирует страницы и базы знаний"
  corpLLM -> confluence "Индексирует страницы"
  corpLLM -> googleDrive "Читает документы"
  corpLLM -> slack "Читает обсуждения"

}

views {
  systemContext corpLLM {
    include *
    autolayout lr
  }

  theme default
}
}
