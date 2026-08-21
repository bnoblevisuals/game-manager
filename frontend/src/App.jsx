import { useEffect, useState } from 'react'

function App() {
  const [message, setMessage] = useState('Connecting to API...')

  useEffect(() => {
    fetch('http://localhost:8080/api/health')
      .then((response) => response.text())
      .then((data) => setMessage(data))
      .catch(() => setMessage('Could not connect to API'))
  }, [])

  return (
    <div>
      <h1>Game Manager</h1>
      <p>{message}</p>
    </div>
  )
}

export default App