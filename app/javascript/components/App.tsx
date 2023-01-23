import { Routes, Route } from "react-router-dom";
import React from 'react';
import { Container } from "./styled";
import { Videos } from "./Videos";
import { NewVideo } from "./Videos/NewVideo";

export const App: React.FC = () => {
  return (
    <Container>
      <Routes>
        <Route path="/" element={<Videos />} />
        <Route path="/videos" element={<Videos />} />
        <Route path="/videos/new" element={<NewVideo />} />
      </Routes>
    </Container>
  )
}
