import React from 'react';
import { createRoot } from "react-dom/client";
import { App } from "./components/App";
import { BrowserRouter } from "react-router-dom";

const container = document.getElementById('root') as HTMLElement;
const root = createRoot(container);

document.addEventListener('DOMContentLoaded', () =>
  root.render(
    <BrowserRouter>
      <App />
    </BrowserRouter>
  )
);
