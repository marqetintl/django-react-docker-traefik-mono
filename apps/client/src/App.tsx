import { Counter } from '@miq/ui/components/counter';

import './App.css';

export default function App() {
  return (
    <>
      <div className="flex">
        <a href="https://www.djangoproject.com/" target="_blank">
          <img src="/media/django.svg" className="logo django" alt="Django logo" />
        </a>
        <a href="https://vitejs.dev" target="_blank">
          <img src="/static/vite.svg" className="logo" alt="Vite logo" />
        </a>
        <a href="https://react.dev" target="_blank">
          <img src="/static/react.svg" className="logo react" alt="React logo" />
        </a>
      </div>
      <h1>Django + Vite + React</h1>

      <div className="card">
        <Counter initialCount={1} />

        <p>
          Edit <code>src/App.tsx</code> and save to test HMR
        </p>
      </div>
      <p className="read-the-docs">Click on the Vite and React logos to learn more</p>
    </>
  );
}
