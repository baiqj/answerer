module.exports =
  categories: """
    id    SERIAL PRIMARY KEY,
    title TEXT
  """
  questions: """
    id       SERIAL PRIMARY KEY,
    category INTEGER,
    title    TEXT,
    answers  TEXT[4],
    FOREIGN KEY (category) REFERENCES categories ON DELETE SET NULL
  """